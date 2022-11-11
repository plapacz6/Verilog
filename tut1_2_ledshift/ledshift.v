/*
based on https://fiona.dmcs.pl/~cmaj/Verilog/Kurs%20verilog.pdf
*/

module ledshift(
  input clk, input rst,
  input i_start, input i_stop,
  output reg[7:0] o_led  //highes bit has no 7
  //output reg[0:7] o_led  //highes bit has no 0
  );

  integer main_state;
  reg [18:0] cnt;

  //counter
  always @(posedge clk or posedge rst)
    if(rst)
      cnt <= 19'h30D3E;
    else if(cnt[18])
      cnt <= 19'h30D3E;
    else
      cnt <= cnt - 1;

  //automat
  always @(posedge clk or posedge rst)
    if(rst)   //if only in always block
      main_state <= 0;
    else
      case(main_state)  //case only in alwasy  block
      0: main_state <= i_start ? 1 : 0;
      1: if(i_stop) main_state <= 0; else if(cnt[18]) main_state <= 2;
      2: main_state <= 1;
      default: main_state <= 0; //in case of disruptions
      endcase

   //LEDs
   always @(posedge clk or posedge rst)
    if(rst)
      o_led <= 0;
    else if(main_state == 0)
      o_led <= 8'hFE;
    else if(main_state == 2)
    begin
      o_led[7:1] <= o_led[6:0];
      o_led[0] <= o_led[7];
    end

endmodule //ledshift

