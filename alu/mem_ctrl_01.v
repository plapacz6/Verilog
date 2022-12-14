/*auth:plapacz6@gmail.com, data:2022-12-14, licence: GPLv3*/
module mem_ctrl_01 tested_mem_ctrl(rst, clk, wr, addr_bus, data_bus);

parameter integer bus_width = 8;

reg rst;
reg clk;
reg wr; //direction write = 1, read = 0
addr_bus;  //pointed addres in memory
data_bus;  //data to write, or output to reab from that bus

reg [bus_width - 1: 0] data_interface_reg

endmodule //mem_ctrl_01