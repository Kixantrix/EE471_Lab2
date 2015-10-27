/*
Propgate generate module for the Kogge-stone adder

Author: Maximilian Golub
*/

module adder_pg(P, G, a, b)

  output P, G;
  input a, b;

  parameter DELAY = 50;

  xor #(DELAY) (P, a, b);
  and #(DELAY) (G, a, b);


endmodule
