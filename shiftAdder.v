`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: shiftAdder
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


module shiftAdder(out, pcLine, immediate);

    input [31:0] pcLine, immediate;
    output reg [31:0] out;
    
      always@(pcLine, immediate)begin
        out <= pcLine + (immediate*4);
      end


endmodule
