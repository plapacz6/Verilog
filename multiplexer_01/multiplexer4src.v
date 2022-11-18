module multiplexer4src (clk,rst,src,src0,src1,src2,src3,out);

parameter bus_width = 8;
input wire clk;
input wire rst;
input wire[3:0] src;
input wire [bus_width - 1:0] inputsrc0;
input wire [bus_width - 1:0] src0;
input wire [bus_width - 1:0] src1;
input wire [bus_width - 1:0] src2;
input wire [bus_width - 1:0] src3;
output reg [bus_width - 1:0] out;

initial
  begin
    //out = bus_width'd0;   
    out <= 8'd0;   
  end

always@(posedge clk)
  begin
    case(src)
      4'd1:
        out <= src0;
      4'd2:
        out <= src1;
      4'd4:
        out <= src2;
      4'd8:
        out <= src3;
      default:
        out <= 8'd0;   
        //out = bus_width'd0;
    endcase
  end

always@(posedge rst)
  begin
    out <= 8'd0;   
    //out <= bus_width'd0;
  end

endmodule //multiplexer4src

