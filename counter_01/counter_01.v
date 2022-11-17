
module counter(clk, rst, ebl, out);
  parameter integer bus_width = 4;
  input clk, rst, ebl;
  output [bus_width - 1: 0] out;
  wire clk, rst, ebl;
  reg[bus_width - 1:0] out;

  initial
    begin
      out = 0;
    end

  always @(posedge clk)
    begin
      if(rst == 1'b1)
        out <= 0;
      else 
      if(ebl == 1'b1)
        begin
          out++;
          //out <= out + 1;
        end           
    end

endmodule //counter
