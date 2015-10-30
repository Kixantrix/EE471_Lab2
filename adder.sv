/*
A 32 bit Kogge–Stone adder

Author: Max Golub
*/
`timescale 1 ps / 100 fs

module adder(out, A, B, Cin);

	parameter width = 8;
	parameter DELAY = 50;
 	output [width-1:0] out;
  	input [width-1:0] A, B;
  	input Cin;

 	genvar i;
  	generate //Create 32 adder_pgs to feed into the kogger-stone part
    	for (i = 0; i < width; i = i +1) begin: pg
      		wire P, G;
      		adder_pg pg_gen(.P(P), .G(G), .a(A[i]), .b(B[i]));
    	end
 	endgenerate

 	wire [width-1:0] P, G, Pi1, Pi2, Gi1, Gi2;
 	//Pass down signal that arent going through ks_sub modules. 
 	assign P[0] = pg[0].P;
 	assign G[0] = pg[0].G;
 	assign Pi1[0] = pg[0].P;
 	assign Gi1[0] = pg[0].G;
 	assign Pi2[0] = pg[0].P;
 	assign Gi2[0] = pg[0].G;
 	//pass down bit one
 	assign Pi1[1] = P[1];
 	assign Gi1[1] = G[1];
 	assign Pi2[1] = Pi1[1];
 	assign Gi2[1] = Gi1[1];
 	//two
 	assign Pi2[2] = Pi1[2];
 	assign Gi2[2] = Pi1[2];
 	//3
 	assign Pi2[3] = Pi1[3];
 	assign Gi2[3] = Gi1[3];


	generate 
		for (i = 0; i < width; i = i +1) begin: main
			//wire P, G; 
			//wire Pi1, Gi1;
			//wire Pi2, Gi2;
			if(i != 0) //generate the first set of modules, which always connect back to i-1 except for 0.
				ks_sub  top_level(.P(P[i]), .G(G[i]), .P1(pg[i].P), .G1(pg[i].G), .P0(pg[i-1].P), .G0(pg[i-1].G));
			if(i > 1)
				ks_sub midlevel_1(.P(Pi1[i]), .G(Gi1[i]), .P1(P[i]), .G1(G[i]), .P0(P[i-2]), .G0(G[i-2]));
			if(i > 3) 
				ks_sub midlevel_2(.P(Pi2[i]), .G(Gi2[i]), .P1(Pi1[i]), .G1(Gi1[i]), .P0(Pi1[i-4]), .G0(Gi1[i-4]));
		end
	endgenerate

	wire[width-1:0] Cn;

	generate
		for (i = 0; i < width; i = i +1) begin: carry
			wire P_Cn;
      		and #(DELAY) (P_Cn, Pi2[i], Cin);
      		or #(DELAY) (Cn[i], P_Cn, Gi2[i]);
    	end
	endgenerate

	generate
		for (i = 0; i < width; i = i +1) begin: sum
      		if (i == 0) 
      			xor #(DELAY) (out[0], Pi2[i],0); //xor #(DELAY) (out[i], Pi2[i], 0); //no Cn-1 for i = 0?
      		else
      			xor #(DELAY) (out[i], Pi2[i], Cn[i-1]);
    	end
	endgenerate

  

endmodule
