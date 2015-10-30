// Test bench for adder
`timescale 1 ps / 100 fs

module adder_testbench();

	parameter ClockDelay = 10000;
	parameter width = 32;

	reg [width-1:0] BussA, BussB;

	wire [width-1:0] Output;
	wire Cout, overflow;

	reg Cin;

	longint i, j;

	adder add(.out(Output), .Cout(Cout), .overflow(overflow), .A(BussA), .B(BussB), .Cin(Cin));

	initial begin

		/* test the adder for every combos of a and b */
		Cin = 1'b0;
		BussA = 0;
		BussB = 0;
		#ClockDelay;
		Cin = 1'b1;
		BussA = 32'b111111111111111111111111111111110;
		BussB = 32'b000000000000000000000000000000100;
		#ClockDelay;
		$display("%d",2147483647);
		Cin = 1'b0;
		for (int i = 2147483647/2; i > 0; i = i-2043502) begin
			for (int j = 2147483647/2; j > 0; j = j - 1233234) begin
				BussA = i;
				BussB = j;
				#ClockDelay;
				assert(Output == i+j) else $fatal;
			end
		end
	end
endmodule