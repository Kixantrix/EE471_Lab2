/*
Tests if a 32 bit number is all zeroes.
*/

`timescale 1 ps / 100 fs

module zero_test(in, out);
	
	input [31:0] in;
	output out;
	
	parameter DELAY = 50;

	
	genvar i, j;
	generate
		// Xnor every bit
		for(i = 0; i < 8; i++) begin: layer1
			wire l1;
			nor #(DELAY) xn1(l1, in[i*4], in[4*i+1], in[i*4+2], in[i*4+3]);
		end		
		// Combine every 4 to and gate
		for(j = 0; j < 2; j++) begin: layer2
			wire l2;
			and #(DELAY) xn2(l2, layer1[j*4].l1, layer1[j*4+1].l1, layer1[j*4+2].l1, layer1[j*4+3].l1);
		end
	endgenerate
	
	// Combine final two xnor  one more. 
	and #(DELAY) (out, layer2[0].l2, layer2[1].l2);
endmodule