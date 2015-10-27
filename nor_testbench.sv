/*
Test bench for 32 bit bitwise NOR operator.
Test cases: All 0 with all 0,
all 1 with all 1,
all 1 with all 0,
low value with large value,
same values of mid size,

Michael Von Hippel
*/
`timescale 1 ps / 100 fs

module nor_testbench();
	
	parameter Delay = 5000;

	reg [31:0] a, b;
	wire [31:0] out;

	Nor dut(.a(a). .b(b), .out(out)); 

	integer i;
	initial begin
		a <= 32'b0;
		b <= 32'b0;
		#(Delay);

		a <= 32'b0;
		b <= 32'b1;
		#(Delay);

		a <= 32'b1;
		b <= 32'b1;
		#(Delay);

		a <= 32'b00000000000000000000000010010011;
		b <= 32'b10010100111010010100001110000110;
		#(Delay);

		a <= 32'b00000000000101001110101010010011;
		b <= 32'b00000000011010010100001110000110;
		#(Delay);

		$stop;
	end	
endmodule