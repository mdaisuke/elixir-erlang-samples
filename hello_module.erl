-module(hello_module).
-export([some_fun/0, some_fun/1]).

some_fun() ->
  io:format('~s~n', ['Hello world!']).

some_fun(List) when is_list(List) ->
  io:format('~s~n', List).

priv() ->
  secret_info.
