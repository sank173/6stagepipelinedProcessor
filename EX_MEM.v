`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 15:02:16
// Design Name: 
// Module Name: EX_MEM
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







module EX_MEM(
  
    input clock,
    input reset,
    input [4:0] write_reg_num, // store
    input [31:0] ALU_result, // store
    input [31:0] muxout2,  // store

   input MemWriteDout2,
   input RegWriteout2,
   input MemReadout2,
   input MemtoRegDout2,


   output [31:0] ALU_result_out,
   output [31:0] Rt_out1,
   output  RegWriteout3,
   output  MemWriteDout3,
   output  MemReadout3,
   output  MemtoRegDout3,
   output [4:0] write_reg_num_out


   
 
    );

reg [4:0] storewrite_reg_num;
reg [31:0] storeALU_result;
reg [31:0] storemuxout2;
reg a,c,h,b ;

assign ALU_result_out = storeALU_result;
assign Rt_out1 = storemuxout2;
assign write_reg_num_out = storewrite_reg_num;

assign RegWriteout3 = a;
assign MemWriteDout3 = c;
assign MemReadout3 = h;
assign MemtoRegDout3 = b;



always @(posedge clock, negedge reset)
begin
if(reset == 0)
begin   
   
   storemuxout2 = 32'b0;
   storewrite_reg_num = 5'b0;
   storeALU_result = 32'b0;
   a = 1'b0;
   c = 1'b0;
   h = 1'b0;
   b = 1'b0;
end
else 
begin

storemuxout2 = muxout2;
storewrite_reg_num = write_reg_num;
storeALU_result = ALU_result;
a = RegWriteout2;
c= MemWriteDout2;
h = MemReadout2;
b = MemtoRegDout2;

end



end
endmodule

