%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created :  9 Oct 2017 by Math 
%%%-------------------------------------------------------------------
-module(matrix_tests).

-include_lib("eunit/include/eunit.hrl").

-export([load_test/0]).

load_trivial()->
    AssumedResult = [],
    ActualResult = matrix:load([],[],[]),
    ?assertEqual(ActualResult, AssumedResult).
