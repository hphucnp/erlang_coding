%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Sep 2023 16:12
%%%-------------------------------------------------------------------
-module(temperature).
-author("phucnguyen").

%% API
-export([check_temperature/1]).

check_temperature(Temperature) ->
    if Temperature < 40 ->
        io:format("Temperature is okay!~n");
    Temperature > 40 ->
        io:format("It's getting hot!~n");
    true ->
        io:format("Any other case~n")
    end.
