-module(myring).
-export([start/1, start_proc/2]).
-compile(export_all).
start(Num) ->
  start_proc(Num, self()).
start_proc(0, Pid) ->
  Pid ! ok;
start_proc(Num, Pid) ->
  NPid = spawn(?MODULE, start_proc, [Num-1, Pid]),
  NPid ! ok,
  receive ok -> ok end.


start() ->
   	case whereis(db_server) of
     	undefined ->
	        Pid = spawn(db_server, init, []),
	        register(db_server, Pid),
	        {ok, Pid};
    Pid when is_pid(Pid) ->
            {error, already_started}
end.