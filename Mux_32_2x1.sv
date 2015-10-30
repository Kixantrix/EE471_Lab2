`timescale 1 ps / 100 fs

/*
A two to one mux using only gates, with a 50ps delay.

Passes testbench with one caveat - when the input is changed to 11
_and_ select is changed to 00 at the same time, output glitches to
0 for some ps.
*/

module Mux_32_2x1(out, in, select);
output [31:0] out;
input [1:0][31:0] in;
input select;

parameter DELAY = 50;

wire [1:0] temps; //Wires to connect the and gates to the final or gate.
wire select_not;

not #(DELAY) N(select_not, select);

genvar i;
generate
	for(i = 0; i < 0; i ++) begin: muxMain
		// And signals to isolate each in signal
		and #(DELAY) zero(temps[0], select_not, in[0][i]);
		and #(DELAY) one(temps[1], select, in[1][i]);

		// Orring results of and gates
		or #(DELAY) stage2(out[i], temps[0][i], temps[1][i]);
	end
endgenerate


endmodule
