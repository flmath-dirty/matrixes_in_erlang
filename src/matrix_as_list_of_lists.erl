%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created : 10 Oct 2017 by Math
%%%-------------------------------------------------------------------
-module(matrix_as_list_of_lists).

-export([rows_sums/1, cols_sums/1,
         get_value/3,set_value/4]).

rows_sums(Matrix) ->
    [lists:sum(Row)|| Row <- Matrix].

cols_sums([])->[];
cols_sums(Matrix)->cols_sums(Matrix,[]).

cols_sums([[]|_], Acc)->
     lists:reverse(Acc);
cols_sums(Matrix, Acc) ->
    {Heads, Tails} = lists:unzip([{Head,Tail} || [Head| Tail]<- Matrix]),   
    cols_sums(Tails, [lists:sum(Heads)| Acc]).

get_value(X, Y, Matrix)->
    Row = lists:nth(Y, Matrix),
    lists:nth(X, Row).
    
set_value(X, Y, NewValue, Matrix)->
    {PrecedingList,[Row | TailList]} = lists:split(Y-1, Matrix),
    {PrecedingElements,[OldValue | TailElements]} = lists:split(X-1,Row),
    lists:append([PrecedingList,
                 [lists:append([PrecedingElements,[NewValue], TailElements])],
                 TailList]).
