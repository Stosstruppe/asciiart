; asciiart Clojure

(defn mandel [i a b ca cb]
    (if (= 16 i)
        (print " ")
        (let [an (+ (- (* a a) (* b b)) ca)
              bn (+ (* 2 a b) cb)]
            (if (> (+ (* an an) (* bn bn)) 4)
                (print (format "%X" i))
                (recur (inc i) an bn ca cb)))))

(doseq [y (range -12 13)]
    (doseq [x (range -39 40)]
        (let [ca (* x 0.0458)
              cb (* y 0.08333)]
            (mandel 0 ca cb ca cb)))
    (println))
