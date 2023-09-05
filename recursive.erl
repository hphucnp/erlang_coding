%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Sep 2023 16:07
%%%-------------------------------------------------------------------
-module(recursive).
-author("phucnguyen").

%% API
-export([len/1, fac/1,
  tail_fac/1, tail_len/1, duplicate/2, reverse/1, tail_reverse/1]).
len([]) ->
    0;
len([_|T]) ->
  1 + len(T).

fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).

tail_fac(N) -> tail_fac(N, 1).
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N - 1, N * Acc).

tail_len(L) -> tail_len(L, 0).
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).

duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 -> [Term | duplicate(N - 1, Term)].

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).
