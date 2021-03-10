`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 3 (memory[i] = i * 3;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    reg [31:0] memory [0:395];
    
    initial begin
   memory[0] <= 32'h34040000;	//	main:		ori	$a0, $zero, 0
    memory[1] <= 32'h34050010;    //            ori    $a1, $zero, 16
    memory[2] <= 32'h34060410;    //            ori    $a2, $zero, 1040
    memory[3] <= 32'h08000004;    //            j    vbsme
    memory[4] <= 32'h00001020;    //    vbsme:        add    $v0, $zero, $zero
    memory[5] <= 32'h00001820;    //            add    $v1, $zero, $zero
    memory[6] <= 32'h20100100;    //            addi    $s0, $zero, 256
    memory[7] <= 32'h00008820;    //            add    $s1, $zero, $zero
    memory[8] <= 32'h00009020;    //            add    $s2, $zero, $zero
    memory[9] <= 32'h8c88000c;    //    whileMAIN:    lw    $t0, 12($a0)
    memory[10] <= 32'h8c890004;    //            lw    $t1, 4($a0)
    memory[11] <= 32'h02285020;    //            add    $t2, $s1, $t0
    memory[12] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[13] <= 32'h15000005;    //            bne    $t0, $zero, whileMainTRUE
    memory[14] <= 32'h8c880008;    //            lw    $t0, 8($a0)
    memory[15] <= 32'h8c890000;    //            lw    $t1, 0($a0)
    memory[16] <= 32'h02485020;    //            add    $t2, $s2, $t0
    memory[17] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[18] <= 32'h11000068;    //            beq    $t0, $zero, whileMainFALSE
    memory[19] <= 32'h0c000054;    //    whileMainTRUE:    jal    sadCalc
    memory[20] <= 32'h8c88000c;    //            lw    $t0, 12($a0)
    memory[21] <= 32'h8c890004;    //            lw    $t1, 4($a0)
    memory[22] <= 32'h02285020;    //            add    $t2, $s1, $t0
    memory[23] <= 32'h11490003;    //            beq    $t2, $t1, incrementY
    memory[24] <= 32'h16400002;    //            bne    $s2, $zero, incrementY
    memory[25] <= 32'h22310001;    //            addi    $s1, $s1, 1
    memory[26] <= 32'h0800001c;    //            j    whileZig
    memory[27] <= 32'h22520001;    //    incrementY:    addi    $s2, $s2, 1
    memory[28] <= 32'h8c88000c;    //    whileZig:    lw    $t0, 12($a0)
    memory[29] <= 32'h8c890004;    //            lw    $t1, 4($a0)
    memory[30] <= 32'h02285020;    //            add    $t2, $s1, $t0
    memory[31] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[32] <= 32'h15000005;    //            bne    $t0, $zero, cont1
    memory[33] <= 32'h8c880008;    //            lw    $t0, 8($a0)
    memory[34] <= 32'h8c890000;    //            lw    $t1, 0($a0)
    memory[35] <= 32'h02485020;    //            add    $t2, $s2, $t0
    memory[36] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[37] <= 32'h11000055;    //            beq    $t0, $zero, whileMainFALSE
    memory[38] <= 32'h8c880008;    //    cont1:        lw    $t0, 8($a0)
    memory[39] <= 32'h8c890000;    //            lw    $t1, 0($a0)
    memory[40] <= 32'h02485020;    //            add    $t2, $s2, $t0
    memory[41] <= 32'h11490005;    //            beq    $t2, $t1, whileZigFalse
    memory[42] <= 32'h12200004;    //            beq    $s1, $zero, whileZigFalse
    memory[43] <= 32'h0c000054;    //            jal    sadCalc
    memory[44] <= 32'h22520001;    //            addi    $s2, $s2, 1
    memory[45] <= 32'h2231ffff;    //            addi    $s1, $s1, -1
    memory[46] <= 32'h0800001c;    //            j    whileZig
    memory[47] <= 32'h8c88000c;    //    whileZigFalse:    lw    $t0, 12($a0)
    memory[48] <= 32'h8c890004;    //            lw    $t1, 4($a0)
    memory[49] <= 32'h02285020;    //            add    $t2, $s1, $t0
    memory[50] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[51] <= 32'h15000005;    //            bne    $t0, $zero, cont2
    memory[52] <= 32'h8c880008;    //            lw    $t0, 8($a0)
    memory[53] <= 32'h8c890000;    //            lw    $t1, 0($a0)
    memory[54] <= 32'h02485020;    //            add    $t2, $s2, $t0
    memory[55] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[56] <= 32'h11000042;    //            beq    $t0, $zero, whileMainFALSE
    memory[57] <= 32'h0c000054;    //    cont2:        jal    sadCalc
    memory[58] <= 32'h8c880008;    //            lw    $t0, 8($a0)
    memory[59] <= 32'h8c890000;    //            lw    $t1, 0($a0)
    memory[60] <= 32'h02485020;    //            add    $t2, $s2, $t0
    memory[61] <= 32'h11490002;    //            beq    $t2, $t1, incrementX
    memory[62] <= 32'h22520001;    //            addi    $s2, $s2, 1
    memory[63] <= 32'h08000041;    //            j    whileZag
    memory[64] <= 32'h22310001;    //    incrementX:    addi    $s1, $s1, 1
    memory[65] <= 32'h8c88000c;    //    whileZag:    lw    $t0, 12($a0)
    memory[66] <= 32'h8c890004;    //            lw    $t1, 4($a0)
    memory[67] <= 32'h02285020;    //            add    $t2, $s1, $t0
    memory[68] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[69] <= 32'h15000005;    //            bne    $t0, $zero, cont3
    memory[70] <= 32'h8c880008;    //            lw    $t0, 8($a0)
    memory[71] <= 32'h8c890000;    //            lw    $t1, 0($a0)
    memory[72] <= 32'h02485020;    //            add    $t2, $s2, $t0
    memory[73] <= 32'h0149402a;    //            slt    $t0, $t2, $t1
    memory[74] <= 32'h11000030;    //            beq    $t0, $zero, whileMainFALSE
    memory[75] <= 32'h8c88000c;    //    cont3:        lw    $t0, 12($a0)
    memory[76] <= 32'h8c890004;    //            lw    $t1, 4($a0)
    memory[77] <= 32'h02285020;    //            add    $t2, $s1, $t0
    memory[78] <= 32'h1149ffba;    //            beq    $t2, $t1, whileMAIN
    memory[79] <= 32'h1240ffb9;    //            beq    $s2, $zero, whileMAIN
    memory[80] <= 32'h0c000054;    //            jal    sadCalc
    memory[81] <= 32'h2252ffff;    //            addi    $s2, $s2, -1
    memory[82] <= 32'h22310001;    //            addi    $s1, $s1, 1
    memory[83] <= 32'h08000041;    //            j    whileZag
    memory[84] <= 32'h00004020;    //    sadCalc:    add    $t0, $zero, $zero
    memory[85] <= 32'h00006020;    //            add    $t4, $zero, $zero
    memory[86] <= 32'h00006820;    //            add    $t5, $zero, $zero
    memory[87] <= 32'h00005020;    //    sadLoop1:    add    $t2, $zero, $zero
    memory[88] <= 32'h8c8b000c;    //    sadLoop2:    lw    $t3, 12($a0)
    memory[89] <= 32'h01407020;    //            add    $t6, $t2, $zero
    memory[90] <= 32'h71cb7002;    //            mul    $t6, $t6, $t3
    memory[91] <= 32'h000e7080;    //            sll    $t6, $t6, 2
    memory[92] <= 32'h01007820;    //            add    $t7, $t0, $zero
    memory[93] <= 32'h000f7880;    //            sll    $t7, $t7, 2
    memory[94] <= 32'h01cf7020;    //            add    $t6, $t6, $t7
    memory[95] <= 32'h00ce7020;    //            add    $t6, $a2, $t6
    memory[96] <= 32'h8dc90000;    //            lw    $t1, 0($t6)
    memory[97] <= 32'h8c8b0004;    //            lw    $t3, 4($a0)
    memory[98] <= 32'h01527020;    //            add    $t6, $t2, $s2
    memory[99] <= 32'h71cb7002;    //            mul    $t6, $t6, $t3
    memory[100] <= 32'h000e7080;    //            sll    $t6, $t6, 2
    memory[101] <= 32'h01117820;    //            add    $t7, $t0, $s1
    memory[102] <= 32'h000f7880;    //            sll    $t7, $t7, 2
    memory[103] <= 32'h01cf7020;    //            add    $t6, $t6, $t7
    memory[104] <= 32'h00ae7020;    //            add    $t6, $a1, $t6
    memory[105] <= 32'h8dcf0000;    //            lw    $t7, 0($t6)
    memory[106] <= 32'h012f6822;    //            sub    $t5, $t1, $t7
    memory[107] <= 32'h01a0782a;    //            slt    $t7, $t5, $zero
    memory[108] <= 32'h11e00001;    //            beq    $t7, $zero, skipABS
    memory[109] <= 32'h000d6822;    //            sub    $t5, $zero, $t5
    memory[110] <= 32'h8c890008;    //    skipABS:    lw    $t1, 8($a0)
    memory[111] <= 32'h8c8b000c;    //            lw    $t3, 12($a0)
    memory[112] <= 32'h018d6020;    //            add    $t4, $t4, $t5
    memory[113] <= 32'h214a0001;    //            addi    $t2, $t2, 1
    memory[114] <= 32'h1549ffe5;    //            bne    $t2, $t1, sadLoop2
    memory[115] <= 32'h21080001;    //            addi    $t0, $t0, 1
    memory[116] <= 32'h150bffe2;    //            bne    $t0, $t3, sadLoop1
    memory[117] <= 32'h020c782a;    //            slt    $t7, $s0, $t4
    memory[118] <= 32'h15e00003;    //            bne    $t7, $zero, sadExit
    memory[119] <= 32'h01808020;    //            add    $s0, $t4, $zero
    memory[120] <= 32'h02201020;    //            add    $v0, $s1, $zero
    memory[121] <= 32'h02401820;    //            add    $v1, $s2, $zero
    memory[122] <= 32'h03e00008;    //    sadExit:    jr    $ra
    memory[123] <= 32'h0c000054;    //    whileMainFALSE:    jal    sadCalc
    memory[124] <= 32'h0800007c;    //    done:        j    done
    
       //$readmemh ("D:\\Users\\qarnaud\\Classes\\ECE369a\\Project_Phase1_ForwardingAndHazard\\Instruction_memory.txt", memory);
//       memory[0] <= 32'b00100011101111011111111111111100;	//	main:		addi	$sp, $sp, -4
//       memory[1] <= 32'b10101111101111110000000000000000;    //            sw    $ra, 0($sp)
//       memory[2] <= 32'b00110100000001000000000000000000;    //            ori    $a0, $zero, 0
//       memory[3] <= 32'b00110100000001010000000000010000;    //            ori    $a1, $zero, 16
//       memory[4] <= 32'b00110100000001100000010000010000;    //            ori    $a2, $zero, 1040
//       memory[5] <= 32'b00001100000000000000000000001001;    //            jal    vbsme
//       memory[6] <= 32'b10001111101111110000000000000000;    //            lw    $ra, 0($sp)
//       memory[7] <= 32'b00100011101111010000000000000100;    //            addi    $sp, $sp, 4
//       memory[8] <= 32'b00000011111000000000000000001000;    //            jr    $ra
//       memory[9] <= 32'b00100011101111011111111111111100;    //    vbsme:        addi    $sp, $sp, -4
//       memory[10] <= 32'b10101111101111110000000000000000;    //            sw    $ra, 0($sp)
//       memory[11] <= 32'b00110100000000100000000000000000;    //            ori    $v0, $zero, 0
//       memory[12] <= 32'b00110100000000110000000000000000;    //            ori    $v1, $zero, 0
//       memory[13] <= 32'b00110100000100000000000100000000;    //            ori    $s0, $zero, 256
//       memory[14] <= 32'b00110100000100010000000000000000;    //            ori    $s1, $zero, 0
//       memory[15] <= 32'b00110100000100100000000000000000;    //            ori    $s2, $zero, 0
//       memory[16] <= 32'b10001100100010000000000000001100;    //    whileMAIN:    lw    $t0, 12($a0)
//       memory[17] <= 32'b10001100100010010000000000000100;    //            lw    $t1, 4($a0)
//       memory[18] <= 32'b00000010001010000101000000100000;    //            add    $t2, $s1, $t0
//       memory[19] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[20] <= 32'b00010101000000000000000000000101;    //            bne    $t0, $zero, whileMainTRUE
//       memory[21] <= 32'b10001100100010000000000000001000;    //            lw    $t0, 8($a0)
//       memory[22] <= 32'b10001100100010010000000000000000;    //            lw    $t1, 0($a0)
//       memory[23] <= 32'b00000010010010000101000000100000;    //            add    $t2, $s2, $t0
//       memory[24] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[25] <= 32'b00010001000000000000000001101000;    //            beq    $t0, $zero, whileMainFALSE
//       memory[26] <= 32'b00001100000000000000000001011011;    //    whileMainTRUE:    jal    sadCalc
//       memory[27] <= 32'b10001100100010000000000000001100;    //            lw    $t0, 12($a0)
//       memory[28] <= 32'b10001100100010010000000000000100;    //            lw    $t1, 4($a0)
//       memory[29] <= 32'b00000010001010000101000000100000;    //            add    $t2, $s1, $t0
//       memory[30] <= 32'b00010001010010010000000000000011;    //            beq    $t2, $t1, incrementY
//       memory[31] <= 32'b00010110010000000000000000000010;    //            bne    $s2, $zero, incrementY
//       memory[32] <= 32'b00100010001100010000000000000001;    //            addi    $s1, $s1, 1
//       memory[33] <= 32'b00001000000000000000000000100011;    //            j    whileZig
//       memory[34] <= 32'b00100010010100100000000000000001;    //    incrementY:    addi    $s2, $s2, 1
//       memory[35] <= 32'b10001100100010000000000000001100;    //    whileZig:    lw    $t0, 12($a0)
//       memory[36] <= 32'b10001100100010010000000000000100;    //            lw    $t1, 4($a0)
//       memory[37] <= 32'b00000010001010000101000000100000;    //            add    $t2, $s1, $t0
//       memory[38] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[39] <= 32'b00010101000000000000000000000101;    //            bne    $t0, $zero, cont1
//       memory[40] <= 32'b10001100100010000000000000001000;    //            lw    $t0, 8($a0)
//       memory[41] <= 32'b10001100100010010000000000000000;    //            lw    $t1, 0($a0)
//       memory[42] <= 32'b00000010010010000101000000100000;    //            add    $t2, $s2, $t0
//       memory[43] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[44] <= 32'b00010001000000000000000001010101;    //            beq    $t0, $zero, whileMainFALSE
//       memory[45] <= 32'b10001100100010000000000000001000;    //    cont1:        lw    $t0, 8($a0)
//       memory[46] <= 32'b10001100100010010000000000000000;    //            lw    $t1, 0($a0)
//       memory[47] <= 32'b00000010010010000101000000100000;    //            add    $t2, $s2, $t0
//       memory[48] <= 32'b00010001010010010000000000000101;    //            beq    $t2, $t1, whileZigFalse
//       memory[49] <= 32'b00010010001000000000000000000100;    //            beq    $s1, $zero, whileZigFalse
//       memory[50] <= 32'b00001100000000000000000001011011;    //            jal    sadCalc
//       memory[51] <= 32'b00100010010100100000000000000001;    //            addi    $s2, $s2, 1
//       memory[52] <= 32'b00100010001100011111111111111111;    //            addi    $s1, $s1, -1
//       memory[53] <= 32'b00001000000000000000000000100011;    //            j    whileZig
//       memory[54] <= 32'b10001100100010000000000000001100;    //    whileZigFalse:    lw    $t0, 12($a0)
//       memory[55] <= 32'b10001100100010010000000000000100;    //            lw    $t1, 4($a0)
//       memory[56] <= 32'b00000010001010000101000000100000;    //            add    $t2, $s1, $t0
//       memory[57] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[58] <= 32'b00010101000000000000000000000101;    //            bne    $t0, $zero, cont2
//       memory[59] <= 32'b10001100100010000000000000001000;    //            lw    $t0, 8($a0)
//       memory[60] <= 32'b10001100100010010000000000000000;    //            lw    $t1, 0($a0)
//       memory[61] <= 32'b00000010010010000101000000100000;    //            add    $t2, $s2, $t0
//       memory[62] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[63] <= 32'b00010001000000000000000001000010;    //            beq    $t0, $zero, whileMainFALSE
//       memory[64] <= 32'b00001100000000000000000001011011;    //    cont2:        jal    sadCalc
//       memory[65] <= 32'b10001100100010000000000000001000;    //            lw    $t0, 8($a0)
//       memory[66] <= 32'b10001100100010010000000000000000;    //            lw    $t1, 0($a0)
//       memory[67] <= 32'b00000010010010000101000000100000;    //            add    $t2, $s2, $t0
//       memory[68] <= 32'b00010001010010010000000000000010;    //            beq    $t2, $t1, incrementX
//       memory[69] <= 32'b00100010010100100000000000000001;    //            addi    $s2, $s2, 1
//       memory[70] <= 32'b00001000000000000000000001001000;    //            j    whileZag
//       memory[71] <= 32'b00100010001100010000000000000001;    //    incrementX:    addi    $s1, $s1, 1
//       memory[72] <= 32'b10001100100010000000000000001100;    //    whileZag:    lw    $t0, 12($a0)
//       memory[73] <= 32'b10001100100010010000000000000100;    //            lw    $t1, 4($a0)
//       memory[74] <= 32'b00000010001010000101000000100000;    //            add    $t2, $s1, $t0
//       memory[75] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[76] <= 32'b00010101000000000000000000000101;    //            bne    $t0, $zero, cont3
//       memory[77] <= 32'b10001100100010000000000000001000;    //            lw    $t0, 8($a0)
//       memory[78] <= 32'b10001100100010010000000000000000;    //            lw    $t1, 0($a0)
//       memory[79] <= 32'b00000010010010000101000000100000;    //            add    $t2, $s2, $t0
//       memory[80] <= 32'b00000001010010010100000000101010;    //            slt    $t0, $t2, $t1
//       memory[81] <= 32'b00010001000000000000000000110000;    //            beq    $t0, $zero, whileMainFALSE
//       memory[82] <= 32'b10001100100010000000000000001100;    //    cont3:        lw    $t0, 12($a0)
//       memory[83] <= 32'b10001100100010010000000000000100;    //            lw    $t1, 4($a0)
//       memory[84] <= 32'b00000010001010000101000000100000;    //            add    $t2, $s1, $t0
//       memory[85] <= 32'b00010001010010011111111110111010;    //            beq    $t2, $t1, whileMAIN
//       memory[86] <= 32'b00010010010000001111111110111001;    //            beq    $s2, $zero, whileMAIN
//       memory[87] <= 32'b00001100000000000000000001011011;    //            jal    sadCalc
//       memory[88] <= 32'b00100010010100101111111111111111;    //            addi    $s2, $s2, -1
//       memory[89] <= 32'b00100010001100010000000000000001;    //            addi    $s1, $s1, 1
//       memory[90] <= 32'b00001000000000000000000001001000;    //            j    whileZag
//       memory[91] <= 32'b00110100000010000000000000000000;    //    sadCalc:    ori    $t0, $zero, 0
//       memory[92] <= 32'b00110100000011000000000000000000;    //            ori    $t4, $zero, 0
//       memory[93] <= 32'b00110100000011010000000000000000;    //            ori    $t5, $zero, 0
//       memory[94] <= 32'b00110100000010100000000000000000;    //    sadLoop1:    ori    $t2, $zero, 0
//       memory[95] <= 32'b10001100100010110000000000001100;    //    sadLoop2:    lw    $t3, 12($a0)
//       memory[96] <= 32'b00000001010000000111000000100000;    //            add    $t6, $t2, $zero
//       memory[97] <= 32'b01110001110010110111000000000010;    //            mul    $t6, $t6, $t3
//       memory[98] <= 32'b00000000000011100111000010000000;    //            sll    $t6, $t6, 2
//       memory[99] <= 32'b00000001000000000111100000100000;    //            add    $t7, $t0, $zero
//       memory[100] <= 32'b00000000000011110111100010000000;    //            sll    $t7, $t7, 2
//       memory[101] <= 32'b00000001110011110111000000100000;    //            add    $t6, $t6, $t7
//       memory[102] <= 32'b00000000110011100111000000100000;    //            add    $t6, $a2, $t6
//       memory[103] <= 32'b10001101110010010000000000000000;    //            lw    $t1, 0($t6)
//       memory[104] <= 32'b10001100100010110000000000000100;    //            lw    $t3, 4($a0)
//       memory[105] <= 32'b00000001010100100111000000100000;    //            add    $t6, $t2, $s2
//       memory[106] <= 32'b01110001110010110111000000000010;    //            mul    $t6, $t6, $t3
//       memory[107] <= 32'b00000000000011100111000010000000;    //            sll    $t6, $t6, 2
//       memory[108] <= 32'b00000001000100010111100000100000;    //            add    $t7, $t0, $s1
//       memory[109] <= 32'b00000000000011110111100010000000;    //            sll    $t7, $t7, 2
//       memory[110] <= 32'b00000001110011110111000000100000;    //            add    $t6, $t6, $t7
//       memory[111] <= 32'b00000000101011100111000000100000;    //            add    $t6, $a1, $t6
//       memory[112] <= 32'b10001101110011110000000000000000;    //            lw    $t7, 0($t6)
//       memory[113] <= 32'b00000001001011110110100000100010;    //            sub    $t5, $t1, $t7
//       memory[114] <= 32'b00000001101000000111100000101010;    //            slt    $t7, $t5, $zero
//       memory[115] <= 32'b00010001111000000000000000000001;    //            beq    $t7, $zero, skipABS
//       memory[116] <= 32'b00000000000011010110100000100010;    //            sub    $t5, $zero, $t5
//       memory[117] <= 32'b10001100100010010000000000001000;    //    skipABS:    lw    $t1, 8($a0)
//       memory[118] <= 32'b10001100100010110000000000001100;    //            lw    $t3, 12($a0)
//       memory[119] <= 32'b00000001100011010110000000100000;    //            add    $t4, $t4, $t5
//       memory[120] <= 32'b00100001010010100000000000000001;    //            addi    $t2, $t2, 1
//       memory[121] <= 32'b00010101010010011111111111100101;    //            bne    $t2, $t1, sadLoop2
//       memory[122] <= 32'b00100001000010000000000000000001;    //            addi    $t0, $t0, 1
//       memory[123] <= 32'b00010101000010111111111111100010;    //            bne    $t0, $t3, sadLoop1
//       memory[124] <= 32'b00000010000011000111100000101010;    //            slt    $t7, $s0, $t4
//       memory[125] <= 32'b00010101111000000000000000000011;    //            bne    $t7, $zero, sadExit
//       memory[126] <= 32'b00000001100000001000000000100000;    //            add    $s0, $t4, $zero
//       memory[127] <= 32'b00000010001000000001000000100000;    //            add    $v0, $s1, $zero
//       memory[128] <= 32'b00000010010000000001100000100000;    //            add    $v1, $s2, $zero
//       memory[129] <= 32'b00000011111000000000000000001000;    //    sadExit:    jr    $ra
//       memory[130] <= 32'b00001100000000000000000001011011;    //    whileMainFALSE:    jal    sadCalc
//       memory[131] <= 32'b10001111101111110000000000000000;    //            lw    $ra, 0($sp)
//       memory[132] <= 32'b00100011101111010000000000000100;    //            addi    $sp, $sp, 4
//       memory[133] <= 32'b00000011111000000000000000001000;    //            jr    $ra
//    memory[0] <= 32'b00110100000001000000000000000000;	//	main:		ori	$a0, $zero, 0
//    memory[1] <= 32'b00001000000000000000000000000100;	//			j	start
//    memory[2] <= 32'b00100000000001000000000000001010;	//			addi	$a0, $zero, 10
//    memory[3] <= 32'b00100000000001000000000000001010;	//			addi	$a0, $zero, 10
//    memory[4] <= 32'b10001100100100000000000000000100;	//	start:		lw	$s0, 4($a0)
//    memory[5] <= 32'b10001100100100000000000000001000;	//			lw	$s0, 8($a0)
//    memory[6] <= 32'b10101100100100000000000000000000;	//			sw	$s0, 0($a0)
//    memory[7] <= 32'b10101100100100000000000000001100;	//			sw	$s0, 12($a0)
//    memory[8] <= 32'b10001100100100010000000000000000;	//			lw	$s1, 0($a0)
//    memory[9] <= 32'b10001100100100100000000000001100;	//			lw	$s2, 12($a0)
//    memory[10] <= 32'b00010010000000000000000000000011;	//			beq	$s0, $zero, branch1
//    memory[11] <= 32'b00000010000000001000100000100000;	//			add	$s1, $s0, $zero
//    memory[12] <= 32'b00010010000100010000000000000001;	//			beq	$s0, $s1, branch1
//    memory[13] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[14] <= 32'b00100000000100001111111111111111;	//	branch1:	addi	$s0, $zero, -1
//    memory[15] <= 32'b00000110000000011111111111110100;	//			bgez	$s0, start
//    memory[16] <= 32'b00100010000100000000000000000001;	//			addi	$s0, $s0, 1
//    memory[17] <= 32'b00000110000000010000000000000001;	//			bgez	$s0, branch2
//    memory[18] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[19] <= 32'b00100000000100001111111111111111;	//	branch2:	addi	$s0, $zero, -1
//    memory[20] <= 32'b00011110000000000000000000000011;	//			bgtz	$s0, branch3
//    memory[21] <= 32'b00100000000100000000000000000001;	//			addi	$s0, $zero, 1
//    memory[22] <= 32'b00011110000000000000000000000001;	//			bgtz	$s0, branch3
//    memory[23] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[24] <= 32'b00000110000000000000000000000011;	//	branch3:	bltz	$s0, branch4
//    memory[25] <= 32'b00100000000100001111111111111111;	//			addi	$s0, $zero, -1
//    memory[26] <= 32'b00000110000000000000000000000001;	//			bltz	$s0, branch4
//    memory[27] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[28] <= 32'b00100000000100011111111111111111;	//	branch4:	addi	$s1, $zero, -1
//    memory[29] <= 32'b00010110000100010000000000000010;	//			bne	$s0, $s1, branch5
//    memory[30] <= 32'b00010110000000000000000000000001;	//			bne	$s0, $zero, branch5
//    memory[31] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[32] <= 32'b00100000000100000000000010000000;	//	branch5:	addi	$s0, $zero, 128
//    memory[33] <= 32'b10100000100100000000000000000000;	//			sb	$s0, 0($a0)
//    memory[34] <= 32'b10000000100100000000000000000000;	//			lb	$s0, 0($a0)
//    memory[35] <= 32'b00011010000000000000000000000001;	//			blez	$s0, branch6
//    memory[36] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[37] <= 32'b00100000000100001111111111111111;	//	branch6:	addi	$s0, $zero, -1
//    memory[38] <= 32'b10100100100100000000000000000000;	//			sh	$s0, 0($a0)
//    memory[39] <= 32'b00100000000100000000000000000000;	//			addi	$s0, $zero, 0
//    memory[40] <= 32'b10000100100100000000000000000000;	//			lh	$s0, 0($a0)
//    memory[41] <= 32'b00011010000000000000000000000001;	//			blez	$s0, branch7
//    memory[42] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[43] <= 32'b00100000000100001111111111111111;	//	branch7:	addi	$s0, $zero, -1
//    memory[44] <= 32'b00111100000100000000000000000001;	//			lui	$s0, 1
//    memory[45] <= 32'b00000110000000010000000000000001;	//			bgez	$s0, branch8
//    memory[46] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[47] <= 32'b00001000000000000000000000110001;	//	branch8:	j	jump1
//    memory[48] <= 32'b00100010000100001111111111111110;	//			addi	$s0, $s0, -2
//    memory[49] <= 32'b00001100000000000000000000110011;	//	jump1:		jal	jal1
//    memory[50] <= 32'b00001000000000000000000000000100;	//			j	start
//    memory[51] <= 32'b00000011111000000000000000001000;	//	jal1:		jr	$ra
//    memory[52] <= 32'b00001000000000000000000000110101;	//			j	error
//    memory[53] <= 32'b00000000000000000000000000001000;	//	error:		jr	$zero
//    memory[54] <= 32'b00110100000000100000000000001010;	//			ori	$v0, $zero, 10
//    memory[55] <= 32'b00000000000000000000000000000000;	//			nop

   end
   
   always @(Address) begin
        Instruction <= memory[Address[10:2]];
   end

endmodule
