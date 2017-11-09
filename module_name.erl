% module_name.erl
-module(module_name).
-export([hello/0]).

hello() ->
  io:format("~s~n", ["Hello world!"]).
