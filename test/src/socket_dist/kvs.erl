%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. ¾ÅÔÂ 2015 16:40
%%%-------------------------------------------------------------------
-module(kvs).
-author("Administrator").

%% API
-export([start/0,store/2,lookup/1]).


start() -> register(kvs, spawn(fun() -> loop() end)).


store(Key, Value) ->rpc({store, Key, Value}).

lookup(Key) -> rpc({lookup,  Key}).

rpc(Q) ->
  kvs!{self(),Q},
  receive
    {kvs, Reply} ->
      Reply
  end.

loop() ->
  receive
    {From, {store, Key, Value}} ->
      put(Key, {ok, Value}),
      From ! {kvs, true},
      loop();
    {From, {lookup, Key}} ->
      From!{kvs, get(Key)},
      loop()
  end.


