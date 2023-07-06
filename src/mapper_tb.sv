`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2023 06:49:38 PM
// Design Name: 
// Module Name: mapper_tb
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


module mapper_tb();

logic [15:0] instr;
logic [2:0] rs1,rs2,rd;
logic [6:0] immediate;
logic [5:0] nzimm;
logic [8:0] offset;
logic [3:0] opcode;

mapper dut(.instruction(instr), .rs1(rs1), .rs2(rs2), .rd(rd), .immediate(immediate), .nzimm(nzimm), .offset(offset), .opcode(opcode));

initial begin

instr = 16'h05ad;
#100 instr = 16'hc14c;
#100 instr = 16'h060d;
#100 instr = 16'hc910;
#100 instr = 16'h8605;
#100 instr = 16'h40c8;
#100 instr = 16'h8d51;
#100 instr = 16'h4a80;
#100 instr = 16'h8c69;

end
endmodule
