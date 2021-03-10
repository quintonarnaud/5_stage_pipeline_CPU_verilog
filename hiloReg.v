`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 07:13:50 PM
// Design Name: 
// Module Name: hiloReg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hiloReg(fromALU, toALU, Clk);
    input Clk;
    input [31:0] fromALU;
    
    reg [31:0] val;
    
    output reg [31:0] toALU;
    
    always @(posedge Clk) begin
        val <= fromALU;
    end
    
    always @(negedge Clk) begin
        toALU <= val;
    end
endmodule
