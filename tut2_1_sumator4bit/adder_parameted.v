module adder_parameted(a, b, i_c, sum, o_c);
  parameter size = 4;
  input [size-1:0] a, b;
  input i_c;
  output [size-1:0] sum;
  output o_c;

  assign {o_c, sum} = a + b + i_c;

endmodule //adder_parameted


module adder_parameter_user;
  wire [7:0] a, b, sum;
  wire i_c, o_c;

  defparam S8.size = 8;

  adder_parameted s8(a, b, i_c, sum, o_c);
endmodule //adder_parameter_user
