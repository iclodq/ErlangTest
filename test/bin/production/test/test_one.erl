%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. °ËÔÂ 2015 12:37
%%%-------------------------------------------------------------------
-module(test_one).
-author("Administrator").

%% API
-export([test/1,t/1]).


test(_A) ->
  io:format("hello").


t(From) ->
  From!node().
