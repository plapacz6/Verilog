module multiplexer4src_tb;

localparam bus_width_ = 8;

reg clk, rst;
reg [3:0] src;
reg [bus_width_ - 1:0] src0; 
reg [bus_width_ - 1:0] src1; 
reg [bus_width_ - 1:0] src2; 
reg [bus_width_ - 1:0] src3; 
wire [bus_width_ - 1:0] out;

defparam multiplx4.bus_width = bus_width_;
multiplexer4src multiplx4 (
  clk,
  rst,
  src,
  src0,
  src1,
  src2,
  src3,
  out);

initial
  begin
    $dumpfile("multiplexer4src_tb.vcd");
    $dumpvars(out,multiplexer4src_tb);

  $display("time\t ___src0, ___src1, ___src2, ___src3,:src:__out");
  $monitor("%g\t %b %b %b %b :%02d:%b",$time, src0,src1,src2,src3,src,out);
    
    clk <= 0;
    #1 rst <= 0;
    #1 src0 <= 8'b11111111;
    #1 src1 <= 8'b10101010;
    #1 src2 <= 8'b11001100;
    #1 src3 <= 8'b00100100;
    #1 src <= 0;
    #10 src <= 1;
    #10 src <= 2;
    #10 src <= 4;
    #10 src <= 8;
    #10 $finish;
  end

always@(posedge clk)
  begin
    $dumpon;
    #1;
    $dumpoff;
  end

initial
  begin
    forever
      #1 clk <= ~clk;
  end

endmodule //multiplexer4src_tb
