%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Sep 2023 13:58
%%%-------------------------------------------------------------------
-module(map_server).
-author("phucnguyen").

%% API
-export([start/0, loop/1]).

start() ->
  spawn(map_server, loop, [maps:new()]).

loop(Map) ->
  receive
    {Client, {get, Key}} ->
      % maps:find(Key, Map) -> {ok, Value}
      Client ! {self(), maps:find(Key, Map)},
      loop(Map);
    {Client, {set, Key, Value}} ->
      UpdatedMap = maps:put(Key, Value, Map),
      Client! {self(), {ok, Key, Value}},
      loop(UpdatedMap);
    {Client, {size}} ->
      Client !{self(), {ok, maps:size(Map)}},
      loop(Map);
    {Client, {keys}} ->
      Client! {self(), {ok, maps:keys(Map)}},
      loop(Map);
    {Client, {delete, Key}} ->
      UpdatedMap = maps:remove(Key, Map),
      Client! {self(), {ok, Key}},
      loop(UpdatedMap);
    {Client, {exists, Key}} ->
      Client! {self(), {ok, maps:is_key(Key, Map)}},
      loop(Map)
  end.

