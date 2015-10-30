// Test bench for adder
`timescale 1 ps / 100 fs

module adder_testbench();

	parameter ClockDelay = 1000;
	parameter width = 32;

	reg [width-1:0] BussA, BussB;

	wire [width-1:0] Output;

	longint i, j;

	// If your register file module is not named "alu" then you will
	// have to change the following line in order to create an instance of
	// your register file.  Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	adder add(.out(Output), .A(BussA), .B(BussB), .Cin(1'b0));

	initial begin

		/* test the adder for every combos of a and b */
		BussA = 0;
		BussB = 0;
		#ClockDelay;
		$display("%d",2147483647);
		for (int i = 0; i < 2147483647; i = i*23432) begin
			for (int j = 2147483647; j > 0; j = j - 1233534) begin
				BussA = i;
				BussB = j;
				#ClockDelay;
				assert(Output == i+j);
			end
		end
	end
endmodule