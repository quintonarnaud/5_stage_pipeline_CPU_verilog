`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: 
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


////needs the 

module MEM_WB_Reg(Clk, MEM_MemoryToReg, MEM_RegWrite, WB_MemoryToReg, WB_RegWrite, AluResultIn, AluResultOut, DataMemoryResultIn, DataMemoryResultOut, 
MEM_WriteRegister, WB_WriteRegister, MEM_PCAddResult, WB_PCAddResult, MEM_PCEight, WB_PCEight);
                  
    input Clk;

    input MEM_MemoryToReg, MEM_RegWrite, MEM_PCEight;
    input [31:0] AluResultIn, DataMemoryResultIn, MEM_PCAddResult;
    input [4:0] MEM_WriteRegister;
    
    output reg WB_MemoryToReg, WB_RegWrite, WB_PCEight;
    output reg [31:0] AluResultOut, DataMemoryResultOut, WB_PCAddResult;
    output reg [4:0] WB_WriteRegister;
            
                  
    always@(posedge Clk) begin
//        if (noOp == 1'b1) begin
//             WB_MemoryToReg       <= 1'b0;
////             WB_RegWrite            <= 1'b0;
////             AluResultOut         <= 32'b0;
////             DataMemoryResultOut <= 32'b0;
////             WB_WriteRegister <= 5'b0;
////             WB_PCAddResult <= 32'b0;
////             WB_PCEight <= 1'b0;
////        end
//        else begin
             WB_MemoryToReg       <=    MEM_MemoryToReg;
             WB_RegWrite            <=    MEM_RegWrite;
             AluResultOut         <=    AluResultIn;
             DataMemoryResultOut <=    DataMemoryResultIn;
             WB_WriteRegister <= MEM_WriteRegister;
             WB_PCAddResult <= MEM_PCAddResult;
             WB_PCEight <= MEM_PCEight;
    end
endmodule
