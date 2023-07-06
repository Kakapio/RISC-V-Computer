`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 06:49:40 PM
// Design Name: 
// Module Name: two_to_one_mux
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

// w = data, s = the signal, f is the input for the alu
module two_to_one_mux(a, b, sel_mux, out);
    
input logic [15:0] a;
input logic [15:0] b;
input logic sel_mux;
output logic [15:0] out;

always_comb begin
    case(sel_mux)
        1'b0: begin
            out = a;
            end
        1'b1: begin
            out = b;
            end
    endcase
    end
endmodule
