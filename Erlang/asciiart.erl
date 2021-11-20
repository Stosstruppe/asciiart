% asciiart Erlang
-module(prog).
-export([main/0]).

main() ->
    for(-12, 12, fun(Y) ->
        for(-39, 39, fun(X) ->
            CA = X * 0.0458,
            CB = Y * 0.08333,
            mandel(0, CA, CB, CA, CB)
        end),
        io:fwrite("~n")
    end).

for(M, M, F) -> [F(M)];
for(I, M, F) -> [F(I) | for(I+1, M, F)].

mandel(16, _, _, _, _) ->
	io:fwrite(" ");
mandel(I, A, B, CA, CB) ->
	A2 = A * A - B * B + CA,
	B2 = 2 * A * B + CB,
	if
		(A2 * A2 + B2 * B2) > 4 ->
			io:fwrite(erlang:integer_to_list(I, 16));
		true ->
			mandel(I+1, A2, B2, CA, CB)
	end.
