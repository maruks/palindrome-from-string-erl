-module(palindrome_tests).
-include_lib("eunit/include/eunit.hrl").

-import(palindrome,[from_string/1]).

palindrome_test() ->
    ?assertEqual("elgoogle", from_string("google")),
    ?assertEqual("ecarace", from_string("race")),
    ?assertEqual("sator arepo tenet opera rotas", from_string("ator repo enet pera otas")).
