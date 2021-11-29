(* asciiart OCaml (ocamlopt 4.05.0) *)
let mandel x y =
	let ca = (float_of_int x) *. 0.0458 in
	let cb = (float_of_int y) *. 0.08333 in
	let a = ref ca in
	let b = ref cb in
	let i = ref 0 in
	let cont = ref true in
	while !cont do
		let t = !a *. !a -. !b *. !b +. ca in
		b := 2.0 *. !a *. !b +. cb;
		a := t;
		if (!a *. !a +. !b *. !b) > 4.0 then begin
			Printf.printf "%X" !i;
			cont := false
		end else begin
			i := !i + 1;
			if !i > 15 then begin
                print_char ' ';
				cont := false
			end
		end
	done;
;;
let main () =
	for y = -12 to 12 do
		for x = -39 to 39 do
			mandel x y
		done;
    	print_newline ()
	done
;;
main ()
