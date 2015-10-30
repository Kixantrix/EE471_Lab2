/*
A 32 bit Kogge–Stone adder

Author: Max Golub
*/

module adder(out, A, B, Cin);

	parameter width = 8;
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
 	assign Pi1[0] = pg.P[0];
 	assign Pi2[0] = pg.P[0];
 	assign Gi1[0] = pg.G[0];
 	assign Gi2[0] = pg.G[0];

	generate 
		for (i = 0; i < width; i = i +1) begin: main
			//wire P, G; 
			//wire Pi1, Gi1;
			//wire Pi2, Gi2;
			if(i != 0) begin //generate the first set of modules, which always connect back to i-1 except for 0.
				ks_sub  top_level(.P(P[i]), .G(G[i]), .P1(pg.P[i]), .G1(pg.G[i]), .P0(pg.P[i-1]), .G0(pg.G[i-1]));
			end
			if(i > 1) begin
				ks_sub midlevel_1(.P(Pi1[i]), .G(Gi1[i]), .P1(P[i]), .G1(G[i]), .P0(P[i-2]), .G0(G[i-2]));
			end
			if(i > 3) begin
				ks_sub midlevel_2(.P(Pi2[i]), .G(Gi2[i]), .P1(Pi1[i]), .G1(Gi1[i]), .P0(Pi1[i-4]), .G0(Gi1[i-4]));
			end
		end
	endgenerate

	wire[width-1:0] Cn;

	generate
		for (i = 0; i < width; i = i +1) begin: carry
      		and(P_Cn, main.Pi2[i], Cin);
      		or(Cn, P_cn, main.Gi2[i]);
    	end
	endgenerate

	generate
		for (i = 0; i < width; i = i +1) begin: sum
      		if (i == 0) begin
      			xor(out[i], main.Pi2[i], 0); //no Cn-1 for i = 0?
      		end
      		xor(out[i], main.Pi2[i], Cn[i]);
    	end
	endgenerate

  

endmodule
