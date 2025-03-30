`timescale 1ns / 1ps

module alu_74ls181(
	input 	[3:0] A, 
	input 	[3:0] B,
	input	[3:0] S, 	// Selector
	input 	Cn, 		// carry input negation
	input 	M,			// Mode Logi
	output 	[3:0] F,			
	output 	G,			// Carry Generate
	output 	P, 			// Carry Propagate 
	output 	Not_Cout, 		// ~Cn+4
	output 	A_eq_B
    );
    wire [3:0] Pi,Gi;
    GeneratePropagateUnit U1( .A(A[0]) , .B(B[0]) , .S(S) , .G(Gi[0]) , .P(Pi[0]));
    GeneratePropagateUnit U2( .A(A[1]) , .B(B[1]) , .S(S) , .G(Gi[1]) , .P(Pi[1]));
    GeneratePropagateUnit U3( .A(A[2]) , .B(B[2]) , .S(S) , .G(Gi[2]) , .P(Pi[2]));
    GeneratePropagateUnit U4( .A(A[3]) , .B(B[3]) , .S(S) , .G(Gi[3]) , .P(Pi[3]));
    

    // Just some very long equations below
    // Refer to the actual Diagram Given in Refrences or Readme to Get Some Hint.

    assign F = { 
                ( Pi[3] ^ Gi[3] )^( ~( (~M & Pi[2]) | (~M & Pi[1] & Gi[2]) | (~M & Pi[0] & Gi[1] & Gi[2]) | (~M & Cn & Gi[0] & Gi[1] & Gi[2]) ) ),
                ( Pi[2] ^ Gi[2] )^( ~( (~M & Pi[1]) | (~M & Pi[0] & Gi[1]) | (~M & Cn & Gi[0] & Pi[0]) ) ),
                ( Pi[1] ^ Gi[1] )^( ~( (~M & Pi[0]) | (~M & Cn & Gi[0]) ) ),
                ( Pi[0] ^ Gi[0] )^( ~( ~M & Cn) )
            };
    assign A_eq_B = &F; 
    assign G = ~&Gi;
    assign P = ~( (Pi[0] & Gi[0] & Gi[2] & Gi[3]) | (Pi[1] & Gi[2] & Gi[3]) | (Pi[2] & Gi[3]) | Pi[3] );
    assign Not_Cout = (~(~(Cn & &Gi)))|~P;
endmodule
