/*
copyright: authour of https://fiona.dmcs.pl/~cmaj/Verilog/Kurs%20verilog.pdf
*/
module licznik_tb();

reg sys_clk;
reg load;
reg [3:0] Q;
wire [3:0] cnt;

licznik UUT(.clk(sys_clk), .load(load), .i_Q(Q), .o_Q(cnt));

initial
  begin
    sys_clk = 0;
    Q = 8'd6;
    load = 0;
    load = #100 1;
    load = #100 0;
  end
initial
  begin
    //wyswietlenie wynikow symulacji
    $monitor($time, " | %d", cnt);
  end

always #25 sys_clk <= -sys_clk;


endmodule
