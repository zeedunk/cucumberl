-module(discovery_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


find_all_modules_test() ->
  LoadedModules = code:all_loaded(),
  ?assert(lists:any(fun({Mod,File}) -> Mod == discovery_test end, LoadedModules)),
  true.
