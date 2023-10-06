`timescale 1ns / 1ps

module MUX21(D1, D2, S, Y );

    input         S;
    input  [31:0] D1, D2;
    output [31:0] Y;

    assign Y = S ? D2:D1;
    
endmodule

