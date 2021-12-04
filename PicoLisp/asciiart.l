; asciiart PicoLisp
(setq *Scl 5)
(setq denom 100000)

(de mandel (i a b ca cb)
    (if (= i 16)
        (prin " ")
        (let (an (+ (/ (- (* a a) (* b b)) denom) ca)
              bn (+ (/ (* 2 a b) denom) cb))
            (if (> (/ (+ (* an an) (* bn bn)) denom) 4.0)
                (prin (char (if (< i 10) (+ i 48) (+ i 55))))
                (mandel (inc i) an bn ca cb)))))

(for (y -12 (>= 12 y) (inc y))
	(for (x -39 (>= 39 x) (inc x))
        (let (ca (* x 0.0458)
              cb (* y 0.08333))
            (mandel 0 ca cb ca cb)))
	(prin "\n"))
