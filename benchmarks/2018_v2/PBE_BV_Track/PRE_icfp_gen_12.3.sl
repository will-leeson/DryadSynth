(set-logic BV)
(define-fun ehad ((x (_ BitVec 64))) (_ BitVec 64) (bvlshr x #x0000000000000001))
(define-fun arba ((x (_ BitVec 64))) (_ BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shesh ((x (_ BitVec 64))) (_ BitVec 64) (bvlshr x #x0000000000000010))
(define-fun smol ((x (_ BitVec 64))) (_ BitVec 64) (bvshl x #x0000000000000001))
(define-fun im ((x (_ BitVec 64)) (y (_ BitVec 64)) (z (_ BitVec 64))) (_ BitVec 64) (ite (= x #x0000000000000001) y z))
(synth-fun f ((x (_ BitVec 64))) (_ BitVec 64)
    ((Start (_ BitVec 64)))
    ((Start (_ BitVec 64) (#x0000000000000000 #x0000000000000001 x (bvnot Start) (smol Start) (ehad Start) (arba Start) (shesh Start) (bvand Start Start) (bvor Start Start) (bvxor Start Start) (bvadd Start Start) (im Start Start Start)))))
(constraint (= (f #x9D9EE93D82ADC32A) #x000009D9EE93D82A))
(constraint (= (f #x9016EB224D58D8A2) #x000009016EB224D5))
(constraint (= (f #xE2A685C3E36DB97C) #x00000E2A685C3E36))
(constraint (= (f #x37EC9BAD550B1D28) #x0000037EC9BAD550))
(constraint (= (f #x8797634156A6A424) #x000008797634156A))
(constraint (= (f #x9F5587B5798FACF5) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x3ACC30EE9A0A52C1) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x5363BD48D58A798D) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x68FC4B97589B8A6F) #xFFFFFFFFFFFFFFE0))
(constraint (= (f #xE9AC2AF59CE12A87) #xFFFFFFFFFFFFFFF0))
(constraint (= (f #x5212954A50145529) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x15254448A2954925) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x88A8A42292A88291) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x40128524A8A20A21) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x2055524000854081) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x0000000000000001) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x2794B4F64D1E5BB1) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x5EC17FDEAD41C85E) #x000005EC17FDEAD4))
(constraint (= (f #xA34C10BE71AEFD89) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x2CBC31E94A103B0D) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #xB185BE02AC1733E7) #xFFFFFFFFFFFFFFF0))
(constraint (= (f #xF247D15909BC11B5) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x803B822B014B7D77) #xFFFFFFFFFFFFFFF0))
(constraint (= (f #x7863AC8FF76D2022) #x000007863AC8FF76))
(constraint (= (f #xA7F4DFB36702CEE8) #x00000A7F4DFB3670))
(constraint (= (f #x69B6BFFCA972EE7C) #x0000069B6BFFCA97))
(constraint (= (f #x0000000000000001) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x5545215450904905) #xFFFFFFFFFFFFFFFC))
(constraint (= (f #x4964A5F436F5ECC0) #x000004964A5F436F))
(constraint (= (f #x48C8291F3756AB62) #x0000048C8291F375))
(constraint (= (f #x806907508D4AC673) #xFFFFFFFFFFFFFFF8))
(constraint (= (f #x4618AAF5DB60B11F) #xFFFFFFFFFFFFFFC0))
(check-synth)