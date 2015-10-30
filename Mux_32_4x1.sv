`timescale 1 ps / 100 fs
/*
A four to one mux using only gates, with a 50ps delay.

Passes testbench
*/

module Mux_32_4x1(out, in, select);
output out[31:0];
input [3:0][31:0] in;
input [1:0] select;

parameter DELAY = 50;

wire [1:0] select_not;

//Generate statement for the select_not signals
//mostly generate practice...
genvar i;
generate
  for ( i = 0; i < 2; i = i+1 ) begin: notgates
    not #(DELAY) N( select_not[i], select[i]);
	end
endgenerate

genvar j;
generate 
for (j = 0; j < 32; j++) begin: gates
	wire [3:0] temps; //Wires to connect the and gates to the final or gate.
	and #(DELAY) zero(temps[0], select_not[0], select_not[1], in[0][i]);
	and #(DELAY) one(temps[1], select[0], select_not[1], in[1][i]);
	and #(DELAY) two(temps[2], select_not[0], select[1], in[2][i]);
	and #(DELAY) three(temps[3], select[0], select[1], in[3][i]);
	or #(DELAY) stage2(out[i], temps[0], temps[1], temps[2], temps[3]);
endgenerate


endmodule
