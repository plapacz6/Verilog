/*
based on https://fiona.dmcs.pl/~cmaj/Verilog/Jezyk%20verilog%20w%20projektowaniu%20ukladow%20fpga.PDF
*/
module adder4(
  input [3:0] a,
  input [3:0] b,
  input i_c,  //input carry
  output[3:0] sum,
  output o_c //output carry
  );

  wire c1, c2, c3;  //helping carry to connect 1bit's addres

  adder1_full S1(a[0], b[0], i_c, sum[0], c1);
  adder1_full S2(a[1], b[1], c1, sum[1], c2);
  adder1_full S3(a[2], b[2], c2, sum[2], c3);
  adder1_full S4(a[3], b[3], c3, sum[3], o_c);

endmodule //adder4


module adder1_full(
  input a,
  input b,
  input i_c,
  output sum,
  output o_c
  );

  //sum = a xor b xor i_c
  assign sum = a ^ b ^ i_c;

  //carry = (a and b) or (a and i_c) or (b and i_c)
  assign o_c = (a & b) | (a & i_c) | (b & i_c);

endmodule //adder1_full

