-module (test).
-compile(export_all).

start() ->
	register(test, spawn(test,read,[start])).


read(Key) ->
	flush(),
	self()!{self(),{read,Key}},
	io:format("==~p~n",[Key]),
	receive
		{read,R}		->	io:format("read==~p~n",[Key]),{ok, R};
		{error,Reason} 	->	io:format("error==~p~n",[Key]),{error, Reason}
	after 2000	->	
		io:format("timeout==~p~n",[Key]),
		{error, timeout}
end.

flush() ->
	receive
		{read, _} ->	io:format("flush_read==~n"),flush();
		{error,_} ->	io:format("flush_error==~n"),flush()
	after 0   ->	ok

end.



