`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Quinton Arnaud 100%
// 
//////////////////////////////////////////////////////////////////////////////////

module TopModule(Clk, Reset, PCResult, s0, v0, v1, out7, en_out);

    input Clk, Reset;

    output wire [31:0] PCResult;
    output [6:0] out7;
    output [7:0] en_out;
    output wire [31:0] s0;
    output wire [15:0] v0, v1;
    
    wire [31:0] WB_WriteRegData, inputHI, inputLO;
    //////////////////////////////////////////////////// wires inside the IF Stage
    wire [31:0] Instruction_in, ID_Instruction, PC_out; 
    
    wire [31:0] PCAddResult, PCMuxout;
    
    wire IF_PcStall, IF_ID_RegStall;
    
    //////////////////////////////////////////////////// wires inside the ID stage
    wire ID_MemoryToReg, ID_PCSrc, ID_PCSrc_b, ID_RegWrite, ID_PCEight; // Write Back controls 
    wire ID_MemRead, ID_MemWrite;  // Memory controls
    wire [4:0] ID_shftAmt;
    wire ID_aluSrc2, ID_RegDst, ID_writeRA, ID_AluSrc1; //Ex contoles
    wire [5:0] ID_AluControl; //Alu control signal
    wire [31:0] ReadData1In, ReadData2In, ID_PCAddResult, ID_MuxtoReg, ID_SEtoMux, ID_ZEtoMux; //32 bit data lines
    wire [4:0] RTInstructionIn, RDInstructionIn;                   //5 bit data lines
    wire Unsign;
    wire [1:0] ID_DataOpp;
    
    wire ID_ControlStall;
    
    wire stall;
    
    //wires between Contorler and MUX
    wire [5:0] ALUControl_c; 
    wire [4:0] shftAmt_c;
    wire RegDst_c, RegWrite_c, AluSrc2_c, MemRead_c, MemWrite_c, MemtoReg_c, PCSrc_c, Unsign_c, PCSrc_b_c, PCEight_c, writeRA_c, AluSrc1_c;
    wire [1:0] DataOp_c;




    //////////////////////////////////////////////////// wires inside the EX stage
    wire EX_MemoryToReg, EX_PCSrc, EX_PCSrc_b, EX_RegWrite, EX_PCEight; // Write Back controls 
    wire EX_MemRead, EX_MemWrite;  // Memory controls
    wire EX_aluSrc2, EX_RegDst, EX_writeRA, EX_AluSrc1; //Ex contoles
    wire [4:0] EX_WriteRegister, EX_WriteRegistertoMUX; 
    wire [5:0] EX_AluControlOut; 
    wire [1:0] RSMuxControl, RTMuxControl; 
    wire WriteDataMuxControl;

    wire [31:0] ReadData1Out, ReadData2Out, EX_PCAddResult, ImmediateOut, EX_ShiftAddResult, EX_RSMuxOut, EX_RTMuxOut, AluSrc2MuxOut, EX_WriteData, AluSrc1MuxOut; //32 bit data lines
    wire [4:0] RTInstructionOut, RDInstructionOut;                   //5 bit data lines

    wire [31:0] ALUResultIn; //32 bit data lines
    
    wire [1:0] EX_DataOpp;
    
    wire [25:0] EX_jalTarget;


    wire [4:0] EX_shftAmt;  //this comes from 10:6 bits of intsruction, shifter for rotr and rotrv, will wire from controller
   // wire [31:0] inputHI, inputLO;
    
    wire[31:0] ALUResult, outputHI, outputLO;    
    wire EX_Zero;

    //////////////////////////////////////////////////// wires inside the MEM stage


    wire MEM_MemoryToReg, MEM_PCSrc, MEM_PCSrc_b, MEM_toAND_PCSrc, MEM_RegWrite, MEM_PCEight, MEM_WriteDataMuxControl;
    wire [31:0] MEM_DataMemoryResult;

    wire MEM_MemRead, MEM_MemWrite, MEM_Zero;  
    wire [31:0] MEM_ALUResult, MEM_WriteData, MEM_ShiftAddResult, MEM_PCAddResult, MEM_RegToMuxWriteData; //32 bit data lines
    
    wire [4:0] MEM_WriteRegister;
    
    wire [1:0] MEM_DataOpp;


    //////////////////////////////////////////////////// wires inside the WB stage
    wire WB_MemoryToReg, WB_PCSrc, WB_RegWrite, WB_PCEight;
    wire [31:0] WB_AluResult, WB_DataMemoryResultOut, WB_PCAddResult, WB_PCAddEight, WB_WriteRegDatatoMux;
    wire [4:0] WB_WriteRegister;
    
    wire flush;

    IF_ID_Reg IF_ID_Reg1(Clk, flush, IF_ID_RegStall, Instruction_in, PCAddResult , ID_Instruction, ID_PCAddResult);

    ID_EX_Reg ID_EX_Reg1(Clk, flush, ID_MemoryToReg, ID_PCSrc, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_shftAmt, ID_aluSrc2, ID_RegDst, 
    ID_AluControl, ReadData1In, ReadData2In, ID_PCAddResult, ID_MuxtoReg, ID_Instruction[20:16], ID_Instruction[15:11], EX_MemoryToReg, 
    EX_PCSrc, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_shftAmt, EX_aluSrc2, EX_RegDst, EX_AluControlOut, ReadData1Out, ReadData2Out, 
    EX_PCAddResult, ImmediateOut, RTInstructionOut, RDInstructionOut, ID_DataOpp, EX_DataOpp, ID_PCSrc_b, EX_PCSrc_b, ID_PCEight, EX_PCEight, 
    ID_writeRA, EX_writeRA, ID_Instruction[25:0], EX_jalTarget, ID_AluSrc1, EX_AluSrc1);

    EX_MEM_Reg EX_MEM_Reg1(Clk, EX_MemoryToReg, EX_RegWrite, EX_PCSrc, EX_MemRead, EX_MemWrite, MEM_MemoryToReg, MEM_RegWrite, MEM_toAND_PCSrc, MEM_MemRead, MEM_MemWrite,
                  ALUResultIn, MEM_ALUResult, EX_WriteData, EX_ShiftAddResult, MEM_RegToMuxWriteData, MEM_ShiftAddResult, EX_WriteRegister, MEM_WriteRegister, EX_DataOpp, MEM_DataOpp, EX_Zero, MEM_Zero,
                  EX_PCSrc_b, MEM_PCSrc_b, EX_PCAddResult, MEM_PCAddResult, EX_PCEight, MEM_PCEight, flush);

    MEM_WB_Reg MEM_WB_Reg1(Clk, MEM_MemoryToReg, MEM_RegWrite, WB_MemoryToReg, WB_RegWrite, MEM_ALUResult, WB_AluResult, MEM_DataMemoryResult, WB_DataMemoryResultOut,
                            MEM_WriteRegister, WB_WriteRegister, MEM_PCAddResult, WB_PCAddResult, MEM_PCEight, WB_PCEight);

    ANDgate ANDgate1(MEM_Zero, MEM_toAND_PCSrc, MEM_PCSrc);
    Mux32Bit4to1twoSEL PC_Src_Mux(PCAddResult, MEM_ShiftAddResult, MEM_ALUResult, 0, PCMuxout, MEM_PCSrc, MEM_PCSrc_b);
    InstructionMemory InstructionMemory1(PCResult, Instruction_in);
    ProgramCounter ProgramCounter1(IF_PcStall, PCMuxout, PCResult, Reset, Clk);
    PCAdder PCAdder1(PCResult, PCAddResult, Reset);


    RegisterFile RegisterFile1(ID_Instruction[25:21], ID_Instruction[20:16], WB_WriteRegister, WB_WriteRegData, WB_RegWrite, Clk, ReadData1In, ReadData2In, v0, v1, s0);

    Controller Controller1(ID_Instruction, ALUControl_c, shftAmt_c, RegDst_c, RegWrite_c, AluSrc2_c, MemRead_c, MemWrite_c, MemtoReg_c, 
    PCSrc_c, Unsign, DataOp_c, PCSrc_b_c, PCEight_c, writeRA_c, AluSrc1_c);
    
    ControlMux controlMux(ID_ControlStall, ALUControl_c, shftAmt_c, RegDst_c, RegWrite_c, AluSrc2_c, MemRead_c, MemWrite_c, MemtoReg_c, PCSrc_c,
    Unsign_c, PCSrc_b_c, PCEight_c, writeRA_c, DataOp_c, ID_AluControl, ID_shftAmt, ID_RegDst, ID_RegWrite, ID_aluSrc2, ID_MemRead, ID_MemWrite, ID_MemoryToReg, 
    ID_PCSrc, Unsign, ID_PCSrc_b, ID_PCEight, ID_writeRA, ID_DataOpp);


    SignExtension SignExtension1(ID_Instruction[15:0], ID_SEtoMux);
    ZeroExtension ZeroExtension1(ID_Instruction[15:0], ID_ZEtoMux);
    Mux32Bit2To1 IDMuxtoReg(ID_MuxtoReg, ID_SEtoMux, ID_ZEtoMux, Unsign);

    ALU32Bit ALU32Bit1(EX_AluControlOut, EX_RSMuxOut, EX_RTMuxOut, ALUResultIn, EX_Zero, inputHI, inputLO, outputHI, outputLO, EX_shftAmt, EX_jalTarget, EX_PCAddResult);
    hiloReg loReg(outputLO, inputLO, Clk);
    hiloReg hiReg(outputHI, inputHI, Clk);
    shiftAdder shiftAdder1(EX_ShiftAddResult, EX_PCAddResult, ImmediateOut);
    Mux32Bit2To1 ALUSrc2_Mux(AluSrc2MuxOut, ReadData2Out, ImmediateOut, EX_aluSrc2);
    Mux5Bit2To1 RegDst_Mux(EX_WriteRegistertoMUX, RTInstructionOut, RDInstructionOut, EX_RegDst);
    Mux5Bit2To1 writeRA_Mux(EX_WriteRegister, EX_WriteRegistertoMUX, 5'd31, EX_writeRA);

    DataMemory DataMemory1(MEM_ALUResult, MEM_WriteData, Clk, MEM_MemWrite, MEM_MemRead, MEM_DataMemoryResult, MEM_DataOpp); 
    PCAdder PCPlusEight(WB_PCAddResult, WB_PCAddEight);
    Mux32Bit2To1 MEMtoMux(WB_WriteRegDatatoMux, WB_DataMemoryResultOut, WB_AluResult, WB_MemoryToReg);
    Mux32Bit2To1 MuxtoReg(WB_WriteRegData, WB_WriteRegDatatoMux, WB_PCAddEight, WB_PCEight);
    
    //forwarding unit additions EX_jalTarget[25:21] is rs register address
    ForwardingUnit forward(EX_jalTarget[25:21], RTInstructionOut, MEM_WriteRegister, WB_WriteRegister, RSMuxControl, RTMuxControl, MEM_RegWrite, WB_RegWrite, WriteDataMuxControl, EX_MemWrite, EX_aluSrc2, MEM_WriteDataMuxControl);
    Mux32Bit4to1oneSEL RSMux(ReadData1Out, WB_WriteRegData, MEM_ALUResult, 0, EX_RSMuxOut, RSMuxControl);
    Mux32Bit4to1oneSEL RTMux(AluSrc2MuxOut, WB_WriteRegData, MEM_ALUResult, 0, EX_RTMuxOut, RTMuxControl);
    
    Mux32Bit2To1 EX_WriteDataOutMux(EX_WriteData, ReadData2Out, WB_WriteRegData, WriteDataMuxControl);
    Mux32Bit2To1 MEM_WriteDataOutMux(MEM_WriteData, MEM_RegToMuxWriteData, WB_WriteRegData, MEM_WriteDataMuxControl);
    
    HazardDetectionUnit HDU(EX_MemRead, EX_MemWrite, MEM_PCSrc, MEM_PCSrc_b, RTInstructionOut, ID_Instruction[25:21], ID_Instruction[20:16], IF_PcStall, IF_ID_RegStall, ID_ControlStall, flush, MemWrite_c);
    //HazardDetectionUnit   EX_MemRead, EX_MemWrite, MEM_PCSrc, MEM_PCSrc_b, EX_RT,           FD_RS,                 FD_RT,                 Stall_Pc,   Stall_ID_EX_Reg, Stall_Controler, flush);
    
    Two4DigitDisplay dd(Clk, v0, v1, out7, en_out);
endmodule
