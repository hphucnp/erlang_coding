%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Sep 2023 14:15
%%%-------------------------------------------------------------------
-module(map_client).
-author("phucnguyen").

%% API
-export([get_value/2, set_value/3, get_size/1, get_keys/1, delete/2, exists/2]).
get_value(Server, Key) ->
  Server ! {self(), {get, Key}},
  receive
    {Server, {ok, Value}} ->
      Value;
    {Server, error} ->
      error
  end.

set_value(Server, Key, Value) ->
  Server ! {self(), {set, Key, Value}},
  receive
    {Server, {ok, Key, Value}} ->
      ok
  end.

get_size(Server) ->
  Server ! {self(), {size}},
  receive
    {Server, {ok, Size}} ->
      Size
  end.

get_keys(Server) ->
  Server ! {self(), {keys}},
  receive
    {Server, {ok, Keys}} ->
      Keys
  end.

delete(Server, Key) ->
  Server ! {self(), {delete, Key}},
  receive
    {Server, {ok, Key}} ->
      ok
  end.

exists(Server, Key) ->
  Server ! {self(), {exists, Key}},
  receive
    {Server, {ok, true}} ->
      true;
    {Server, {ok, false}} ->
      false
  end.