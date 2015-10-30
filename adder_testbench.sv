// Test bench for adder
`timescale 1 ps / 100 fs

module adder_testbench();

	parameter ClockDelay = 100000;
	parameter width = 32;

	reg [width-1:0] BussA, BussB;

	wire [width-1:0] Output;
	wire Cout;

	longint i, j;

	// If your register file module is not named "alu" then you will
	// have to change the following line in order to create an instance of
	// your register file.  Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	adder add(.out(Output), .Cout(Cout), .A(BussA), .B(BussB), .Cin(1'b0));

	initial begin

		/* test the adder for every combos of a and b */
		BussA = 0;
		BussB = 0;
		#ClockDelay;
		$display("%d",2147483647);
		for (int i = 2147483647/2; i > 0; i = i-2043502) begin
			for (int j = 2147483647/2; j > 0; j = j - 1233234) begin
				BussA = i;
				BussB = j;
				#ClockDelay;
				assert(Output == i+j) else $fatal;
			end
		end
		//BussA = 2147483647/2;
		//BussB = 2147483647/2;
		//#ClockDelay;
		//BussA = 871435125;
		//BussB = 851759703;
		//#ClockDelay;
		//assert(Output == BussB+BussA);
	end
endmodule