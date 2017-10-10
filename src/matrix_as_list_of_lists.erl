%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created : 10 Oct 2017 by Math
%%%-------------------------------------------------------------------
-module(matrix_as_list_of_lists).

%% Application callbacks
-export([rows_sums/1, cols_sums/1]).

%%%===================================================================
%%% Application callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
rows_sums(Matrix) ->
    [lists:sum(Row)|| Row <- Matrix].

cols_sums([])->[];
cols_sums(Matrix)->cols_sums(Matrix,[]).

cols_sums([[]|_],Acc)->
     lists:reverse(Acc);
cols_sums(Matrix,Acc) ->
    {Heads,Tails} = lists:unzip([{Head,Tail}|| [Head|Tail]<- Matrix]),   
    cols_sums(Tails,[lists:sum(Heads)|Acc]).


