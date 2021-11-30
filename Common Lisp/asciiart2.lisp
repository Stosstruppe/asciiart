; asciiart Common Lisp (sbcl 1.4.16)

(defun mandel (i a b ca cb)
    (if (= i 16) (princ " ")
        (let ((an (+ (- (* a a) (* b b)) ca))
            (bn (+ (* 2 a b) cb)))
            (if (> (+ (* an an) (* bn bn)) 4)
                (princ (format nil "~X" i))
                (mandel (+ i 1) an bn ca cb)))))

(loop for y from -12 to 12 do
    (loop for x from -39 to 39 do
        (let ((ca (* x 0.0458))
              (cb (* y 0.08333)))
            (mandel 0 ca cb ca cb)))
    (fresh-line))
