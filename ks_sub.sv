/*
kogge stone submodule, which are chained together to form a full adder.

Author: Maximilian Golub
*/

`timescale 1 ps / 100 fs

module ks_sub(P, G, P1, G1, P0, G0);

  output P, G;
  input P0, G0, P1, G1;

  parameter DELAY = 50;

  and #(DELAY) (OR1, P1, G0);
  and #(DELAY) (P, P0, P1);
  or #(DELAY) (G, OR1, G1);

endmodule
