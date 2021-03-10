`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 10:11:24 PM
// Design Name: 
// Module Name: Mux32Bit4to1
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


module Mux32Bit4to1oneSEL(a, b, c, d, out, sel);
    input [31:0] a, b, c, d;
    input [1:0] sel;
    output reg [31:0] out;
   
    always @(a, b, c, d, sel) begin
        if (sel == 2'b00) begin
            out <= a;
        end
        else if (sel == 2'b01) begin
            out <= b;
        end
        else if (sel == 2'b10) begin
            out <= c;
        end
        else if (sel == 2'b11) begin
            out <= d;
        end
        else begin
            out <= a;
        end
    end
endmodule
