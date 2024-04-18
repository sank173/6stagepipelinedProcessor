
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 15:41:34
// Design Name: 
// Module Name: MEM_WB
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

module MEM_WB(

input clock,
input reset,
input [31:0] ALU_result_out, // store
input [4:0] write_reg_num_out, // store

input [31:0] Mem_Read_dat, // store
input MemtoRegDout3,
input RegWriteout3,



output [4:0] write_reg_num_out1,
output [31:0] ALU_result_out1,
output [31:0] Mem_Read_dat_out,
output  MemtoRegDout4,
output  RegWriteout4




);


reg [4:0] storewrite_reg_num_out;
reg [31:0] storeALU_result_out;
reg [31:0] storeMem_Read_dat;
reg b,a;

assign write_reg_num_out1 = storewrite_reg_num_out;
assign ALU_result_out1 = storeALU_result_out;
assign Mem_Read_dat_out = storeMem_Read_dat;
assign RegWriteout4 = a;
assign MemtoRegDout4 = b;






always @(posedge clock , negedge reset)
begin
if(reset ==0)
begin 
storewrite_reg_num_out = 5'b0;
storeALU_result_out = 32'b0;
storeMem_Read_dat = 32'b0;
a = 1'b0;
b = 1'b0;
end
else
begin

storewrite_reg_num_out = write_reg_num_out;
storeALU_result_out = ALU_result_out;
storeMem_Read_dat = Mem_Read_dat;
a= RegWriteout3;
b = MemtoRegDout3;
end





end
endmodule

