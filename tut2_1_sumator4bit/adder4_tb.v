/*
based on https://fiona.dmcs.pl/~cmaj/Verilog/Jezyk%20verilog%20w%20projektowaniu%20ukladow%20fpga.PDF
and http://www.referencedesigner.com/tutorials/verilog/verilog_62.php
*/
module adder4_tb;

//declaration neccessary singals
reg [3:0] a, b;
reg i_c;
wire[3:0] sum;
wire o_c;
//tested adder4 
adder4 tested_adder4(a, b, i_c, sum, o_c);

//
initial begin
  a = 0; b = 0; i_c = 0;
  $dumpon;
  #10; 
  $dumpoff;
  a = 0; b = 0; i_c = 1;
  $dumpon;
  #10;
  a = 1; b = 1; i_c = 0;
  $dumpoff;
  #10; 
  $dumpon;
  a = 5; b = 3; i_c = 0;  //101  + 11 ->
  $dumpoff;
  #10; 
  $dumpon;
  a = 6; b = 8; i_c = 0;  //110  + 1 000 -> 
  $dumpoff;
  #10; 
  $dumpon;
  a = 8; b = 9; i_c = 0;  //1 000 + 1 001 ->
  $dumpoff;
  #10; 
  $dumpon;
  a = 10; b = 10; i_c = 0; //1 010 + 1 010 ->
  $dumpoff;
  #10;
  $dumpon;
  a = 15; b = 15; i_c = 0; //1 111 + 1 111 ->
  $dumpoff;
  end

initial begin
  //displaying results of simualtion
  $display( "time |  a +   b + i_c  =  sum  and  o_c");
  $monitor("$time | %d +  %d + %d  =  %d  and  %b" , a, b, i_c, sum, o_c);
  //$monitor("$time | %b +  %b + %b  =  %b  and  %b", a, b, i_c, sum, o_c);i
  $dumpfile("adder4_tb.vcd");
  $dumpvars;
  //$dumpvars(0, adder4_tb);
  end
endmodule //adder4_tb;
