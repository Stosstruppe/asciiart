; asciiart CLIPS (clips 6.30)

(deffunction mandel (?i ?a ?b ?ca ?cb)
    (if (= ?i 16)
    then (printout t " ")
    else
        (bind ?an (+ (- (* ?a ?a) (* ?b ?b)) ?ca))
        (bind ?bn (+ (* 2 ?a ?b) ?cb))
        (if (> (+ (* ?an ?an) (* ?bn ?bn)) 4)
        then
            (bind ?j (+ ?i 1))
            (printout t (sub-string ?j ?j "0123456789ABCDEF"))
        else (mandel (+ ?i 1) ?an ?bn ?ca ?cb))))

(loop-for-count (?y -12 12)
    (loop-for-count (?x -39 39)
        (bind ?ca (* ?x 0.0458))
        (bind ?cb (* ?y 0.08333))
        (mandel 0 ?ca ?cb ?ca ?cb))
    (printout t crlf))
(exit)
