`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 05:08:16 PM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input logic [6:0] immediate,
    input logic [5:0] nzimm,
    input logic [8:0] offset,
    input logic [3:0] opcode,
    output logic RegWrite,
    output logic RegDst,
    output logic [15:0] instr_i,
    output logic ALUSrc1,
    output logic ALUSrc2,
    output logic [3:0] ALUOp,
    output logic MemWrite,
    output logic MemToReg,
    output logic Regsrc
    );
    
    always_comb begin
        case(opcode)
            4'b0000: begin // load word
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(immediate);
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0000;
                MemWrite = 0;
                MemToReg = 1;
                Regsrc = 0;
            end
            4'b0001: begin // store word
                RegWrite = 0;
                RegDst = 0;
                instr_i = 16'(immediate);
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0000;
                MemWrite = 1;
                MemToReg = 0;
                Regsrc = 0;
            end
            4'b0010: begin // add
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(0);
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0000;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0011: begin // add add i
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(nzimm);
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0000;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0100: begin // and
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(0);
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0010;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0101: begin //and i
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(immediate);
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0010;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0110: begin // or
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(0);
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0011;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b0111: begin // xor
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(0);
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b1000;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b1000: begin // sra i
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(nzimm);
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0100;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b1001: begin // shift left logical immediate
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'(nzimm);
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0101;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 1;
            end
            4'b1010: begin // shift left logical immediate
                RegWrite = 0;
                RegDst = 0;
                instr_i = 16'(offset);
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0110;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 0;
            end
            4'b1011: begin // shift left logical immediate
                RegWrite = 0;
                RegDst = 0;
                instr_i = 16'(offset);
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b1000;
                MemWrite = 0;
                MemToReg = 0;
                Regsrc = 0;
            end
        endcase
    end
    
endmodule
