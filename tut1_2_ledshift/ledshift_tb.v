`timescale 1ns/10ps
//`include "ledshift.v"

module ledshift_tb();

reg sys_clk, sys_rst;
reg start, stop;
wire [7:0] leds_tb;


initial //only in simulation, not generate phisical circuit
  begin
    sys_clk = 0;
    sys_rst = 0;
    start = 0;
    stop = 0;

    sys_rst = #200 1;
    sys_rst = #200 0;

    start = #200 1;
    start = #200 0;

    $monitor ($time, " | %d | %b", sys_clk, leds_tb);

    stop = #6000 1;

    //$monitor ($time, " | %d", sys_clk);
    $monitor ($time, " | %d | %b", sys_clk, leds_tb);
    $dumpfile("led_shift.vcd");
    $dumpvars(0, ledshift_tb);

    $finish;
  end

always #50 sys_clk = -sys_clk;  //nanosecunds  50 == 10MHz
    ledshift UUT(
    .clk(sys_clk),
    .rst(sys_rst),
    .i_start(start),
    .i_stop(stop),
    .o_led(leds_tb)
    );

endmodule //ledshift_tb
