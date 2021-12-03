; asciiart Scheme (chicken 4.13)
(use srfi-13)  ; string-upcase

(define (mandel i a b ca cb)
    (if (= i 16)
        (display " ")
        (let ((an (+ (- (* a a) (* b b)) ca))
              (bn (+ (* 2 a b) cb)))
            (if (> (+ (* an an) (* bn bn)) 4)
                (display (string-upcase (format "~X" i)))
                (mandel (add1 i) an bn ca cb)))))

(do ((y -12 (add1 y))) ((> y 12))
    (do ((x -39 (add1 x))) ((> x 39))
        (let ((ca (* x 0.0458))
              (cb (* y 0.08333)))
            (mandel 0 ca cb ca cb)))
    (newline))
