%%%-------------------------------------------------------------------
%%% @author Math
%%% @copyright (C) 2017, Math
%%% @doc
%%%
%%% @end
%%% Created :  9 Oct 2017 by Math 
%%%-------------------------------------------------------------------
-module(logs_processing).

-export([get_statistics/0,
         fprof_test_of_matrix_sums/4,
         fprof_test_of_matrix_function/4,
         apply_transformations_to_matrix/4]).

-define(BUFFER_FILE,"fprof.analysis").

fprof_test_of_matrix_sums(MatrixForm, Function, Width, Height)->
    TestedMatrixRepresentation = create_matrix_representation(MatrixForm, Width, Height),
    fprof:apply(MatrixForm, Function, [TestedMatrixRepresentation]),
    get_statistics().

fprof_test_of_matrix_function(MatrixForm, get_value, Width, Height)->
    TestedMatrixRepresentation = create_matrix_representation(MatrixForm, Width, Height),
    AllCoordinates = [[W,H] || W <- lists:seq(1,Width), H <- lists:seq(1,Height)],
    io:format("No. of times function is applied: ~p~n",[length(AllCoordinates)]),
    fprof:apply(logs_processing, apply_transformations_to_matrix,
                [TestedMatrixRepresentation, MatrixForm, get_value, AllCoordinates]),
    get_statistics();
fprof_test_of_matrix_function(MatrixForm, set_value, Width, Height)->
    TestedMatrixRepresentation = create_matrix_representation(MatrixForm, Width, Height),
    AllCoordinates = [[W,H,rand:uniform(10000)] || W <- lists:seq(1,Width), H <- lists:seq(1,Height)],
    io:format("No. of times function is applied: ~p~n",[length(AllCoordinates)]),
    fprof:apply(logs_processing, apply_transformations_to_matrix,
                [TestedMatrixRepresentation, MatrixForm, set_value, AllCoordinates]),
    get_statistics().

apply_transformations_to_matrix(Matrix, _, _, [])->
    Matrix;
apply_transformations_to_matrix(Matrix, Module, Function, [Attributes | RestOfAttributes]) ->
    apply(Module, Function, lists:append(Attributes,[Matrix])),
    apply_transformations_to_matrix(Matrix, Module, Function, RestOfAttributes).

create_matrix_representation(MatrixForm, Width, Height)->
    io:format("~p~n",[MatrixForm]),
    {Matrix,_ColsSums,_RowsSums} = generate_matrix:arithmetic_sum(Width, Height),
    apply(MatrixForm,load,[Matrix]).

get_statistics()->
    process_fprof_logs(),
    TotalsResult = get_totals_line(),
    [FunctionCalls,ExecutionTime] =  get_total_calls_no_and_exec_time(TotalsResult),
    io:format("~p~n",[[FunctionCalls,ExecutionTime]]),
    [FunctionCalls,ExecutionTime].

process_fprof_logs()->
    fprof:profile(),
    fprof:analyse([{dest, ?BUFFER_FILE}]).
get_totals_line()->
    {ok,AnalysisResult} = file:read_file(?BUFFER_FILE),
    {match, TotalsResults} = re:run(binary_to_list(AnalysisResult), ".*totals(.*)%%%",
                                    [global, {capture, first, list}]),
    [[TotalsResult]] = TotalsResults,
    TotalsResult.
get_total_calls_no_and_exec_time(TotalsResult)->
    {ok,Tokens,_EndLocation} = erl_scan:string(TotalsResult),
    {ok,[{totals,
          FunctionCalls,ExecutionTime,_ExecutionTimeWithoutCalledFuns}]} = erl_parse:parse_term(Tokens),
    [FunctionCalls,ExecutionTime].
