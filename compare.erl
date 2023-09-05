%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Aug 2023 20:19
%%%-------------------------------------------------------------------
-module(compare).
-author("phucnguyen").

%% API
-export([min/2, is_sum_greater/2, even/1]).

min(X, Y) when X < Y ->
    X;
min(_X, Y) ->
    Y.

is_sum_greater(X, Y) when X + Y > 50 ->
    true;
is_sum_greater(_X, _Y) ->
    false.

even(X) when X rem 2 == 0->
    true;
even(_X) ->
    false.