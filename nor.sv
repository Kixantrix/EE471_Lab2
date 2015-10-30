/*
Performs a 32 bit bitwise NOR operation 
on a and b, outputting the result
to out. 

Michael Von Hippel
*/
`timescale 1 ps / 100 fs

module Nor(a, b, out);
	// Two 32 bit inputs to the system
	input [31:0] a, b;
	// 32 bit output from system;
	output [31:0] out;
	parameter DELAY = 50;
	
	genvar i;
	generate
	  for ( i = 0; i < 32; i = i + 1 ) begin: nors
		 nor #(DELAY) ngate(out[i], a[i], b[i]);
	  end
	endgenerate
endmodule