The erlang and OTP are lacking explicite matrix support.

This is a little study of possible implementations for matrixes in Erlang. 

Every implementation contains rows_sum/1, cols_sum/1, get_value/3 and set_value/4 functions.

To run all unit tests use:
 
 > make test

To run some test and store processed results, for example:

 > ./fprof_escript all get_value 20 20 > temp

Get markdown GFM table:

 > cat temp | grep '>>>' | cut -d ' ' -f 2-

