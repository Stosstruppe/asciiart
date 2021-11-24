# asciiart Tcl
for {set y -12} {$y <= 12} {incr y} {
    for {set x -39} {$x <= 39} {incr x} {
        set ca [expr $x * 0.0458]
        set cb [expr $y * 0.08333]
        set a $ca
        set b $cb
        set s " "
        for {set i 0} {$i <= 15} {incr i} {
            set t [expr $a * $a - $b * $b + $ca]
            set b [expr 2 * $a * $b + $cb]
            set a $t
            if {[expr $a * $a + $b * $b] > 4} {
                set s [format "%X" $i]
                break
            }
        }
        puts -nonewline $s
    }
    puts "";
}
