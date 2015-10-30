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

  wire [31:0] adderOut, norOut, sltuOut, mux_b;
  
  wire [1:0][31:0] b_sel;
  assign b_sel[0] = bus_b;

  // sltu module with separate output
  sltu sltu_mod(.negative(negative), .overflow(overflow), .out(sltuOut));
  
  // 32 bit nor module for nor operation
  nor_32 nor_mod(.a(bus_a), .b(bus_b), .out(norOut));
  
  // adder module which accepts mux out to choose 
  adder adder_mod(.out(adderOut), Cout(Cout), .A(bus_a), .B(b_sel[alu_cntr[0]]), .Cin(alu_cntr[0]));
  
  // Select subtract or addition
  //Mux_32_2x1 sub_select(.out(mux_b), .in({bus_b, ~bus_b}), .select(alu_cntr[0]);
  negative neg_mod(.out(b_sel[1]), .in(bus_b))
  // Select correct output from submodules
  Mux_32_4x1 out_select(.out(out), .in({adderOut, adderOut, norOut, sltuOut}), .select(alu_cntr));

endmodule
