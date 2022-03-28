import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;


public class Utils {
    public static void dumpSMT(String query){
		File file = new File(Synth.queryName+"/Query"+Synth.queryNumber+".smt2");

		Synth.queryNumber++;

		query = "(set-info :smt-lib-version 2.6)\n(set-logic AUFLIA)\n" + query + "(check-sat)\n";
	
		try(FileOutputStream fos = new FileOutputStream(file); 
			BufferedOutputStream bos = new BufferedOutputStream(fos)){
				byte[] bytes = query.getBytes();
				bos.write(bytes);
				bos.close();
				fos.close();
			} catch (IOException e){
				e.printStackTrace();
			}

	}

}
