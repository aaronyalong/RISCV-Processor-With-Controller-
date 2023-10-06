`timescale 1ns / 1ps

module FlipFlop(
   input  clk , reset,
   input  [7:0] d,
   output [7:0] q
   );

reg [7:0] q;

    always @(posedge clk)
    begin
    if (reset == 1'b1)
        begin
        q <= 1'b0;
        end
    else
        begin
        q <= d;
        end
        
    end
endmodule