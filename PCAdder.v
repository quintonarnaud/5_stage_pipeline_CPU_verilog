`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  
// Module - PCAdder.v
// Description - 32-Bit program counter (PC) adder.
// 
// INPUTS:-
// PCResult: 32-Bit input port.
// 
// OUTPUTS:-
// PCAddResult: 32-Bit output port.
//
// FUNCTIONALITY:-
// Design an incrementor (or a hard-wired ADD ALU whose first input is from the 
// PC, and whose second input is a hard-wired 4) that computes the current 
// PC + 4. The result should always be an increment of the signal 'PCResult' by 
// 4 (i.e., PCAddResult = PCResult + 4).
////////////////////////////////////////////////////////////////////////////////

module PCAdder(PCResult, PCAddResult, Reset);
    input [31:0] PCResult;
    input Reset;
    output reg [31:0] PCAddResult;
    initial begin
        PCAddResult <= 0;
    end
    always @(*) begin
        if (Reset == 1'b0) begin
            PCAddResult <= PCResult + 32'd4;
        end
        else begin
            PCAddResult <= 32'd0;
        end
    end
endmodule
