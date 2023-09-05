%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Aug 2023 20:56
%%%-------------------------------------------------------------------
-module(greetings).
-author("phucnguyen").

%% API
-export([greet/3]).

greet(Name, Lang, Age) ->
    case Lang of
        polish when Age < 18 ->
            io:format("Witaj, ~s!~n", [Name]);
        polish ->
            io:format("Witaj, Panie ~s!~n", [Name]);
        english when Age < 18 ->
            io:format("Hello, ~s!~n", [Name]);
        english ->
            io:format("Hello, Mr. ~s!~n", [Name]);
        spanish ->
            io:format("Ola, ~s!~n", [Name]);
        _ ->
            io:format("Sorry, I don't know ~s!~n", [Lang])
    end.
