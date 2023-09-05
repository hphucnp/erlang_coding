%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2023 10:40
%%%-------------------------------------------------------------------
-module(factorial).
-author("phucnguyen").

%% API
-export([factorial/1, avg/1]).

factorial(0) ->
    1;
factorial(1) ->
    1;
factorial(N) ->
    N * factorial(N - 1).

avg(L) ->
    sum(L) / length(L).

sum([]) ->
    0;
sum([{_, Score}|T]) ->
    Score + sum(T).



