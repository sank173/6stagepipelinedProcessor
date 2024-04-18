`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 11:54:54
// Design Name: 
// Module Name: instruction_decode
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






module instruction_decode(
    input [31:0] instruction_code,
     output RegWriteD,
     output  MemtoRegD,
     output  MemWriteD,
     output [1:0] AlUControlD20,
     output  ALUSrcD,
     output  RegDstD,
     output JumpD,
     output MemRead
);


controlunit A(instruction_code[31:26],RegWriteD,MemtoRegD,MemWriteD,AlUControlD20,ALUSrcD,RegDstD,JumpD,MemRead);

endmodule



