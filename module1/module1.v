module and3 (x1, x2, x3, y);

/*
modul - opis
instancja - wywolanie modulu
input, output, inout
*/
input x1, x2, x3;
output y;

//przypisz
assign y = x1 & x2 & x3;

endmodule

module box (
input x1, x2, x3, x4, x5, x6, output y);

wire y1, y2;
and3 a1(x1, x2, x3, y1);
and3 a2(x4, x5, x6, y2);
assign y = y1 | y2;
endmodule


