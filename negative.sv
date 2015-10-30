/*
Return the two's comp of a number (well...just the negation...)
*/

module negative(out, in);

	output [31:0] out;
	input [31:0] in;

	parameter DELAY = 50;

	genvar i;
	generate
		for(i = 0; i < 32; i++) begin: nots
			not #(DELAY) (out[i], in[i]);
		end
	endgenerate

endmodule