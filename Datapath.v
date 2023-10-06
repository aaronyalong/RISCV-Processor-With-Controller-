`timescale 1ns / 1ps

module data_path #(
    parameter PC_W = 8,       // Program Counter
    parameter INS_W = 32,     // Instruction Width
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32,    // Data WriteData
    parameter DM_ADDRESS = 9, // Data Memory Address
    parameter ALU_CC_W = 4    // ALU Control Code Width
 )(
    input                  clk ,    // CLK in datapath figure
    input                  reset,   // Reset in datapath figure      
    input                  reg_write,   // RegWrite in datapath figure
    input                  mem2reg,     // MemtoReg in datapath figure
    input                  alu_src,     // ALUSrc in datapath figure 
    input                  mem_write,   // MemWrite in datapath figure  
    input                  mem_read,    // MemRead in datapath figure          
    input  [ALU_CC_W-1:0]  alu_cc,      // ALUCC in datapath figure
    output          [6:0]  opcode,      // opcode in dataptah figure
    output          [6:0]  funct7,      // Funct7 in datapath figure
    output          [2:0]  funct3,      // Funct3 in datapath figure
    output   [DATA_W-1:0]  alu_result   // Datapath_Result in datapath figure
 );

    wire  [PC_W-1:0]  pc, pc_next;
    wire  [INS_W-1:0] Instruction;
    wire  [DATA_W-1:0] reg1;
    wire  [DATA_W-1:0] reg2;
    wire  [DATA_W-1:0] SrcB;
    wire  [DATA_W-1:0] ExtImm;
    wire  [DATA_W-1:0] DataMem_Read;
    wire  [DATA_W-1:0] WriteBack_Data;
    
    wire  [DATA_W-1:0] l_alu_result;
    
                      
    // next pc
    assign pc_next = pc + 4;
    FlipFlop FF( .clk(clk), .reset(reset), .d(pc_next), .q(pc));
    
    // instruction memory 
    InstMem IM( .addr(pc), .instruction(Instruction));
    
    assign opcode = Instruction[6:0];
    assign funct3 = Instruction[14:12];
    assign funct7 = Instruction[31:25];
    
    // register file
    RegFile RF( 
         .clk           (clk),
         .reset         (reset),
         .rg_wrt_en     (reg_write),
         .rg_wrt_addr   (Instruction[11:11-RF_ADDRESS+1]),
         .rg_rd_addr1   (Instruction[19:19-RF_ADDRESS+1]),
         .rg_rd_addr2   (Instruction[24:24-RF_ADDRESS+1]),
         .rg_wrt_data   (WriteBack_Data),
         .rg_rd_data1   (reg1),
         .rg_rd_data2   (reg2) );
    
    MUX21 M1( .D1(reg2), .D2(ExtImm), .S(alu_src), .Y(SrcB) );
    
    // sign extend
    ImmGen IG( .InstCode(Instruction), .ImmOut(ExtImm) );
    
    // alu 
    alu_32 ALU( .A_in(reg1), .B_in(SrcB), .ALU_Sel(alu_cc),
    .ALU_Out(alu_result), .Carry_Out(), .Zero(), .Overflow() );
    
    // data memory
    DataMem DM( .MemWrite(mem_write), .MemRead(mem_read), 
    .addr(alu_result[DM_ADDRESS-1:0]), .write_data(reg2), .read_data(DataMem_Read) );

    MUX21 M2( .D1(alu_result), .D2(DataMem_Read), .S(mem2reg), .Y(WriteBack_Data) );
endmodule