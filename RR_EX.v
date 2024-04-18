`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 11:13:47
// Design Name: 
// Module Name: RR_EX
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



module RR_EX(
    input [31:0] Read_Dat11, // to store
    input [31:0] Read_Dat21, // to store
    input clock,
    input reset,
    input stall,
    input [31:0] immediateData_in, // to store
    input [25:0] instruction_code_out1, // to store
    input RegWriteout1,
    input ALUSrcDout1,
    input RegDstDout1,
    input [1:0] AlUControlD20out1,
    input  MemWriteDout1,
    input MemReadout1,
    input MemtoRegDout1,
    output [31:0] RS_out,   // [25-21] // to store
    output [31:0] Rt_out,   // [20-16] to store
    output [31:0] immediateData_out,
    output  MemReadout2,
    output MemtoRegDout2,
    output [25:0] instruction_code_out2,
    output  MemWriteDout2,
    output  RegWriteout2,
    output  ALUSrcDout2,
    output  RegDstDout2,
    output [1:0] AlUControlD20out2 
 
    );



reg [31:0] storeRead_Dat11;
reg [31:0] storeRead_Dat21;
reg [31:0] storeimmediateData_in;
reg [25:0] storeinstruction_code_out1;
reg a,e,f,c,h,b;
reg [1:0] d;



assign instruction_code_out2 = storeinstruction_code_out1;
assign RS_out = storeRead_Dat11;
assign Rt_out = storeRead_Dat21;
assign immediateData_out = storeimmediateData_in;

 assign AlUControlD20out2 = d;
    assign RegWriteout2 = a;
    assign ALUSrcDout2 = e;
    assign RegDstDout2 = f;
    assign MemWriteDout2 = c;
    assign MemReadout2 = h;
   assign  MemtoRegDout2 = b;




  always @(*)
    begin
    if(reset ==0)
    begin
    storeRead_Dat11 = 32'b0;
    storeRead_Dat21 = 32'b0;
    storeimmediateData_in = 32'b0;
    storeinstruction_code_out1= 26'b0;
    a = 1'b0;
    e = 1'b0;
    f = 1'b0;
    c = 1'b0;
    h = 1'b0;
    b = 1'b0;
     d = 2'b00;
     end
     end
    
     always@(posedge clock)
     begin
     if(!stall)
     begin



    storeRead_Dat11 = Read_Dat11;
    storeRead_Dat21 = Read_Dat21;
    storeimmediateData_in = immediateData_in;
    storeinstruction_code_out1 =instruction_code_out1;
    h = MemReadout1;
    b = MemtoRegDout1;
   c= MemWriteDout1;
    a= RegWriteout1;
 e= ALUSrcDout1;
 f= RegDstDout1;
d  = AlUControlD20out1;

    end
    else
    begin
    storeRead_Dat11 = 32'b0;
    storeRead_Dat21 = 32'b0;
    storeimmediateData_in = 32'b0;
    storeinstruction_code_out1= 26'b0;
    a = 1'b0;
    e = 1'b0;
    f = 1'b0;
    c = 1'b0;
    h = 1'b0;
    b = 1'b0;
    d = 2'b00;
    end
     end
     

endmodule