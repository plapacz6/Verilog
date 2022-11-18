#author: plapacz6@gmail.com
#data: 2022-11-11

TESTED_MODULE1=multiplexer4src
EXECUTABLE_SIMULATION1=$(TESTED_MODULE1)_tb
all: $(EXECUTABLE_SIMULATION1)
	printf "\n\n"
	printf "$(EXECUTABLE_SIMULATION1)  - run simulation"
	printf "help - print simulation commands"
	printf "finish - end simulation"
	printf "\n\n"

$(EXECUTABLE_SIMULATION1): $(TESTED_MODULE1).v $(EXECUTABLE_SIMULATION1).v
	iverilog -o $(EXECUTABLE_SIMULATION1) \
  $(TESTED_MODULE1).v $(EXECUTABLE_SIMULATION1).v

.PHONY: clean
  
clean:
	- rm $(EXECUTABLE_SIMULATION1)
	- rm $(EXECUTABLE_SIMULATION1).vcd

