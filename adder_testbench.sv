// Test bench for adder
`timescale 1 ps / 100 fs

module adder_testbench();

	parameter ClockDelay = 100000;
	parameter width = 8;

	reg [width-1:0] BussA, BussB;

	wire [width-1:0] Output;

	integer i, j;

	// If your register file module is not named "alu" then you will
	// have to change the following line in order to create an instance of
	// your register file.  Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	adder add(.out(Output), .A(BussA), .B(BussB), .Cin(0));

	initial begin

		/* test the adder for every combos of a and b */
		BussA = 0;
		BussB = 0;
		#ClockDelay;
		for (int i = 0; i < width; i++) begin
			for (int j = 0; j < width; j++) begin
				BussA = i;
				BussB = j;
				#ClockDelay;
			end
		end
	end
endmodule