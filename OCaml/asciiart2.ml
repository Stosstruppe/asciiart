(* asciiart OCaml (ocamlopt 4.05.0) *)
let rec mandel = function
    (16, _, _, _, _) -> print_char ' '
    | (i, a, b, ca, cb) ->
        let an = a *. a -. b *. b +. ca in
        let bn = 2.0 *. a *. b +. cb in
        if (an *. an +. bn *. bn) > 4.0 then
            Printf.printf "%X" i
        else
            mandel (i+1, an, bn, ca, cb)
;;
let main () =
    for y = -12 to 12 do
        for x = -39 to 39 do
            let ca = (float_of_int x) *. 0.0458 in
            let cb = (float_of_int y) *. 0.08333 in
            mandel (0, ca, cb, ca, cb)
        done;
        print_newline ()
    done
;;
main ()
