export ERL = erl
export ERLC = erlc +debug_info

clean	:
	rm -rf ebin/*beam
	rm -f fprof.trace
	rm -f fprof.analysis
	rm -f erl_crash.dump	
compile	:
	$(ERLC) -I include -o ebin src/*.erl

compile_test :
	mkdir -p ebin
	$(ERLC) -I include +export_all -o ebin \
	src/*.erl
	$(ERLC) -I include -o ebin \
	test/*.erl



run	:
	$(ERL) -pa ebin -I include

all	: compile run

test	: compile_test eunit

eunit    : compile_test
	./test_escript


