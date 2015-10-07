-module(my_timer).
-export([send_after/2, sleep/1, send/3]).
send_after(Time, Msg) ->
    io:format("Pid==~p~n",[self()]),
    spawn(my_timer, send, [self(),Time,Msg]).
send(Pid, Time, Msg) ->
  receive
  after
    Time ->
      Pid ! Msg
  end.
sleep(T) ->
  receive
  after
    T ->  io:format("Pid==~p~n",[self()]),true
  end.


  register(printa, spawn(test,read,[start])).