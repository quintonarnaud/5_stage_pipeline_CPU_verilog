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


module EX_MEM_Reg(Clk, EX_MemoryToReg, EX_RegWrite, EX_PCSrc, EX_MemRead, EX_MemWrite, MEM_MemoryToReg, MEM_RegWrite, MEM_PCSrc, MEM_MemRead, MEM_MemWrite,
                  ALUResultIn, ALUResultOut, WriteDataIn, EX_ShiftAddResult, WriteDataOut, MEM_ShiftAddResult, EX_WriteRegister, MEM_WriteRegister, EX_DataOpp, MEM_DataOpp, EX_Zero, MEM_Zero,
                  EX_PCSrc_b, MEM_PCSrc_b, EX_PCAddResult, MEM_PCAddResult, EX_PCEight, MEM_PCEight, noOp);

                
    input Clk, noOp;

    input EX_MemoryToReg, EX_RegWrite, EX_Zero, EX_PCEight; // Write Back controls 
    input EX_MemRead, EX_MemWrite, EX_PCSrc, EX_PCSrc_b;  // Memory controls
    input [31:0] ALUResultIn, WriteDataIn, EX_ShiftAddResult, EX_PCAddResult; //32 bit data lines
    input [4:0] EX_WriteRegister;
    input [1:0] EX_DataOpp;

    output reg MEM_MemoryToReg, MEM_RegWrite, MEM_Zero, MEM_PCEight; // Write Back controls
    output reg MEM_MemRead, MEM_MemWrite, MEM_PCSrc, MEM_PCSrc_b;  // Memory controls
    output reg [31:0] ALUResultOut, WriteDataOut, MEM_ShiftAddResult, MEM_PCAddResult; //32 bit data lines
    output reg [4:0] MEM_WriteRegister;
    output reg [1:0] MEM_DataOpp;

    
    always@(posedge Clk) begin
        if(noOp == 1'b1)begin
           MEM_MemoryToReg  <= 1'b0;
           MEM_PCSrc        <= 1'b0;
           MEM_MemRead     <= 1'b0;
           MEM_MemWrite    <= 1'b0;
           ALUResultOut   <= 32'b0;
           WriteDataOut    <= 32'b0;
           MEM_ShiftAddResult <= 32'b0;
           MEM_RegWrite    <= 1'b0;
           MEM_WriteRegister  <= 5'b0;
           MEM_DataOpp      <= 2'b0;
           MEM_Zero <= 1'b0;
           MEM_PCSrc_b <= 1'b0;
           MEM_PCAddResult <= 32'b0;
           MEM_PCEight <= 1'b0;
        end
        else begin
           MEM_MemoryToReg  <=      EX_MemoryToReg;
           MEM_PCSrc        <=      EX_PCSrc;
           MEM_MemRead     <=      EX_MemRead;
           MEM_MemWrite    <=      EX_MemWrite;
           ALUResultOut   <=      ALUResultIn;
           WriteDataOut    <=      WriteDataIn;
           MEM_ShiftAddResult <=    EX_ShiftAddResult;
           MEM_RegWrite    <=     EX_RegWrite;
           MEM_WriteRegister  <=      EX_WriteRegister;
           MEM_DataOpp      <=      EX_DataOpp;
           MEM_Zero <= EX_Zero;
           MEM_PCSrc_b <= EX_PCSrc_b;
           MEM_PCAddResult <= EX_PCAddResult;
           MEM_PCEight <= EX_PCEight;
        end
   end
endmodule
