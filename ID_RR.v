`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 00:45:42
// Design Name: 
// Module Name: ID_RR
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


module ID_RR(
input [5:0] opcode,

input clock,
input reset,
input stall,
input [25:0] instruction_code_out,
input RegWriteD,
input MemtoRegD,
input MemWriteD,
input[1:0] AlUControlD20,
input ALUSrcD,
input RegDstD,
input JumpD,
input MemRead,
output [25:0] instruction_code_out1,
output  RegWriteout,  //a
output MemtoRegDout,  //b
output  MemWriteDout,   //c
output [1:0] AlUControlD20out, //d
output ALUSrcDout,  // e
output  RegDstDout,   //f
output  JumpDout,   //g
output  MemReadout ,  //h
output [5:0] opcodeidrr
 

);


reg a,e,f,c,h,b;
    reg [1:0] d;
    reg [25:0] Instruction_code_out;
    reg [5:0]opcodereg;
    assign instruction_code_out1 = Instruction_code_out;
    assign AlUControlD20out = d;
    assign RegWriteout = a;
    assign ALUSrcDout = e;
    assign RegDstDout = f;
    assign MemWriteDout = c;
    assign MemReadout = h;
   assign  MemtoRegDout = b;
   assign opcodeidrr = opcodereg;
  // assign muxexe2_out1 = muxexe2_out;
    always @(posedge clock) begin
 
        if (!stall) begin
            Instruction_code_out = instruction_code_out;
            a <= RegWriteD;
            e <= ALUSrcD;
            f <= RegDstD;
            d <= AlUControlD20;
            c <= MemWriteD;
            h <= MemRead;
            b <= MemtoRegD;
            opcodereg = opcode;
            
    end
end

always @(*) begin
    if (reset == 0) begin
        Instruction_code_out = 26'b0;
        a = 1'b0;
        e = 1'b0;
        f = 1'b0;
        d = 2'b0;
        c = 1'b0;
        h = 1'b0;
        b = 1'b0;
        opcodereg = 6'b0;
        
    end
end

endmodule
                
               
                
          

