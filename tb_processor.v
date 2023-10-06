`timescale 1 ns / 1 ps

module tb_processor();

/** Clock & reset **/
reg clk, rst;
wire [31:0] tb_Result;

processor processor_inst(
    .clk        (clk),
    .reset      (rst),
    .Result     (tb_Result)
);

always begin
#10;
clk = ~clk;
end
    
initial begin
clk = 0;
@(posedge clk);
     rst = 1;
@(posedge clk);
     rst = 0;
end

integer point = 0;

always @(*)
    begin
        #20;
        if (tb_Result == 32'h00000000) // and r0, r0, r0 32'h00000000
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h00000001) // addi r1, r0, 1 32'h00000001
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h00000002) // addi r2, r0, 2 32'h00000002
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h00000004) // addi r3, r1, 3 32'h00000004
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000005) // addi r4, r1, 4 32'h00000005
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000007) // addi r5, r2, 5 32'h00000007
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h00000008) // addi r6, r2, 6 32'h00000008
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h0000000b) // addi r7, r3, 7 32'h0000000B
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h00000003) // add r8, r1, r2 32'h00000003
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'hfffffffe) // sub r9, r8, r4 32'hfffffffe
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000000) // and r10, r2, r3 32'h00000000
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000005) // or r11, r3, r4 32'h00000005
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000001) // (slt) if r3 is less than r4 then r12 = 1 32'h00000001
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'hfffffff4) // nor r13, r6, r7 32'hfffffff4
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h000004D2) // andi r14, r9, "4D3" 32'h000004D2
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'hfffff8d7) // ori r15, r11, "8d3" 32'hfffff8d7
        begin
            point = point + 1;
        end

        #20;
        if (tb_Result == 32'h00000001) // (slt) if r13 is less than 32'h000004D2 then r16 = 1 32'h00000000
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'hfffffb2c) // nori r17, r8, "4D2" 32'hfffffb2C
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000030) // sw r11, 48(r0) alu result = 32'h00000030
        begin
            point = point + 1;
        end;

        #20;
        if (tb_Result == 32'h00000030) // lw r12, 48(r0) alu result = 32'h00000030 , r12 = 32'h00000005
        begin
            point = point + 1;
        end;

        $display("%0d/20 tests passed successfully.", point);
    end

initial begin
    #430;
    $finish;
end

endmodule
