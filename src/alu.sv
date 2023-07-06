`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roshan Patel
// 
// Create Date: 05/16/2023 06:38:49 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input logic signed [15:0] a,
    input logic signed [15:0] b,
    input logic [3:0] s,
    output logic [15:0] f,
    output logic take_branch,
    output logic ovf);

always_comb begin
    case (s)
        // addition
        4'b0000: begin
            f = a + b;
            ovf = ( (~a[15]) & (~b[15]) & f[15] ) | ( a[15] & b[15] & ~f[15] );
            take_branch = 0;
            end
        // inversion
        4'b0001: begin
            f = ~b; 
            ovf = 0; 
            take_branch = 0;
            end
        // and
        4'b0010: begin
            f = a & b; 
            ovf = 0; 
            take_branch = 0;
            end
        // or
        4'b0011: begin
            f = a | b; 
            ovf = 0; 
            take_branch = 0;
            end
        // arithmetic shift right
        4'b0100: begin
            f = a >>> b; 
            ovf = 0; 
            take_branch = 0;
            end
        // logical shift left
        4'b0101: begin
            f = a << b; 
            ovf = 0; 
            take_branch = 0;
            end
        // branch if equal
        4'b0110: begin
            f = 0; 
            ovf = 0; 
            take_branch = a == 0; //Use ternary operation for take_branch here
            end
        // branch if not equal
        4'b0111: begin
            f = 0; 
            ovf = 0; 
            take_branch = a != 0; //Use ternary operation for take_branch here
            end
        // xor
        4'b1000: begin
            f = a ^ b;
            ovf = 0;
            take_branch = 0;
            end
        default: begin
            f = 0; 
            ovf = -1; 
            take_branch = -1;
            end
    endcase
end

endmodule
