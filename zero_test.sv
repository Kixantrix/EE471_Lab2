/*
Tests if a 32 bit number is all zeroes.
*/
module zero_test(in, out);
	input [31:0] in;
	output out;
	
	wore[31:0] xnor_out;
	wire [8:0] first_layer;
	wire [1:0] second_layer;
	
	genvar i, j, k;
	generate
		// Xnor every bit
		for(i = 0; i < 32; i++) begin: xnor_gates
			xnor xnoring(xnor_out[i], 0, in[i);
		end
		
		// Combine every 4 to and gate
		for(j = 0; j < 8; j++) begin: first_stage
			and(
			first_layer[j], xnor_out[4 * i], xnor_out[4 * i + 1], xnor_out[4 * i + 2], xnor_out[4 * i + 3]
			);
		end
		
		// Combine every 4 and gates
		for(k = 0; k < 2; k++) begin: second_stage
			and(
			second_layer[k], first_layer[4 * i], first_layer[4 * i + 1], first_layer[4 * i + 2], first_layer[4 * i + 3]
			);
		end
	endgenerate
	
	// Combine final two and gates.
	and final_and(out, second_layer[0], second_layer[1]);
endmodule