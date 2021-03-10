`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Quinton Arnaud 100%
//////////////////////////////////////////////////////////////////////////////////


module TopModule_tb();
    reg Reset_s, Clk_s;
    wire [31:0] PCResult, s0;
    wire [15:0] v0, v1;
    wire [6:0] out7;
    wire [7:0] en_out;
    
    TopModule tb(Clk_s, Reset_s, PCResult, s0, v0, v1, out7, en_out);
    initial begin
        Clk_s <= 1'b0;
        forever #100 Clk_s <= ~Clk_s;
    end
    initial begin
    Reset_s <= 1;
    @(posedge Clk_s)
    Reset_s <= 0;
    end
endmodule
