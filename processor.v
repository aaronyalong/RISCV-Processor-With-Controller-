`timescale 1ns / 1ps

module processor
(
    input clk, reset,
    output [31:0] Result
);

// Define the input and output signals
    wire reg_write;
    wire mem2reg;
    wire alu_src;
    wire mem_write;
    wire mem_read;
    wire [3:0] alu_cc;
    wire [6:0] opcode, funct7;
    wire [2:0] funct3;
    wire [1:0] alu_op;
    
// Define the processor modules behavior
     Controller controller( .Opcode(opcode), .ALUSrc(alu_src), .MemtoReg(mem2reg),
     .MemWrite(mem_write), .MemRead(mem_read), .RegWrite(reg_write), .ALUOp(alu_op) );
                    
     ALUController ALU_controller( .ALUOp(alu_op), .Funct3(funct3), 
     .Funct7(funct7), .Operation(alu_cc) );
                        
     data_path datapath(  .clk(clk), .reset(reset), .reg_write(reg_write), .mem2reg(mem2reg),
     .alu_src(alu_src), .mem_write(mem_write), .mem_read(mem_read), .alu_cc(alu_cc),
     .opcode(opcode), .funct3(funct3), .funct7(funct7), .alu_result(Result) );

endmodule // processor

