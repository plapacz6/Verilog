/*auth:plapacz6@gmail.com, data:2022-12-14, licence: GPLv3*/
module alu_01_tb;

  param bus_width = 8;

  reg clk;
  reg rst;
  reg wr;    // read = 0, write = 1 to memory
  reg addr1 [bus_width - 1: 0]
  reg [32][bus_width - 1: 0] mem1 //memory
  wire [bus_width -1: 0] data_bus;
  wire [bus_width -1: 0] addr_bus;
  

  alu_01 tested_alu_01(rst, clk, wr, addr_bus, data_bus);
  mem_ctrl_01 tested_mem_ctrl(rst, clk, wr, addr_bus, data_bus);


  initial
    begin
      $dumpfile("alu_01_tb.vcd");
      $dumpvars(0, alu_01_tb);

      $display()
      $monitor("%", rst, clk, addr1, wr, mem1[addr1])
      clk = 0;
      rst = 0;
      for(i = 0; i < 32; i++){
        mem1[i] =  0;
      }
      /*
      WRITE EMBEDED PROGRAM HERE (BINARY)
      */      
      #60 $finish;
    end

  always@(posedge clk)
    begin
      $dumpon
      #1
      $dumpoff
    end

  initial
    begin
      #1 clk <= ~clk
    end


endmodule //alu_01_tb
