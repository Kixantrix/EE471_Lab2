/*
Performs a 32 bit SLTU operation 
based on negative and overflow flags.
Outputs result as 1 if less than, otherwise 0.

Michael Von Hippel
*/

`timescale 1 ps / 100 fs

module sltu(negative, overflow, out);
	// Negative and overflow flags from subtraction
	input negative, overflow;
	// 32 bit output from system;
	output [31:0] out;
	parameter DELAY = 50;
	// Keep all other bits at 0.
	assign out[31:1] = 31'b0;
	
	xor #(DELAY) ngate(out[0], negative, overflow);
endmodule