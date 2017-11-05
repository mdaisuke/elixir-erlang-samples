-module(hello).
-export([start/0]).

% $ erl
% 1> c(hello).
% 2> hello:start().
% or
% erlc hello.erl
% erl -noshell -s hello start -s init stop
start() ->
  io:format("hello world~n").
