`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 16:34:32
// Design Name: 
// Module Name: stalling_unit
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


module stalling_unit(Rs_id_reg,Rt_id_reg,Rt_reg_exe,MemRead_reg_exe,stall

    ); 
    //stalling is achieved by making the stall value 1 so that the write sig in all ff is made 1 which prevents writing to it.
  input [4:0] Rs_id_reg,Rt_id_reg,Rt_reg_exe; //only for Raw dependency caused by Lw instruction
   input MemRead_reg_exe;
//   output reg  stall;
output stall;

   assign stall = (Rs_id_reg == Rt_reg_exe & MemRead_reg_exe == 1 ) | (Rt_id_reg == Rt_reg_exe & MemRead_reg_exe == 1);
   
   
// always @(*) begin
//    stall <= (Rs_id_reg == Rt_reg_exe & MemRead_reg_exe == 1 ) | (Rt_id_reg == Rt_reg_exe & MemRead_reg_exe == 1);
//end
            
  
   
endmodule
   
