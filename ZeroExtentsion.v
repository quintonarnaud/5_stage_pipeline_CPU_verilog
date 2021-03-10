`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module ZeroExtension(in, out);
    /* A 16-Bit input word */
    input [15:0] in;

    /* A 32-Bit output word */
    output reg [31:0] out;
    
    /* Fill in the implementation here ... */
    always @ (in) begin
    	out <= { 16'd0 , in[15:0] };
    end
endmodule
