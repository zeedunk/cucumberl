-module(discovery).

-compile(export_all).

run_steps(Modules, ArgList) ->
  lists:foldl(fun(Mod, undefined) -> 
        Mod:step(ArgList);
        (_, Acc) -> Acc
  end,
  undefined, Modules).
