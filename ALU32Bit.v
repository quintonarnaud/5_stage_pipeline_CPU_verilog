`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////
module ALU32Bit(ALUControl, A, B, ALUResult, Zero, inputHI, inputLO, outputHI, outputLO, shftAmt, jalTarget, EX_PCAddResult);

    input [5:0] ALUControl; 
    input [4:0] shftAmt;  //this comes from 10:6 bits of intsruction, shifter for rotr and rotrv, will wire from controller
    input [31:0] A, B, inputHI, inputLO, EX_PCAddResult;
    input [25:0] jalTarget;
    
    output reg [31:0] ALUResult, outputHI, outputLO;    
    output reg Zero;
    
    reg [31:0] tmp;
    reg [63:0] temp, temp2, temp3, temp4;
    
    always @(ALUControl, A, B) begin
        case (ALUControl)
            //Arithmetic
            //add
            (6'b000000):
                ALUResult <= A + B;
            //sub
            (6'b000001):
                ALUResult <= A - B;
            //MUL
            (6'b000010):
                ALUResult <= A * B;
            //mult
            (6'b000011): 
                {outputHI, outputLO} <= $signed(A) * $signed(B);
            //Logical
            //and
            (6'b000100):
                ALUResult <= A & B;
            //nor
            (6'b000101):
                ALUResult <= ~(A | B);
            //or
            (6'b000110):
                ALUResult <= (A | B);
            //sll
            (6'b000111):
                ALUResult <= B << shftAmt;
            //sra
            (6'b001000):
                ALUResult <= B >>> shftAmt;
            //srl
            (6'b001001):
                ALUResult <= B >> shftAmt;
            //xor
            (6'b001010):
                ALUResult <= A ^ B;
            //slt
            (6'b001011):
                ALUResult <= (A < B) ? 32'd1 : 32'd0;
            //movn
            (6'b001100):
                if (B != 32'd0) begin
                    ALUResult <= A;
                end
                else begin
                    ALUResult <= 32'd0;
                end
            //movz
            (6'b001101):
                if (B == 32'd0) begin
                    ALUResult <= A;
                end 
                else begin
                    ALUResult <= 32'd0;
                end
            //rotrv
            (6'b001110): begin 
                ALUResult <= ( (B >> A) | (B << (32-A)) );
                end
            //rotr
            (6'b001111): begin
                ALUResult <= ( (B >> shftAmt) | (B << (32-shftAmt)) );
                end
            //lui
            (6'b010000):
                ALUResult <= B << 16;
            //Hi/Lo
            //mfhi
            (6'b010001):
                ALUResult <= inputHI;
            //mflo
            (6'b010010):
                ALUResult <= inputLO;
            //mthi
            (6'b010011):
                outputHI <= A;
            //mtlo
            (6'b010100):
                outputLO <= A;     
            //MSUB  
            (6'b010101):
                {outputHI, outputLO} <= $signed( {inputHI, inputLO} - ($signed(A) * $signed(B)));
            //MADD
            (6'b010110): begin
                temp = $signed(A) * $signed(B);
                temp2 = {inputHI, inputLO};
                {outputHI, outputLO} = temp + temp2;
            end 
            //Branch
            
            //beq
            (6'b010111):
                ALUResult <= ($signed(A) == $signed(B)) ? 32'd0 : 32'd1;
            //bgtz
            (6'b011000):
                ALUResult <= ($signed(A) > $signed(32'd0)) ? 32'd0 : 32'd1;
            //blez
            (6'b011001):
                ALUResult <= ($signed(A) <= $signed(32'd0)) ? 32'd0 : 32'd1;
            //bne
            (6'b011010):
                ALUResult <= ($signed(A) != $signed(B)) ? 32'd0 : 32'd1;
            //bgez
            (6'b011011):
                  ALUResult <= ($signed(A) >= $signed(32'd0)) ? 32'd0 : 32'd1;
            //bltz
            (6'b011100):
                ALUResult <= ($signed(A) < $signed(32'd0)) ? 32'd0 : 32'd1;
                
            //seh
            (6'b011110):
                ALUResult <= ({ {16{B[15]}} , B[15:0] });
            //seb
            (6'b011111):
                ALUResult <= ({ {24{B[7]}} , B[7:0] });
            //sllv
            (6'b100000):
                ALUResult <= B << A;
            //srlv
            (6'b100001):
                ALUResult <= B >> A;
            //srav
            (6'b100010): 
                ALUResult <= B >>> A;
            //multu
            (6'b100011):
                  {outputHI, outputLO} = A * B;
             //jr
            (6'b100100):
                ALUResult <= A;
            //jal and j
            (6'b100101):
                ALUResult <= {EX_PCAddResult[31:28], jalTarget, 2'b00};
            default:
                ALUResult <= 32'hFFFFFFFF;
        endcase
    end
    
    always @(ALUResult) begin
        if (ALUResult == 32'd0) begin
            Zero <= 32'd1;
        end
        else
            Zero <= 32'd0;
        end   
endmodule
