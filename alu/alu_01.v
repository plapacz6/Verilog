/*auth:plapacz6@gmail.com, data:2022-12-14, licence: GPLv3*/
module alu_01 tested_alu_01(rst, clk, wr, addr_bus, data_bus);

parameter integer bus_width = 8;

reg rst;
reg clk;
reg wr;  //read = 0, write = 1 to memory
reg notwr; //opposite to wr  for internal alu_01 registers

reg [bus_width - 1: 0] data_interface_reg


  always @posedge(wr)
    begin
      notwr = ~wr
    end


endmodule //alu_01
  