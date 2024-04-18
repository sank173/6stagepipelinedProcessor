`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2024 18:40:59
// Design Name: 
// Module Name: Register_File
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
module Register_File(
    input [4:0] Read_reg_num1,
    input [4:0] Read_reg_num2,
    input [4:0] Write_reg_num,
    input [31:0] Write_Dat,
    input reset,
    input clock,
    input RegWriteout,
    output [31:0] Read_Dat11,
    output [31:0] Read_Dat21
    );
    
    reg [31:0] Regmemory [31:0];
    reg [31:0] Read_Dat1;
    reg [31:0] Read_Dat2;
//    wire iszero;
//    assign iszero = ~(Write_reg_num[0]|Write_reg_num[1]|Write_reg_num[2]|Write_reg_num[3]|Write_reg_num[4]);
    assign Read_Dat11 = Read_Dat1;
    assign Read_Dat21 = Read_Dat2;

    
    
    always@(negedge reset) begin
    if(reset == 0)
    begin
        Regmemory[0] = 32'h0; Regmemory[1] = 32'h0; Regmemory[2] = 32'h0; Regmemory[3] = 32'h0; 
        Regmemory[4] = 32'h0; Regmemory[5] = 32'h0; Regmemory[6] = 32'h0; Regmemory[7] = 32'h0;
        Regmemory[8] = 32'h0; Regmemory[9] = 32'h0; Regmemory[10] = 32'h0; Regmemory[11] = 32'h0; 
        Regmemory[12] = 32'h0; Regmemory[13] = 32'h0; Regmemory[14] = 32'h0; Regmemory[15] = 32'h0; 
        Regmemory[16] = 32'h0; Regmemory[17] = 32'h0; Regmemory[18] = 32'h0; Regmemory[19] = 32'h0; 
        Regmemory[20] = 32'h0; Regmemory[21] = 32'h0; Regmemory[22] = 32'h0; Regmemory[23] = 32'h0; 
        Regmemory[24] = 32'h0; Regmemory[25] = 32'h0; Regmemory[26] = 32'h0; Regmemory[27] = 32'h0; 
        Regmemory[28] = 32'h0; Regmemory[29] = 32'h0; Regmemory[30] = 32'h0; Regmemory[31] = 32'h0;
     end
     end
     
     always@(negedge clock)
     begin
         Read_Dat1 = Regmemory[Read_reg_num1];
          Read_Dat2 = Regmemory[Read_reg_num2];
          end
         
     always @(posedge clock) begin
       if(RegWriteout == 1 & reset ==1)      // iszero != 1 & 
           Regmemory[Write_reg_num] = Write_Dat;
           
     end
     
endmodule

