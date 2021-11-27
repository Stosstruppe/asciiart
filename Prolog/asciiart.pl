% asciiart Prolog (swi 7.6.4)

mandel(16, _, _, _, _) :- write(' ').
mandel(I, A, B, CA, CB) :-
    An is A * A - B * B + CA,
    Bn is 2.0 * A * B + CB,
    (
        (An * An + Bn * Bn) > 4.0, format('~16R', [I]);
        J is I + 1, mandel(J, An, Bn, CA, CB)
    ).

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
