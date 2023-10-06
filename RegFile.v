`timescale 1ns / 1ps

module RegFile(
  input clk, reset, rg_wrt_en,
  input [4:0] rg_wrt_addr, 
  input [4:0] rg_rd_addr1,
  input [4:0] rg_rd_addr2, 
  input [31:0] rg_wrt_data,
  output wire [31:0] rg_rd_data1,
  output wire [31:0] rg_rd_data2
);
    
    reg [31:0] reg16 [31:0];   
    integer i;
    
    always@(posedge clk, posedge reset) begin
        if(reset) begin
            for(i=0; i<32; i= i+1) 
                reg16[i] = 32'b0;
        end
        else
            if(rg_wrt_en)
                reg16[rg_wrt_addr] <= rg_wrt_data;
    end

    assign rg_rd_data1 = reg16[rg_rd_addr1];
    assign rg_rd_data2 = reg16[rg_rd_addr2];
    
endmodule
