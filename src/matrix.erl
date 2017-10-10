%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created :  9 Oct 2017 by Math
%%%-------------------------------------------------------------------
-module(matrix).

-export([
         load/1,
         load/2
        ]).

load(List)->
    load(List, list_of_lists).

load(List, list_of_lists)->
    List.

