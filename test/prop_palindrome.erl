-module(prop_palindrome).
-include_lib("proper/include/proper.hrl").

-import(palindrome,[from_string/1]).

prop_is_palindrome() ->
    ?FORALL(Str, short_string(), is_palindrome(from_string(Str))).

prop_includes_string() ->
    ?FORALL(Str, short_string(), includes_string(from_string(Str), Str)).

is_palindrome(Xs) ->
    lists:reverse(Xs) =:= Xs.

includes_string(Xs, Ys) ->
    length(Xs) - length(Ys) =:= length(Xs -- Ys).

short_string() ->
    ?SUCHTHAT(S, string(), length(S) < 30).
