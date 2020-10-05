(set-logic BV)
(define-fun ehad ((x (_ BitVec 64))) (_ BitVec 64) (bvlshr x #x0000000000000001))
(define-fun arba ((x (_ BitVec 64))) (_ BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shesh ((x (_ BitVec 64))) (_ BitVec 64) (bvlshr x #x0000000000000010))
(define-fun smol ((x (_ BitVec 64))) (_ BitVec 64) (bvshl x #x0000000000000001))
(define-fun im ((x (_ BitVec 64)) (y (_ BitVec 64)) (z (_ BitVec 64))) (_ BitVec 64) (ite (= x #x0000000000000001) y z))
(synth-fun f ((x (_ BitVec 64))) (_ BitVec 64)
    ((Start (_ BitVec 64)))
    ((Start (_ BitVec 64) (#x0000000000000000 #x0000000000000001 x (bvnot Start) (smol Start) (ehad Start) (arba Start) (shesh Start) (bvand Start Start) (bvor Start Start) (bvxor Start Start) (bvadd Start Start) (im Start Start Start)))))
(constraint (= (f #x0BDDF11F0C76D413) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x1127050A71A8EE45) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x03A99C27FC76C80B) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x0AA686514AF76037) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #xE03C230A50B5439B) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x00000001D6E86D7F) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x000000018E777E39) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x00000001AD693A25) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x00000001DFDDE913) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x000000017927CFC5) #xFFFFFFFFFFFFFFFE))
(constraint (= (f #x000000000018AD43) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x000000000012CCA5) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x0000000000199F89) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x00000000001F2225) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #x00000000001B5CB7) #xFFFFFFFFFFFFFFFF))
(constraint (= (f #xF21713DBFA914324) #x03A71B2E4FC130EA))
(constraint (= (f #x833F37A490EFEF96) #x01EAFA9C493B3F3D))
(constraint (= (f #x74812FC3BD6E6432) #x0189F23EECE1354E))
(constraint (= (f #x62426688BE577B56) #x0164E55198F419C8))
(constraint (= (f #xCCC1A4BB396AFB0A) #x02AAF448CAD103CB))
(constraint (= (f #x000000019B757194) #x000000000AB67E4A))
(constraint (= (f #x000000014102AD4E) #x000000000F0C1FDF))
(constraint (= (f #x0000000120246D34) #x000000000D81B2DD))
(constraint (= (f #x00000001AD09B07E) #x000000000BDC6B42))
(constraint (= (f #x0000000185B868C6) #x000000000A3B22E5))
(constraint (= (f #x00000000001C3240) #x03FFFFFFFFFF6EA4))
(constraint (= (f #x000000000013D10E) #x03FFFFFFFFFF2E33))
(constraint (= (f #x0000000000171E3C) #x03FFFFFFFFFF1B76))
(constraint (= (f #x0000000000163D1A) #x03FFFFFFFFFF16E3))
(constraint (= (f #x00000000001AFC0E) #x03FFFFFFFFFF43EF))
(check-synth)