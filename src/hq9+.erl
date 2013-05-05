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

eval(_Program) ->
  erlang:display("Eval").