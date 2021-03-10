`timescale 1ns / 1ps

    module Controller(Instruction, ALUControl, shftAmt, RegDst, RegWrite, AluSrc2, MemRead, MemWrite, MemtoReg, PCSrc, Unsign, DataOp, PCSrc_b, 
    PCEight, writeRA, AluSrc1);

	input [31:0] Instruction;

	output reg [5:0] ALUControl; 
	output reg [4:0] shftAmt;
	output reg RegDst, RegWrite, AluSrc2, MemRead, MemWrite, MemtoReg, PCSrc, Unsign, PCSrc_b, PCEight, writeRA, AluSrc1;
    output reg [1:0] DataOp;
    
	always @(Instruction) begin

		case(Instruction[31:26]) //Special commands
                    
			(6'b000000): begin //Opcode commands with 000000 Special

				case(Instruction[5:0]) 

					//Arithmetic

					//add
					(6'b100000): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000000;
						RegDst <= 1'b1;
						RegWrite <= 1'b1;
						AluSrc2 <= 1'b0;
						MemRead <= 1'b0;
						MemWrite <= 1'b0;
						MemtoReg <= 1'b1;
						PCSrc <= 1'b0;
						Unsign <= 1'b0;
						DataOp <= 2'b00;
						PCSrc_b <= 1'b0;
						PCEight <= 1'b0;
						writeRA <= 1'b0;
						AluSrc1 <= 1'b0;
					end
					//addu
					(6'b100001): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000000;
						RegDst <= 1'b1;
						RegWrite <= 1'b1;
						AluSrc2 <= 1'b0;
						MemRead <= 1'b0;
						MemWrite <= 1'b0;
						MemtoReg <= 1'b1;
						PCSrc <= 1'b0;
						Unsign <= 1'b1;
						DataOp <= 2'b00;
						PCSrc_b <= 1'b0;
						PCEight <= 1'b0;
						writeRA <= 1'b0;
						AluSrc1 <= 1'b0;
					end
					//sub
					(6'b100010): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000001;
						RegDst <= 1'b1;
						RegWrite <= 1'b1;
						AluSrc2 <= 1'b0;
						MemRead <= 1'b0;
						MemWrite <= 1'b0;
						MemtoReg <= 1'b1;
						PCSrc <= 1'b0;
						Unsign <= 1'b0;
						DataOp <= 2'b00;
						PCSrc_b <= 1'b0;
						PCEight <= 1'b0;
						writeRA <= 1'b0;
						AluSrc1 <= 1'b0;
					end
					//mult
					(6'b011000): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000011;
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
						AluSrc1 <= 1'b0;
					end
					//multu
					(6'b011001): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b100011;
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
						AluSrc1 <= 1'b0;
					end

					//Logical

					//and
					(6'b100100): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000100;
						RegDst <= 1'b1;
						RegWrite <= 1'b1;
						AluSrc2 <= 1'b0;
						MemRead <= 1'b0;
						MemWrite <= 1'b0;
						MemtoReg <= 1'b1;
						PCSrc <= 1'b0;
						Unsign <= 1'b0;
						DataOp <= 2'b00;
						PCSrc_b <= 1'b0;
						PCEight <= 1'b0;
						writeRA <= 1'b0;
						AluSrc1 <= 1'b0;
					end
					//or
					(6'b100101): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000110;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//nor
					(6'b100111): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000101;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//xor
					(6'b100110): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b001010;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//sll
					(6'b000000): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b000111;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//sllv
					(6'b000100): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b100000;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end

					//slt
					(6'b101010): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b001011;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//movn
					(6'b001011): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b001100;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//movz
					(6'b001010): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b001101;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//rotrv and srlv
					(6'b000110): begin
					   //rotrv
					   if (Instruction[6] == 1'b1) begin
						    shftAmt <= Instruction[10:6];

						    ALUControl <= 6'b001110;
						    RegDst <= 1'b1;
                            RegWrite <= 1'b1;
                            AluSrc2 <= 1'b0;
                            MemRead <= 1'b0;
                            MemWrite <= 1'b0;
                            MemtoReg <= 1'b1;
                            PCSrc <= 1'b0;
                            Unsign <= 1'b0;
                            DataOp <= 2'b00;
                            PCSrc_b <= 1'b0;
                            PCEight <= 1'b0;
                            writeRA <= 1'b0;
                            AluSrc1 <= 1'b0;
                        end
                        //srlv
                       else if (Instruction[6] == 1'b0) begin
                            shftAmt <= Instruction[10:6];
    
                            ALUControl <= 6'b100001;
                            RegDst <= 1'b1;
                            RegWrite <= 1'b1;
                            AluSrc2 <= 1'b0;
                            MemRead <= 1'b0;
                            MemWrite <= 1'b0;
                            MemtoReg <= 1'b1;
                            PCSrc <= 1'b0;
                            Unsign <= 1'b0;
                            DataOp <= 2'b00;
                            PCSrc_b <= 1'b0;
                            PCEight <= 1'b0;
                            writeRA <= 1'b0;
                            AluSrc1 <= 1'b0;
                        end
					end
					//rotr and srl
					(6'b000010): begin
					    //rotr
					    if (Instruction[21] == 1'b1) begin
					       shftAmt <= Instruction[10:6];

						   ALUControl <= 6'b001111;
						   RegDst <= 1'b1;
                           RegWrite <= 1'b1;
                           AluSrc2 <= 1'b0;
                           MemRead <= 1'b0;
                           MemWrite <= 1'b0;
                           MemtoReg <= 1'b1;
                           PCSrc <= 1'b0;
                           Unsign <= 1'b0;
                           DataOp <= 2'b00;
                           PCSrc_b <= 1'b0;
                           PCEight <= 1'b0;
                           writeRA <= 1'b0;
                           AluSrc1 <= 1'b0;
                        end
                        //srl
                        else if (Instruction[21] == 1'b0) begin
                            shftAmt <= Instruction[10:6];
                        
                            ALUControl <= 6'b001001;
                            RegDst <= 1'b1;
                            RegWrite <= 1'b1;
                            AluSrc2 <= 1'b0;
                            MemRead <= 1'b0;
                            MemWrite <= 1'b0;
                            MemtoReg <= 1'b1;
                            PCSrc <= 1'b0;
                            Unsign <= 1'b0;
                            DataOp <= 2'b00;
                            PCSrc_b <= 1'b0;
                            PCEight <= 1'b0;
                            writeRA <= 1'b0;
                            AluSrc1 <= 1'b0;
					    end
					end
					//sra
					(6'b000011): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b001000;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//srav
					(6'b000111): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b100010;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//sltu
					(6'b101011): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b001011;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b1;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end

					//hi/lo

					//mthi
					(6'b010001): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b010011;
						RegDst <= 1'b1;
                        RegWrite <= 1'b0;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//mtlo
					(6'b010011): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b010100;
						RegDst <= 1'b1;
                        RegWrite <= 1'b0;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//mfhi
					(6'b010000): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b010001;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end
					//mflo
					(6'b010010): begin
						shftAmt <= Instruction[10:6];

						ALUControl <= 6'b010010;
						RegDst <= 1'b1;
                        RegWrite <= 1'b1;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b1;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b0;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
					end	
					//jr                       //FIX rs -> PC
					(6'b001000): begin
				        shftAmt <= Instruction[10:6];

                        ALUControl <= 6'b100100;
                        RegDst <= 1'b0;
                        RegWrite <= 1'b0;
                        AluSrc2 <= 1'b0;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                        MemtoReg <= 1'b0;
                        PCSrc <= 1'b0;
                        Unsign <= 1'b0;
                        DataOp <= 2'b00;
                        PCSrc_b <= 1'b1;
                        PCEight <= 1'b0;
                        writeRA <= 1'b0;
                        AluSrc1 <= 1'b0;
                    end    	
					default: begin
				    shftAmt <= Instruction[10:6];

                    ALUControl <= 6'b111111;
                    RegDst <= 1'b0;
                    RegWrite <= 1'b0;
                    AluSrc2 <= 1'b0;
                    MemRead <= 1'b0;
                    MemWrite <= 1'b0;
                    MemtoReg <= 1'b0;
                    PCSrc <= 1'b0;
                    Unsign <= 1'b0;	
                    DataOp <= 2'b00;
                    PCEight <= 1'b0;	
                    writeRA <= 1'b0;		
                    AluSrc1 <= 1'b0;	
					end			
				endcase // Instruction[5:0]
			end

			//Arithemtic

			//addiu
			(6'b001001): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//addi
			(6'b001000): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//madd and msub
			(6'b011100): begin
				//madd
				if (Instruction[5:0] == 6'b000000) begin
					shftAmt <= Instruction[10:6];

					ALUControl <= 6'b010110;
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
                    AluSrc1 <= 1'b0;
				end
				//msub
				else if (Instruction[5:0] == 6'b000100) begin
					shftAmt <= Instruction[10:6];

					ALUControl <= 6'b010101;
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
                    AluSrc1 <= 1'b0;
				end
				//mul
				else if (Instruction[5:0] == 6'b000010) begin
				    shftAmt <= Instruction[10:6];

                    ALUControl <= 6'b000010;
                    RegDst <= 1'b1;
                    RegWrite <= 1'b1;
                    AluSrc2 <= 1'b0;
                    MemRead <= 1'b0;
                    MemWrite <= 1'b0;
                    MemtoReg <= 1'b1;
                    PCSrc <= 1'b0;
                    Unsign <= 1'b0;
                    DataOp <= 2'b00;
                    PCSrc_b <= 1'b0;
                    PCEight <= 1'b0;
                    writeRA <= 1'b0;
                    AluSrc1 <= 1'b0;
                end
            end
			
			//Data

			//lw 
			(6'b100011): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000; //add base + offset
				RegDst <= 1'b0; 
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b1;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//sw 
			(6'b101011): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000; //add base + offset
				RegDst <= 1'b0;
                RegWrite <= 1'b0;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b1;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//sb 
			(6'b101000): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000; //add base + offset
				RegDst <= 1'b0;
                RegWrite <= 1'b0;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b1;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b10;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//lh 
			(6'b100001): begin
				shftAmt <= Instruction[10:6];
				
				ALUControl <= 6'b000000; //add base + offset
                RegDst <= 1'b0; 
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b1;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b01;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//lb 
			(6'b100000): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000; //add base + offset
                RegDst <= 1'b0; 
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b1;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b10;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//sh 
			(6'b101001): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000000; //add base + offset
				RegDst <= 1'b0;
                RegWrite <= 1'b0;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b1;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b01;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end

			//lui [needs to be fixed]
			(6'b001111): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b010000;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end

			//Logical

			//andi
			(6'b001100): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000100;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b1;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0; 
                AluSrc1 <= 1'b0;
			end
			//ori
			(6'b001101): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b000110;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b1;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//xori
			(6'b001110): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b001010;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//slti
			(6'b001010): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b001011;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
			//sltiu
			(6'b001011): begin
				shftAmt <= Instruction[10:6];

				ALUControl <= 6'b001011;
				RegDst <= 1'b0;
                RegWrite <= 1'b1;
                AluSrc2 <= 1'b1;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b1;
                PCSrc <= 1'b0;
                Unsign <= 1'b1;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
			end
		    //seh and seb
            (6'b011111): begin
                shftAmt = Instruction[10:6];
                //seh
                if (shftAmt == 5'b11000) begin
                    ALUControl <= 6'b011110;
                    RegDst <= 1'b1;
                    RegWrite <= 1'b1;
                    AluSrc2 <= 1'b0;
                    MemRead <= 1'b0;
                    MemWrite <= 1'b0;
                    MemtoReg <= 1'b1;
                    PCSrc <= 1'b0;
                    Unsign <= 1'b0;
                    DataOp <= 2'b00;
                    PCSrc_b <= 1'b0;
                    PCEight <= 1'b0;
                    writeRA <= 1'b0;
                    AluSrc1 <= 1'b0;
                end
                //seb
                else if (shftAmt == 5'b10000) begin
                    ALUControl <= 6'b011111;
                    RegDst <= 1'b1;
                    RegWrite <= 1'b1;                    
                    AluSrc2 <= 1'b0;
                    MemRead <= 1'b0;
                    MemWrite <= 1'b0;
                    MemtoReg <= 1'b1;
                    PCSrc <= 1'b0;
                    Unsign <= 1'b0;
                    DataOp <= 2'b00;
                    PCSrc_b <= 1'b0;
                    PCEight <= 1'b0;
                    writeRA <= 1'b0;
                    AluSrc1 <= 1'b0;
                 end
            end
             
             //Branches
             
            //bgez and bltz
            (6'b000001): begin
                //bgez
                if (Instruction[20:16] == 5'b00001) begin
				shftAmt <= Instruction[10:6];

                ALUControl <= 6'b011011;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;                
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b1;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
                end
                //bltz
                else if (Instruction[20:16] == 5'b00000) begin
				shftAmt <= Instruction[10:6];

                ALUControl <= 6'b011100;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;                
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b1;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
                end
            end
            //beq
            (6'b000100): begin
                shftAmt <= Instruction[10:6];
    
                ALUControl <= 6'b010111;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;               
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b1;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
            end
            //bne
                (6'b000101): begin
                shftAmt <= Instruction[10:6];
    
                ALUControl <= 6'b011010;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;              
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b1;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
            end
            //bgtz
            (6'b000111): begin
                shftAmt <= Instruction[10:6];
    
                ALUControl <= 6'b011000;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;              
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b1;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
            end
            //blez
            (6'b000110): begin
                shftAmt <= Instruction[10:6];
    
                ALUControl <= 6'b011001;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;                
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b1;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b0;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
            end
            //j
            (6'b000010): begin
                shftAmt <= Instruction[10:6];
    
                ALUControl <= 6'b100101;
                RegDst <= 1'b0;
                RegWrite <= 1'b0;             
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b1;
                PCEight <= 1'b0;
                writeRA <= 1'b0;
                AluSrc1 <= 1'b0;
            end
            //jal [MUST STORE PC+8, NOT PC+4] -> $ra
            (6'b000011): begin
                shftAmt <= Instruction[10:6];
    
                ALUControl <= 6'b100101;
                RegDst <= 1'b0;
                RegWrite <= 1'b1;               
                AluSrc2 <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                MemtoReg <= 1'b0;
                PCSrc <= 1'b0;
                Unsign <= 1'b0;
                DataOp <= 2'b00;
                PCSrc_b <= 1'b1;
                PCEight <= 1'b1;
                writeRA <= 1'b1;
                AluSrc1 <= 1'b0;
            end
			default: begin
                shftAmt <= Instruction[10:6];

                ALUControl <= 6'b111111;
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
                AluSrc1 <= 1'b0;
            end        
		endcase // Instruction[31:26]
	end // always @(Instruction)
endmodule
