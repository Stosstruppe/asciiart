# sbcl
(defvar a)
(defvar b)
(defvar tmp)
(defvar ca)
(defvar cb)
(defvar s)

(loop for y from -12 to 12 do
    (loop for x from -39 to 39 do
        (setq ca (* x 0.0458))
        (setq cb (* y 0.08333))
        (setq a ca)
        (setq b cb)
        (setq s " ")
        (loop for i from 0 to 15 do
            (setq tmp (+ (- (* a a) (* b b)) ca))
            (setq b (+ (* 2 a b) cb))
            (setq a tmp)
            (if (> (+ (* a a) (* b b)) 4) (begin
                (setq s (format nil "~X" i))
                (loop-finish)
            ))
        )
        (princ s)
    )
    (fresh-line)
)
