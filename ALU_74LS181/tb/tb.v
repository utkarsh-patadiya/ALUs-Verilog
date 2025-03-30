`timescale 1ns / 1ps

module tb();
    reg [3:0] A, B, S;
    reg Cn, M;
    wire [3:0] F;
    wire G, P, Not_Cout, eq;
    
    // Instantiate the 74LS181 ALU.
    // Note: The module expects an inverted Cn (~Cn) for active-low carry.
    alu_74ls181 alu(A, B, S, ~Cn, M, F, G, P, Not_Cout, eq);
    
    initial begin

        A = 4'h1;    B = 4'h3;  S = 4'h9;    M = 1'b0;  Cn = 1'b0;   #10; 
        A = 4'h6;    B = 4'h6;  S = 4'h9;    M = 1'b0;  Cn = 1'b1;   #10; 
        A = 4'hf;    B = 4'he;  S = 4'h9;    M = 1'b0;  Cn = 1'b1;   #10; 
        A = 4'hf;    B = 4'hf;  S = 4'h9;    M = 1'b0;  Cn = 1'b1;   #10; 
        A = 4'hf;    B = 4'hf;  S = 4'h9;    M = 1'b0;  Cn = 1'b0;   #10; 
        A = 4'hf;    B = 4'ha;  S = 4'h9;    M = 1'b1;  Cn = 1'b0;   #10; 
        A = 4'hf;    B = 4'he;  S = 4'h6;    M = 1'b0;  Cn = 1'b0;   #10; 
        A = 4'hf;    B = 4'ha;  S = 4'h6;    M = 1'b0;  Cn = 1'b1;   #10; 
        A = 4'hf;    B = 4'hf;  S = 4'h6;    M = 1'b1;  Cn = 1'b0;   #10; 
        A = 4'hf;    B = 4'hf;  S = 4'h6;    M = 1'b1;  Cn = 1'b1;   #10; 
        A = 4'hf;    B = 4'ha;  S = 4'h6;    M = 1'b1;  Cn = 1'b0;   #10; 
        A = 4'ha;    B = 4'h0;  S = 4'h0;    M = 1'b1;  Cn = 1'b0;   #10;  
        A = 4'h9;    B = 4'h5;  S = 4'ha;    M = 1'b0;  Cn = 1'b0;   #10;  
        A = 4'h9;    B = 4'h5;  S = 4'ha;    M = 1'b0;  Cn = 1'b1;   #10;  
        A = 4'h9;    B = 4'h5;  S = 4'h0;    M = 1'b1;  Cn = 1'b1;   #10;  
        A = 4'h9;    B = 4'h5;  S = 4'h0;    M = 1'b1;  Cn = 1'b0;   #10;  
        A = 4'ha;    B = 4'h6;  S = 4'h5;    M = 1'b0;  Cn = 1'b0;   #10;  
        A = 4'ha;    B = 4'h6;  S = 4'h5;    M = 1'b0;  Cn = 1'b1;   #10;  
        A = 4'ha;    B = 4'h6;  S = 4'h5;    M = 1'b1;  Cn = 1'b1;   #10;  
        
        $finish;
    end
endmodule
