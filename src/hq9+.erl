-module('hq9+').
%-complile(export_all).
-export([run/1]).

run(Program) ->
  InvalidChars = invalid_chars(Program),
  case InvalidChars of
    [] -> eval(Program);
    _ -> erlang:error("Excepted HQ9 or +, Recieved invalid chars: " ++ InvalidChars)
 end.

invalid_chars(Program) -> 
  lists:filter(fun(Char) -> not lists:member(Char, "HQ9+") end, Program).

eval(Program) ->
  lists:foldr(fun($H, Acc) -> hello_world(), Acc;
                 ($Q, Acc) -> quine(Program), Acc;
                 ($9, Acc) -> beer(), Acc;
                 ($+, Acc) -> Acc + 1 end, 0, Program).

hello_world() ->
  erlang:display("Hello World").

quine(Program) ->
  erlang:display(Program).

beer() ->
  beer(99).

beer(1) ->
  erlang:display("1 bottle of beer on the wall, 1 bottle of beer, take 1 down pass it around, no bottles of beer on the wall");
beer(N) ->
  io:format("~p bottles of beer on the wall ~p bottles of beer, take 1 down pass it around, ~p bottles of beer on the wall", [N, N, N-1]),
  beer(N-1).