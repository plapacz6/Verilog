#author: plapacz6@gmail.com
#date: 2022-11-12

EXECUTABLE_SIMULATION=adder4_tb

all: $(EXECUTABLE_SIMULATION)
	printf ""
	printf "  run $(EXECUTABLE_SIMULATION)"
	printf "  ctrl + c - TO BREAK"
	printf "  help   - HELP (AFTER BREAK)"
	printf "  finish - TO EXIT SIMULATION"
	printf ""

$(EXECUTABLE_SIMULATION): adder4.v adder4_tb.v
	iverilog -o adder4_tb adder4.v adder4_tb.v

.PHONY: clean

clean:
	- rm $(EXECUTABLE_SIMULATION) $(EXECUTABLE_SIMULATION).vcd
