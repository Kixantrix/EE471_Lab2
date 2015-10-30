`timescale 1 ps / 100 fs
/*
A four to one mux using only gates, with a 50ps delay.

Passes testbench
*/

module Mux_32_4x1(out, in, select);

	output [31:0] out;
	input [3:0][31:0] in;
	input [1:0] select;

	genvar i;
	generate
	  for ( i = 0; i < 2; i = i+1 ) begin: muxes
	  	wire [31:0] out; 
	    Mux_32_2x1 Mux32(out, in[i*2+1:i*2], select[0]);
	  end
	endgenerate

	//final Mux_32_2x1 mux.
	Mux_32_2x1 FinalMux(.out(out), .in({muxes[0].out, muxes[1].out}), .select(select[1]));

endmodule
