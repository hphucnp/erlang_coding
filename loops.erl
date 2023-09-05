%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2023 15:12
%%%-------------------------------------------------------------------
-module(loops).
-author("phucnguyen").

%% API
-export([for/3,
         fordown/3,
         range/4
]).

for(Max, Max, F) ->
    [F(Max)];
for(I, Max, F) ->
    [F(I)| for(I + 1, Max, F)].

fordown(Min, Min, F) ->
    [F(Min)];
fordown(I, Min, F) ->
    [F(I)| fordown(I - 1, Min, F)].

range(Max, Max, _Step, F) ->
  [F(Max)];
range(I, Max, Step, F) ->
  [F(I)| range(Step(I), Max, Step, F)].

