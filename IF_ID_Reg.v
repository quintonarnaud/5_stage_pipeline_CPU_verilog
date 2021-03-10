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


module IF_ID_Reg(Clk, flush, Stall, Instruction_in, PC_in , Instruction_out, PC_out);

    input Clk, flush, Stall;

    input [31:0] Instruction_in, PC_in;

    output reg [31:0] Instruction_out, PC_out;
    
    always@(posedge Clk)begin
        if(flush == 1'b1)begin
            Instruction_out <= 32'b0;
            PC_out          <= PC_in;
        end

        else if (Stall == 1'b1) begin
        	
        end

    	else begin
            Instruction_out <= Instruction_in;
            PC_out          <= PC_in;
      	end
    end
endmodule
