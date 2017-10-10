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

-compile([export_all]).


load_default_test()->
    AssumedResult = [],
    ActualResult = matrix:load([]),
    ?assertEqual(ActualResult, AssumedResult).

load_list_of_lists_trivial_test()->
    AssumedResult = [],
    ActualResult = matrix:load([],list_of_lists),
    ?assertEqual(ActualResult, AssumedResult).

load_list_of_lists_one_element_test()->
    AssumedResult = [[2]],
    ActualResult = matrix:load([[2]],list_of_lists),
    ?assertEqual(ActualResult, AssumedResult).

load_list_of_lists_2_by_3_element_test()->
    AssumedResult = [[2,3],[4,5],[6,7]],
    ActualResult = matrix:load([[2,3],[4,5],[6,7]],list_of_lists),
    ?assertEqual(ActualResult, AssumedResult).
