`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 00:06:50
// Design Name: 
// Module Name: IF_ID
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

module IF_ID(
    input clock,
    input reset,
    input stall,
    input [31:0] instruction_code,
    output [31:0] instruction_code_out,
    output [5:0] opcode
);

    reg [31:0] RegisterIDIF , PCnext_out;
//    assign PCnext_out1 = PCnext_out;
   assign instruction_code_out = RegisterIDIF;
    assign opcode = RegisterIDIF[31:26];
    

    always @(posedge clock , negedge reset)
     begin
         if(!stall)
          begin
          if(reset ==0 )
          RegisterIDIF <=0;
          else
          begin
          
            RegisterIDIF <= instruction_code;
        end
        end
        else
        begin
         if(reset ==0 )
         RegisterIDIF <= 0;
         end
         end

endmodule



