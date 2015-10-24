/*
A simple ALU for a 32 MIPs CPU.
Cabable of doing ADD, SUB, NOR, and SLTU.

Takes two 32 bit inputs, and produces one 32 bit output,
with zero, carryout, overflow, and negative flags.
*/

module ALU(out, zero, overflow, carryout, negative, bus_a, bus_b, alu_cntr);

  output [31:0] out;
  output zero, overflow, carryout, negative;
  input [31:0] bus_a, bus_b;
  input [1:0] alu_cntr


endmodule
