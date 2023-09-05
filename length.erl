%%%-------------------------------------------------------------------
%%% @author phucnguyen
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Aug 2023 20:57
%%%-------------------------------------------------------------------
-module(length).
-author("phucnguyen").

%% API
-export([convert_meters/1]).

-define(YARD, 1.0936).
-define(INCH, 39.370).
-define(FOOT, 3.2808).

%%====================================================================
%% API functions
%%====================================================================
% length:convert_meters({yard, 3}).
convert_meters({yard, Meters}) ->
    Meters * ?YARD;
% length:convert_meters({inch, 2}).
convert_meters({inch, Meters}) ->
    Meters * ?INCH;
% length:convert_meters({foot, 10}).
convert_meters({foot, Meters}) ->
    Meters * ?FOOT.
