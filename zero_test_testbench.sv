// Test bench for the zero tester.
`timescale 1 ps / 100 fs

module zero_test_testbench();

	parameter ClockDelay = 100000;

	reg [31:0] in;
	wire out;

	integer i;

	zero_test zt(.out(out), .in(in));

	initial begin
		for (i = 0; i < 2^31-1; i++) begin //test all the numbers
			in = i;
			if(i == 0)
				assert(out == 1);
			else
				assert(out == 0) else $error("NOT CORRECT");
			#ClockDelay;
		end
	end
endmodule