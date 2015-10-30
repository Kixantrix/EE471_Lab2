/*
Performs a 32 bit SLTU operation 
based on negative and overflow flags.
Outputs result as 1 if less than, otherwise 0.

Michael Von Hippel
*/

`timescale 1 ps / 100 fs

module sltu(negative, carry, out);
	// Negative and overflow flags from subtraction
	input negative, carry;
	// 32 bit output from system;
	output [31:0] out;
	parameter DELAY = 50;
	// Keep all other bits at 0.
	assign out[31:1] = 31'b0;
	//assign out[0] = ~overflow;
	not #(DELAY) n(out[0], carry);
	//and #(DELAY) ngate(out[0], negative, overflow);
endmodule