%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created :  9 Oct 2017 by Math 
%%%-------------------------------------------------------------------
-module(generate_matrix).

-export([arithmetic_sum/2]).

-include_lib("eunit/include/eunit.hrl").

arithmetic_sum(0,0)->
    {{0, 0, {}},[], []};
arithmetic_sum(Width,Height)->
    Matrix = list_to_tuple(lists:seq(1,Width*Height)),
    SumFromOneToWidth = (Width * (Width + 1)) div 2,
    RowsSums = lists:seq(SumFromOneToWidth,
                         SumFromOneToWidth + Width * Width * (Height - 1),
                         Width * Width),

    SumFromOneToHeight = Height +  Width * ((Height * (Height - 1)) div 2),
    ColsSums = lists:seq(SumFromOneToHeight,
                         SumFromOneToHeight + (Width-1) * Height,
                         Height),

    {{Width, Height, Matrix}, ColsSums, RowsSums}.  

empty_load_test()->
    AssumedResult = {{0, 0, {}},[], []},
    ActualResult = arithmetic_sum(0, 0),
    ?assertEqual(AssumedResult, ActualResult).

one_element_load_test()->
    AssumedResult = {{1, 1, {1}},[1], [1]},
    ActualResult = arithmetic_sum(1, 1),
    ?assertEqual(AssumedResult, ActualResult).

matrix_2_by_3_elements_load_test()->
    AssumedResult = {{2, 3, {1, 2, 3, 4, 5, 6}}, [9, 12], [3, 7, 11]},
    ActualResult = arithmetic_sum(2, 3),
    ?assertEqual(AssumedResult, ActualResult).

matrix_4_by_3_elements_load_test()->
    AssumedResult = {{4, 3, {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}}, [15, 18, 21, 24], [10, 26, 42]},
    ActualResult = arithmetic_sum(4, 3),
    ?assertEqual(AssumedResult, ActualResult).
