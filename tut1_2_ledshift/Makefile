all : tut1_2_ledshift
	printf ""
	printf ""
	printf ""
	printf ""

tut1_2_ledshift: ledshift.v ledshift_tb.v
	iverilog -o tut1_2_ledshift ledshift.v ledshift_tb.v
.PHONY: clean


clean:
	- rm tut1_2_ledshift
