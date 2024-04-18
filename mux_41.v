`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 11:24:04
// Design Name: 
// Module Name: mux_41
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



module mux_41(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    output reg [31:0] out, 
    input [1:0]select
    
);
   always@(select or in0 or in1 or in2 or in3)
    begin
     case(select)
     2'b00:begin   
     out <= in0;
     end

    2'b01:begin   
    out <= in1;
    end

    2'b10:begin   
    out <= in2;
    end

    2'b11:begin   
    out <= in3;
    end


    endcase
    end
 
endmodule
