/*
Test bench for 32 bit bitwise SLTU operator.
Test cases: 
All permutations of negative, overflow.
Separate of creating the flags themsevles.

Michael Von Hippel
*/
`timescale 1 ps / 100 fs

module sltu_testbench();
	
	parameter Delay = 5000;

	reg negative, overflow;
	wire [31:0] out;

	sltu dut(.negative(negative), .overflow(overflow), .out(out));

	initial begin
		negative <= 0;
		overflow <= 0;
		#(Delay);

		negative <= 1;
		overflow <= 0;
		#(Delay);

		negative <= 0;
		overflow <= 1;
		#(Delay);

		negative <= 1;
		overflow <= 1;
		#(Delay);

		$stop;
	end	
endmodule