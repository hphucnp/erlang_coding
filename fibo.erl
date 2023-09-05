%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Aug 2023 22:19
%%%-------------------------------------------------------------------
-module(fibo).
-author("phucnguyen").

%% API
-export([fibonacci/1]).

%%====================================================================
%% API functions
%%====================================================================
% fibo:fibonacci(10).
fibonacci(0) ->
    0;
fibonacci(1) ->
    1;
fibonacci(N) ->
    fibonacci(N - 1) + fibonacci(N - 2).
