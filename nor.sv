/*
Performs a 32 bit bitwise NOR operation 
on a and b, outputting the result
to out. 

Michael Von Hippel
*/
module nor(a, b, out);
	// Two 32 bit inputs to the system
	input [31:0] a, b;
	// 32 bit output from system;
	output [31:0] out;

	// Bitwise NOR out of negation of OR
	assign out = ~(a | b);
endmodule