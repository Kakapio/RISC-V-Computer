`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 05:59:35 PM
// Design Name: 
// Module Name: reg_file
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

// RegWrite = wr_en
module reg_file(rst, clk, wr_en, rd0_addr, rd1_addr, wr_addr, wr_data, rd0_data, rd1_data);

input logic rst, clk, wr_en;
input logic [2:0] rd0_addr, rd1_addr, wr_addr;
input logic [15:0] wr_data;
output logic [15:0] rd0_data, rd1_data;
logic [15:0] REG [0:7];

// reading from the register
assign rd0_data = REG[rd0_addr];
assign rd1_data = REG[rd1_addr];

// assign rd1_data =
//writing to the register
always_ff @(posedge clk, negedge rst) begin
    if( rst == 1'b0 ) begin
        REG[0] = 0;
        REG[1] = 0;
        REG[2] = 0;
        REG[3] = 0;
        REG[4] = 0;
        REG[5] = 0;
        REG[6] = 0;
        REG[7] = 0;
        //write more code here to reset the value of REG[1], REG[2], REG[3]
        end
    else if ( wr_en == 1'b1 ) begin
        REG[wr_addr] = wr_data;
        end
end
endmodule

