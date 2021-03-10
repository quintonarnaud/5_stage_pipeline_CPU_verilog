`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 12:34:34 PM
// Design Name: 
// Module Name: ControlMux
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


module ControlMux(noOp, ALUControl_c, shftAmt_c, RegDst_c, RegWrite_c, AluSrc2_c, MemRead_c, MemWrite_c, MemtoReg_c, PCSrc_c, Unsign_c, PCSrc_b_c, PCEight_c, writeRA_c, DataOp_c, ALUControl, shftAmt, RegDst, RegWrite, AluSrc2, MemRead, MemWrite, MemtoReg, PCSrc, Unsign, PCSrc_b, PCEight, writeRA, DataOp);

    input noOp;

	input [5:0] ALUControl_c; 
	input [4:0] shftAmt_c;
	input RegDst_c, RegWrite_c, AluSrc2_c, MemRead_c, MemWrite_c, MemtoReg_c, PCSrc_c, Unsign_c, PCSrc_b_c, PCEight_c, writeRA_c;
    input [1:0] DataOp_c;
    
    
    output reg [5:0] ALUControl; 
    output reg [4:0] shftAmt;
    output reg RegDst, RegWrite, AluSrc2, MemRead, MemWrite, MemtoReg, PCSrc, Unsign, PCSrc_b, PCEight, writeRA;
    output reg [1:0] DataOp;

    initial begin
        ALUControl <= ALUControl_c;
        RegDst <= RegDst_c;
        RegWrite <= RegWrite_c;
        AluSrc2 <= AluSrc2_c;
        MemRead <= MemRead_c;
        MemWrite <= MemWrite_c;
        MemtoReg <= MemtoReg_c;
        PCSrc <= PCSrc_c;
        Unsign <= Unsign_c;
        DataOp <= DataOp_c;
        PCSrc_b <= PCSrc_b_c;
        PCEight <= PCEight_c;
        writeRA <= writeRA_c;
        shftAmt <= shftAmt_c;
    end
    always @(*) begin

        //if the noOp flag is High set all the outputs to 0
        if (noOp == 1'b1) begin
            ALUControl <= 6'b0;
            RegDst <= 1'b0;
            RegWrite <= 1'b0;
            AluSrc2 <= 1'b0;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            MemtoReg <= 1'b0;
            PCSrc <= 1'b0;
            Unsign <= 1'b0;
            DataOp <= 2'b00;
            PCSrc_b <= 1'b0;
            PCEight <= 1'b0;
            writeRA <= 1'b0;
            shftAmt <= 5'b0;
        end
        //else set the outputs as the inputs
        else begin
            ALUControl <= ALUControl_c;
            RegDst <= RegDst_c;
            RegWrite <= RegWrite_c;
            AluSrc2 <= AluSrc2_c;
            MemRead <= MemRead_c;
            MemWrite <= MemWrite_c;
            MemtoReg <= MemtoReg_c;
            PCSrc <= PCSrc_c;
            Unsign <= Unsign_c;
            DataOp <= DataOp_c;
            PCSrc_b <= PCSrc_b_c;
            PCEight <= PCEight_c;
            writeRA <= writeRA_c;
            shftAmt <= shftAmt_c;
            
        end
    end
endmodule

