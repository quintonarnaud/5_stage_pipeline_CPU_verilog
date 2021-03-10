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
 
module ID_EX_Reg(Clk, noOp, ID_MemoryToReg, ID_PCSrc, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_shftAmt, ID_aluSrc2, ID_RegDst, 
    ID_AluControl, ReadData1In, ReadData2In, PCresultIn, ImmediateIn, RTInstructionIn, RDInstructionIn, EX_MemoryToReg, 
    EX_PCSrc, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_shftAmt, EX_aluSrc2, EX_RegDst, EX_AluControlOut, ReadData1Out, ReadData2Out, 
    PCresultOut, ImmediateOut, RTInstructionOut, RDInstructionOut, ID_DataOpp, EX_DataOpp, ID_PCSrc_b, EX_PCSrc_b, ID_PCEight, EX_PCEight,
    ID_writeRA, EX_writeRA, ID_jalTarget, EX_jalTarget, ID_AluSrc1, EX_AluSrc1); 
    
    input Clk, noOp;

    input ID_MemoryToReg, ID_PCSrc, ID_RegWrite, ID_PCSrc_b, ID_PCEight; // Write Back controls 
    input ID_MemRead, ID_MemWrite, ID_AluSrc1;  // Memory controls
    input [4:0] ID_shftAmt;
    input ID_aluSrc2, ID_RegDst, ID_writeRA; //Ex contoles
    input [5:0] ID_AluControl; //Alu control signal
    input [31:0] ReadData1In, ReadData2In, PCresultIn, ImmediateIn; //32 bit data lines
    input [4:0] RTInstructionIn, RDInstructionIn;                   //5 bit data lines
    input [1:0] ID_DataOpp;
    input [25:0] ID_jalTarget;
    
    output reg EX_MemoryToReg, EX_PCSrc, EX_RegWrite, EX_PCSrc_b, EX_PCEight; // Write Back controls 
    output reg EX_MemRead, EX_MemWrite, EX_AluSrc1;  // Memory controls
    output reg [4:0] EX_shftAmt;
    output reg EX_aluSrc2, EX_RegDst, EX_writeRA; //Ex contoles
    output reg [5:0] EX_AluControlOut; //Alu control signal
    output reg [31:0] ReadData1Out, ReadData2Out, PCresultOut, ImmediateOut; //32 bit data lines
    output reg [4:0] RTInstructionOut, RDInstructionOut;                   //5 bit data lines
    output reg [1:0] EX_DataOpp;
    output reg [25:0] EX_jalTarget;
    
    always@(posedge Clk) begin
        if(noOp == 1'b1)begin
            EX_MemoryToReg   <=  1'b0;
            EX_PCSrc         <=  1'b0;
            EX_RegWrite      <=  1'b0;
            EX_MemRead       <=  1'b0;
            EX_MemWrite      <=  1'b0;
            EX_shftAmt       <=  5'b0;
            EX_aluSrc2       <=  1'b0;
            EX_RegDst        <=  1'b0;
            EX_AluControlOut <=  6'b0;
            ReadData1Out     <=  32'b0;
            ReadData2Out     <=  32'b0;
            PCresultOut      <=  32'b0;
            ImmediateOut     <=  32'b0;
            RTInstructionOut <=  5'b0;
            RDInstructionOut <=  5'b0;
            EX_DataOpp       <=  2'b0;
            EX_PCSrc_b       <=  1'b0;
            EX_PCEight       <=  1'b0;
            EX_writeRA       <=  1'b0;
            EX_jalTarget     <=  26'b0;
            EX_AluSrc1       <=  1'b0;
        end
        else begin    
            EX_MemoryToReg   <=  ID_MemoryToReg;
            EX_PCSrc         <=  ID_PCSrc;
            EX_RegWrite      <=  ID_RegWrite;
            EX_MemRead       <=  ID_MemRead;
            EX_MemWrite      <=  ID_MemWrite;
            EX_shftAmt       <=  ID_shftAmt;
            EX_aluSrc2       <=  ID_aluSrc2;
            EX_RegDst        <=  ID_RegDst;
            EX_AluControlOut    <= ID_AluControl;
            ReadData1Out     <=  ReadData1In;
            ReadData2Out     <=  ReadData2In;
            PCresultOut      <=  PCresultIn;
            ImmediateOut     <=  ImmediateIn;
            RTInstructionOut <=  RTInstructionIn;
            RDInstructionOut <=  RDInstructionIn;
            EX_DataOpp       <=  ID_DataOpp;
            EX_PCSrc_b <= ID_PCSrc_b;
            EX_PCEight <= ID_PCEight;
            EX_writeRA <= ID_writeRA;
            EX_jalTarget <= ID_jalTarget;
            EX_AluSrc1 <= ID_AluSrc1;
        end
    end
endmodule
