`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 11:58:39
// Design Name: 
// Module Name: controlunit
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


module controlunit(
       input [5:0] opcode,
    output reg RegWriteD,
     output reg MemtoRegD,
      output reg MemWriteD,
       output reg[1:0] AlUControlD20,
        output reg ALUSrcD,
         output reg RegDstD,
         output reg JumpD,
         output reg MemRead
    );
// you have to add function code as input too  
     
    always@(opcode)
    begin
     case(opcode)
     6'b100011:begin   // load word
     RegDstD <=0 ;
     ALUSrcD <=1;
     MemtoRegD <= 1;
     RegWriteD <=1;
     MemRead <=1;
     MemWriteD <=0;
     JumpD <=0;
     AlUControlD20 <= 2'b00;
     end
       6'b101011:begin    // store word
     RegDstD <=0 ; // Don't Care
     ALUSrcD <=1;
     MemtoRegD <= 0; // Don't Care
     RegWriteD <=0;
     MemRead <=0;
     MemWriteD <=1;
     JumpD <=0;
     AlUControlD20 <= 2'b00;
     end

      6'b000000:begin // R-type instruction (or)
     RegDstD <=1 ;
     ALUSrcD <=0;
     MemtoRegD <= 0;
     RegWriteD <=1;
     MemRead <=0;
     MemWriteD <=0;
     JumpD <=0;
     AlUControlD20 <= 2'b10;
     end

      6'b001100:begin // ANDI
     RegDstD <=0 ;
     ALUSrcD <=1;
     MemtoRegD <= 0;
     RegWriteD <=1;
     MemRead <=0;
     MemWriteD <=0;
     JumpD <=0;
     AlUControlD20 <= 2'b01;
     end

      6'b000010:begin   // jump 
     RegDstD <=0 ; // dont'care
     ALUSrcD <=0; // dont care  
     MemtoRegD <= 0;  // dont care
     RegWriteD <=0;    
     MemRead <=0;
     MemWriteD <=0;
     JumpD <=1;
     AlUControlD20 <= 2'b01;
     end




         
     endcase
     end
     
 
    
    
    
endmodule