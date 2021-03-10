`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2018 04:06:13 PM
// Design Name: 
// Module Name: HazardDetectionUnit
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


module HazardDetectionUnit(EX_MemRead, EX_MemWrite, MEM_PCSrc, MEM_PCSrc_b, EX_RT, FD_RS, FD_RT, Stall_Pc, IF_ID_RegStall, Stall_Controler, flush, ID_MemWrite);

input EX_MemRead, EX_MemWrite, MEM_PCSrc, MEM_PCSrc_b, ID_MemWrite;
input [4:0] EX_RT, FD_RS, FD_RT;
output reg Stall_Pc, IF_ID_RegStall, Stall_Controler, flush;

    initial begin
        Stall_Pc <= 1'b0;
        IF_ID_RegStall <= 1'b0;
        Stall_Controler <= 1'b0;
        flush <= 1'b0;
    end
    always @(*) begin
        if ((FD_RS == EX_RT) && (EX_MemRead == 1'b1) && (ID_MemWrite == 0'b0)) begin  //lw then ari dependence
            Stall_Pc <= 1'b1;
            IF_ID_RegStall <= 1'b1;
            Stall_Controler <= 1'b1;
        end
        else if ((FD_RT == EX_RT) && (EX_MemRead == 1'b1) && (ID_MemWrite == 0'b0)) begin  //lw then ari dependence
            Stall_Pc <= 1'b1;
            IF_ID_RegStall <= 1'b1;
            Stall_Controler <= 1'b1;
        end
        else begin
            Stall_Pc <= 1'b0;
            IF_ID_RegStall <= 1'b0;
            Stall_Controler <= 1'b0;
        end

        if ((MEM_PCSrc == 1'b1)||(MEM_PCSrc_b == 1'b1)) begin
            flush <= 1'b1;
        end 
        else begin
            flush <= 1'b0;
        end
    end
endmodule
