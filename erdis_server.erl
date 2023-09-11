%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Sep 2023 15:02
%%%-------------------------------------------------------------------
-module(erdis_server).
-author("phucnguyen").

%% API
-export([start_server/0, stop_server/0]).

-record(entry, {key, value}).

initialize_db() ->
  mnesia:create_schema([node()]),
  mnesia:start(),
  mnesia:create_table(entry, [{attributes, record_info(fields, entry)}]).

start_server() ->
  initialize_db(),
  {ok, Listen} = gen_tcp:listen(10101, [binary, {packet, 4}, {reuseaddr, true}, {active, false}]),
  spawn(fun() -> par_connect(Listen) end).

par_connect(Listen) ->
  {ok, Socket} = gen_tcp:accept(Listen),
  spawn(fun() -> par_connect(Listen) end),
  loop(Socket).

stop_server() ->
  mnesia:stop(),
  ok.

loop(Socket) ->
  receive
    {tcp, Socket, Bin} ->
      io:format("Received: ~p~n", [Bin]),
      Str = binary_to_term(Bin),
      Reply = process_command(Str),
      BinReply = term_to_binary(Reply),
      io:format("Reply: ~p~n", [BinReply]),
      gen_tcp:send(Socket, BinReply),
      loop(Socket);
    {tcp_closed, Socket} ->
      io:format("Socket closed~n"),
      ok
  end.

process_command(Str) ->
  Parts = string:split(Str, " ", all),
  Command = lists:nth(1, Parts),

  case Command of
    "get" -> get_value(lists:nth(2, Parts));
    "set" -> set_value(lists:nth(2, Parts), lists:nth(3, Parts));
    "size" -> get_size();
    "keys" -> get_keys();
    "delete" -> delete_value(lists:nth(2, Parts));
    "exists" -> exists(lists:nth(2, Parts));
  end

get_value(Key) ->
  F = fun() ->
    Oid = {entry, Key},
    Entries = mnesia:read(Oid),
    case Entries =:= [] of
      true -> does_not_exist;
      false -> lists:nth(1, Entries)
    end
      end,
  mnesia:transaction(F).

set_value(Key, Value) ->
  Entry = #entry{key = Key, value = Value},
  F = fun() ->
    mnesia:write(Entry)
      end,
  mnesia:transaction(F),
  {ok, Key, Value}.

get_size() ->
  F = fun() ->
    mnesia:table_info(entry, size)
      end,
  {ok, mnesia:transaction(F)}.

get_keys() ->
  F = fun() ->
    mnesia:all_keys(entry)
      end,
  {ok, mnesia:transaction(F)}.

delete_value(Key) ->
  Oid = {entry, Key},
  F = fun() ->
    mnesia:delete(Oid)
      end,
  mnesia:transaction(F),
  {ok, Key}.

exists(Key)->
  Exists = get_value(Key),
  case Exists of
    {atomic, does_not_exist} -> {ok, false};
    _ -> {ok, true}
  end.

