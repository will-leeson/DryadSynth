import java.util.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import com.microsoft.z3.*;
import java.util.logging.Logger;
import com.microsoft.z3.enumerations.Z3_ast_print_mode;

public class Synth {
	public static void main(String[] args) throws Exception {

		long startTime = System.currentTimeMillis();

		ANTLRFileStream input = new ANTLRFileStream(args[0]);
		SygusLexer lexer = new SygusLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		SygusParser parser = new SygusParser(tokens);
		Logger logger = Logger.getLogger("main");

		HashMap<String, String> cfg = new HashMap<String, String>();
		cfg.put("model", "true");
		Context ctx = new Context(cfg);
		ctx.setPrintMode(Z3_ast_print_mode.Z3_PRINT_SMTLIB_FULL);
		//Context z3ctx = new Context();

		ANTLRErrorStrategy es = new CustomErrorStrategy();
		parser.setErrorHandler(es);

		ParseTree tree;
		try{
			tree = parser.start();
			logger.info("Accepted");
		} catch(Exception ex) {
			logger.info("Not Accepted");
			return;
		}

		ParseTreeWalker walker = new ParseTreeWalker();
		SygusExtractor extractor = new SygusExtractor(ctx);
		walker.walk(extractor, tree);

		logger.info("Final Constraints:");
		logger.info(extractor.finalConstraint.toString());

		Cegis test = new Cegis(ctx, extractor, logger);
		test.run();

		long estimatedTime = System.currentTimeMillis() - startTime;
		logger.info("Runtime: " + estimatedTime);

		/*System.out.println("Synth requests:");
		for(FuncDecl func : extractor.requests.values()) {
			System.out.println("Name:" + func.getName());
			for(Sort sort : func.getDomain()) {
				System.out.println("Has argument with type " + sort.getName());
			}
			System.out.println("Return type is " + func.getRange().getName());
		}

		System.out.println("Defined variables:");
		for(Expr expr: extractor.vars.values()) {
			System.out.println("Name:" + expr.toString() + " Type:" + expr.getSort().toString());
		}

		System.out.println("Defined functions:");
		for(DefinedFunc func: extractor.funcs.values()) {
			System.out.println("Name:" + func.getName() + " Definition:" + func.toString());
		}

		System.out.println("Constraints:");
		for (Expr expr: extractor.constraints) {
			System.out.println(expr);
		}

		System.out.println("Final Constraints:");
		System.out.println(extractor.finalConstraint);*/

	}
}

class CustomErrorStrategy extends DefaultErrorStrategy{
	@Override
	public void reportError(Parser recognizer, RecognitionException e){
		throw e;
	}
}
