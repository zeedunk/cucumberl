-module(test_step).

-compile(export_all).

step([given,some,stuff], _) ->
  false;
step(_,_)->
  undefined.
