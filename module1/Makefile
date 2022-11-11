/*
author: plapacz6@gmail.com
data: 2022-11-11
*/
all: licznik_tb
	printf "\n\n"
	printf "licznik_tb  - run simulation"
	printf "help - print simulation commands"
	printf "finish - end simulation"
	printf "\n\n"

licznik_tb: licznik.v licznik_tb.v
	iverilog -o licznik_tb licznik.v licznik_tb.v

.PHONY: clean
  
clean:
	- rm licznik_tb
