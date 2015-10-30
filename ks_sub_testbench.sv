// Test bench for adder
`timescale 1 ps / 100 fs

module ks_sub_testbench();

	parameter ClockDelay = 100000;
	parameter width = 8;

	reg P1, G1, P0, G0;

	integer i, j;

	adder ks_sub(P, G, P1, G1, P0, G0));

	initial begin
		for (int i = 0; i < 2; i++) begin
			for (int j = 0; j < 2; j++) begin
				P1 = j;
				P0 = i;
				G1 = j;
				G0 - i;
			end
		end
	end
endmodule