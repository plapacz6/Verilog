module counter_tb;
  
  parameter bus_width_ = 8;
  //integer bus_width_ = 8;  //couse: unable to bind parameter in line 10

  reg clk;
  reg rst;
  reg ebl;

  defparam tested_counter.bus_width = bus_width_;
  wire [bus_width_ - 1:0] out;
  counter tested_counter(clk, rst, ebl, out);


  initial
    begin      
      $dumpfile("counter_01_tb.vcd");
      $dumpvars(0, counter_tb);

      $display("time\t clk rst enable counter");
      $monitor("%g\t %b %b %b %b", $time, clk, rst, ebl, out);
      //every change in clk, rst, ebl cousing directive $monitor is executed
      clk = 0;
      rst = 0;
      ebl = 0;     
      #1 rst <= 1'b1;      
      #1 rst <= 1'b0;
      #1 ebl <= 1'b1;
      
      //so this reapeat loop is not needed, 
      //because $monitor from line 18
      //is executed every clk change
      repeat (16)
        begin 
          //#10
          //$monitor("%g\t %b %b %b %b", $time, clk, rst, ebl, out);
          //if($time > 1000) disable LOOP1
        end
           
      #30 ebl <= 1'b0;     
      $display("---------  that's all -------------");
      $finish;
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
      
endmodule //counter_tb
