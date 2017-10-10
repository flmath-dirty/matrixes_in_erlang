%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created :  9 Oct 2017 by Math 
%%%-------------------------------------------------------------------
-module(matrix_list_of_lists_tests).

-include_lib("eunit/include/eunit.hrl").

rows_sums_empty_test()->
    AssumedResult = [],
    ActualResult = matrix_as_list_of_lists:rows_sums([]),
    ?assertEqual(AssumedResult, ActualResult).

rows_sums_list_of_lists_one_element_test()->
    AssumedResult = [2],
    ActualResult = matrix_as_list_of_lists:rows_sums([[2]]),
    ?assertEqual(AssumedResult, ActualResult).

rows_sums_list_of_lists_2_by_3_element_test()->
    AssumedResult = [5,9,13],
    ActualResult = matrix_as_list_of_lists:rows_sums([[2,3],[4,5],[6,7]]),
    ?assertEqual(AssumedResult, ActualResult).

cols_sums_empty_test()->
    AssumedResult = [],
    ActualResult = matrix_as_list_of_lists:cols_sums([]),
    ?assertEqual(AssumedResult, ActualResult).

cols_sums_list_of_lists_one_element_test()->
    AssumedResult = [2],
    ActualResult = matrix_as_list_of_lists:cols_sums([[2]]),
    ?assertEqual(AssumedResult, ActualResult).

cols_sums_list_of_lists_2_by_3_element_test()->
    AssumedResult = [12,15],
    ActualResult = matrix_as_list_of_lists:cols_sums([[2,3],[4,5],[6,7]]),
    ?assertEqual(AssumedResult, ActualResult).
