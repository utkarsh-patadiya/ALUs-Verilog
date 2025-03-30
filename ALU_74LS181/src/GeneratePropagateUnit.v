`timescale 1ns / 1ps

// Intermidiate Module for Generate Carry and Propagate Carry Based on Selector S.

module GeneratePropagateUnit(
	input A,
	input B,
	input [3:0] S,
	output G,
	output P
    );
    
    assign G = ~	( (~B & S[2] & A ) | ( A & S[3] & B ) );
    assign P = ~	( A | ( B & S[0] ) | ( S[1] & ~B ) );
endmodule
