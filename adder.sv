/*
A 32 bit Kogge–Stone adder

Author: Max Golub
*/

module adder(out, A, B)

  output [31:0] out;
  input [31:0] A, B;

  genvar i;
  generate //Create 32 adder_pgs to feed into the kogger-stone part
    for (i = 0; i < 32; i = i +1) begin: pg
      wire P, G;
      adder_pg bit(.P(P), .G(G), .a(A[i]), .b(B[i]));
    end
  endgenerate

  

endmodule
