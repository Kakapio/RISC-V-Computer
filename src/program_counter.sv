`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2023 05:32:45 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input logic clk,
    input logic rst,
    output logic [7:0] pc
    );
    
    logic [7:0] count;
    
always_ff @(posedge clk, negedge rst) begin
    if(rst == 1'b0) begin
        count = 0;
        end
    else if(rst == 1'b1) begin
        count++;
        end
end

assign pc = count;
    
endmodule
