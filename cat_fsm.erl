%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Sep 2023 10:46
%%%-------------------------------------------------------------------
-module(cat_fsm).
-author("phucnguyen").
-export([start/0, event/2]).

start() ->
  spawn(fun() -> dont_give_crap() end).

event(Pid, Event) ->
  Ref = make_ref(), % won't care for monitors here
  Pid ! {self(), Ref, Event},
  receive
    {Ref, Msg} -> {ok, Msg}
    after 5000 ->
    {error, timeout}
  end.

dont_give_crap() ->
  receive
    {Pid, Ref, _Msg} -> Pid ! {Ref, meh};
    _ -> ok
  end,
  io:format("Switching to 'dont_give_crap' state~n"),
  dont_give_crap().