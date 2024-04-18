`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 11:49:41
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    input [1:0] Controlinput,
    output reg [31:0] ALU_result
   
);  

 //  assign zero = ~(|result); output zero removed
 
    always @ (operand1, operand2, Controlinput) begin
        case (Controlinput)
            2'b00: ALU_result <= operand1 + operand2; 
            2'b01: ALU_result <= (operand1 & operand2);
            2'b10: ALU_result <= operand1|operand2;
        endcase
    end

endmodule


