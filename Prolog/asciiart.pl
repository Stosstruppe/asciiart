% asciiart Prolog (swi 7.6.4)

mandel(16, _, _, _, _) :- write(' ').
mandel(I, A, B, CA, CB) :-
    A1 is A * A - B * B + CA,
    B1 is 2.0 * A * B + CB,
    (A1 * A1 + B1 * B1) > 4.0, format('~16R', [I]);
    A2 is A * A - B * B + CA,
    B2 is 2.0 * A * B + CB,
    J is I + 1, mandel(J, A2, B2, CA, CB).

main :-
    forall(between(-12, 12, Y), (
        forall(between(-39, 39, X), (
            CA is X * 0.0458,
            CB is Y * 0.08333,
            mandel(0, CA, CB, CA, CB)
        )),
        nl
    )),
    halt.
:- main.
