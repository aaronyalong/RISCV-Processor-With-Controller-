`timescale 1ns / 1ps

// Module definition
module ALUController(
    ALUOp, Funct7, Funct3, Operation
    );
    
    // Define the input and output signals
    input  [1:0] ALUOp;
    input  [6:0] Funct7;
    input  [2:0] Funct3;
    output [3:0] Operation;  
    reg [3:0] Operation;   
    
    // Define the ALUController modules behavior
    always@(*) 
    begin
        case({Funct3,ALUOp})
            5'b11110 : Operation = 4'b0000;     // AND operation
            5'b11010 : Operation = 4'b0001;     // OR operation
            5'b10010 : Operation = 4'b1100;     // NOR operation
            5'b01010 : Operation = 4'b0111;     // SLT operation
            5'b00010 : 
                if(Funct7 == 7'h00)             // ADD operation
                   Operation = 4'b0010; 
                else if (Funct7 == 7'h20)       // SUB operation
                   Operation = 4'b0110;         
            5'b11100 : Operation = 4'b0000;     // ANDI operation
            5'b11000 : Operation = 4'b0001;     // ORI operation
            5'b10000 : Operation = 4'b1100;     // NORI operation
            5'b01000 : Operation = 4'b0111;     // SLTI operation
            5'b00000 : Operation = 4'b0010;     // ADDI operation
            5'b01001 : Operation = 4'b0010;     // LW or SW operation
            default  : Operation = 4'b0000;     // default AND operation
        endcase
    end
endmodule // ALUController

