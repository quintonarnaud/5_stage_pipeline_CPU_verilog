`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2018 02:33:01 PM
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(EX_rs, EX_rt, MEM_WriteRegisterRD, WB_WriteRegisterRD, RSMux, RTMux, MEM_RegWrite, WB_RegWrite, WriteDataMux, EX_MemWrite, AluSrc2, MEM_WriteDataMuxControl);
    
    input MEM_RegWrite, WB_RegWrite, EX_MemWrite, AluSrc2;
    input [4:0] EX_rs, EX_rt, MEM_WriteRegisterRD, WB_WriteRegisterRD;
    
    output reg [1:0] RSMux, RTMux;
    output reg WriteDataMux, MEM_WriteDataMuxControl;
    
    initial begin
        RSMux <= 2'b00;
        RTMux <= 2'b00;
        WriteDataMux <= 1'b0;
    end
    
    always @(EX_rs, EX_rt, MEM_WriteRegisterRD, WB_WriteRegisterRD, MEM_RegWrite, WB_RegWrite) begin
    
        //Decide RSMux
        if (EX_rs == MEM_WriteRegisterRD && MEM_RegWrite == 1'b1 && MEM_WriteRegisterRD != 5'd0) begin
            RSMux <= 2'b10;
        end
        else if (EX_rs == WB_WriteRegisterRD && WB_RegWrite == 1'b1 && WB_WriteRegisterRD != 5'd0) begin
            RSMux <= 2'b01;
        end
        else begin
            RSMux <= 2'b00;
        end
        
        //Decide RTMux
        if (EX_rt == MEM_WriteRegisterRD && MEM_RegWrite == 1'b1 && MEM_WriteRegisterRD != 5'd0 && AluSrc2 == 1'b0 && EX_MemWrite == 1'b0) begin
            RTMux <= 2'b10;
        end
        else if (EX_rt == WB_WriteRegisterRD && WB_RegWrite == 1'b1 && WB_WriteRegisterRD != 5'd0 && AluSrc2 == 1'b0 && EX_MemWrite == 1'b0) begin
            RTMux <= 2'b01;
        end 
        else begin
            RTMux <= 2'b00;
        end
        
        //Decide WriteDataMux [for sw]
        if (EX_rt == WB_WriteRegisterRD && EX_MemWrite == 1'b1 && WB_RegWrite == 1'b1 && WB_WriteRegisterRD != 5'd0) begin
            WriteDataMux <= 1'b1;
        end
        else begin
            WriteDataMux <= 1'b0;
        end
        
        //Decide MEM_WriteDataMuxControl lw followed by sw
        if (WB_WriteRegisterRD == MEM_WriteRegisterRD && WB_RegWrite == 1'b1 && MEM_RegWrite == 1'b0) begin
            MEM_WriteDataMuxControl <= 1'b1;
        end
        else begin
            MEM_WriteDataMuxControl <= 1'b0;
        end
    end
endmodule
