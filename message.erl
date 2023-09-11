%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Sep 2023 17:09
%%%-------------------------------------------------------------------
-module(message).
-include("message.hrl").
-author("phucnguyen").

%% API
-export([print_message/1, update_sender/2, is_message/1]).

print_message(#message{sender = S, receiver = R, text = T} = _M) ->
    io:format("Sender: ~p~nReceiver: ~p~nText: ~p~n",
      [S, R, T]).

update_sender(Sender, #message{} = M) ->
    M#message{sender = Sender}.

is_message(X) when is_record(X, message) ->
  true;
is_message(_) ->
  false.
