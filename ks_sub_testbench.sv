// Test bench for adder
`timescale 1 ps / 100 fs

module ks_sub_testbench();

	parameter ClockDelay = 100000;

	reg P1, G1, P0, G0;

	integer i, j;

	ks_sub ks(P, G, P1, G1, P0, G0);

	initial begin
		P1 = 1;
		P0 = 0;
		G0 = 0;
		G1 = 0;
		#ClockDelay;
		for (int i = 0; i < 2; i++) begin
			for (int j = 0; j < 2; j++) begin
				P1 = j;
				P0 = i;
				G1 = j;
				G0 = i;
				#ClockDelay;
			end
		end
	end
endmodule