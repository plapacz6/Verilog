/*
copyright: author of https://fiona.dmcs.pl/~cmaj/Verilog/Kurs%20verilog.pdf
*/
module licznik (
input wire clk, 
input wire load, 
input wire [3:0] i_Q,
output reg [3:0] o_Q
);

always @(posedge clk or posedge load)
  if(load)
    o_Q <= i_Q;
  else if(clk)
    o_Q <= o_Q + 1;
endmodule


