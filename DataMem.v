`timescale 1ns / 1ps

module DataMem( MemRead, MemWrite, addr, write_data, read_data);

   input MemRead, MemWrite;
   input [8:0] addr;
   input [31:0] write_data;
   output reg [31:0] read_data;

   reg [31:0] mem[0:127];  // 128 x 32 memory

   always @(*)
   begin
      if(MemRead)
         read_data = mem[addr[8:2]];
      else if(MemWrite)
         mem[addr[8:2]] = write_data;
      else
         read_data = 32'hzzzzzzzz; // default value
   end

endmodule