`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2018 05:59:48 PM
// Design Name: 
// Module Name: ANDgate
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


module ANDgate(A, B, out);
    input A, B;
    output reg out;
    
    always@(A , B) begin
        if (A == 1'b1 && B == 1'b1) begin
            out <= 1;
        end
        else begin
            out <= 0;
        end
    end
endmodule
