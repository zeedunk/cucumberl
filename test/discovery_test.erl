-module(discovery_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).

find_all_modules_test() ->
  LoadedModules = code:all_loaded(),
  ?assert(lists:any(fun({Mod,_}) -> Mod == discovery_test end, LoadedModules)),
  true.

find_a_step_test() ->
  ?assert(lists:any(fun({Mod,_})-> [{exports, Names}|_] = Mod:module_info(), lists:any(fun({Elem,_})-> Elem == step end, Names) end, code:all_loaded())).

apply_a_step_test() ->
  ?assertNot(apply(test_step, step,[[given,some,stuff], something])).

find_a_specific_step_test() ->
  LoadedModules = code:all_loaded(),
  ArgList = [given,some,stuff],
  LoadedStepModules = lists:filter(fun({Mod,_})-> [{exports, Names}|_] = Mod:module_info(), lists:any(fun({Elem,_})-> Elem == step end, Names) end, LoadedModules),
  ?assert(false == discovery:run_steps(LoadedStepModules, ArgList)),
  true.
