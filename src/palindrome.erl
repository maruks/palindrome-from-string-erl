-module(palindrome).
-import(lists, [sublist/2,last/1]).

-export([from_string/1]).

from_string(S) ->
     create(S).

create([]) ->
    [];
create([X]) ->
    [X];
create([X | Xs] = S) ->
    L = last(Xs),
    case X =:= L of
	true -> [X] ++ create(sublist(Xs, length(Xs) - 1)) ++ [X];
	false -> A = [X] ++ create(Xs) ++ [X],
		B = [L] ++ create(sublist(S, length(S) - 1)) ++ [L],
		if
		    length(A) > length(B) -> B;
		    length(A) < length(B) -> A;
		    true -> case A < B of
			       true -> A;
			       false -> B
			   end
		end
     end.
