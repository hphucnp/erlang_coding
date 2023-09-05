%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Aug 2023 16:20
%%%-------------------------------------------------------------------
-module(hhfuns).
-author("phucnguyen").

%% API
-compile(export_all).

one() ->
    1.
two() ->
    2.
add(X, Y) ->
    X() + Y().
