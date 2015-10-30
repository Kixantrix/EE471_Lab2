/*
A simple ALU for a 32 MIPs CPU.
Cabable of doing ADD, SUB, NOR, and SLTU.

Takes two 32 bit inputs, and produces one 32 bit output,
with zero, carryout, overflow, and negative flags.
*/
//Output, CarryOut, zero, overflow, negative, BussA, BussB, ALUControl
module alu(out, carryout, zero, overflow, negative, bus_a, bus_b, alu_cntr);

  output [31:0] out;
  output zero, overflow, carryout, negative;
  input [31:0] bus_a, bus_b;
  input [1:0] alu_cntr;

  wire [31:0] adderOut, norOut, sltuOut, mux_b, b_neg;
  

  // sltu module with separate output
  sltu sltu_mod(.negative(adderOut[31]), .carry(carryout), .out(sltuOut));
  
  // 32 bit nor module for nor operation.
  Nor nor_mod(.a(bus_a), .b(bus_b), .out(norOut));
  
  // adder module 
  adder adder_mod(.out(adderOut), .Cout(carryout), .overflow(overflow), .A(bus_a), .B(mux_b), .Cin(alu_cntr[0]));
  
  negative neg_mod(.out(b_neg), .in(bus_b));
  
  // Select subtract or addition.
  Mux_32_2x1 sub_select(.out(mux_b), .in({b_neg, bus_b}), .select(alu_cntr[0]));

  Mux_32_4x1 out_select(.out(out), .in({sltuOut, norOut, adderOut, adderOut}), .select(alu_cntr));
  
  // Test if output is 0 and make flag.
  zero_test zero_tester(.in(out), .out(zero));
  
  assign negative = out[31];
  

endmodule
