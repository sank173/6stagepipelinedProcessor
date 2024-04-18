`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2024 02:57:16
// Design Name: 
// Module Name: Instruction_Fetch
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


module instruction_fetch(
    input clk,
    input reset,
    input stall,
    output [31:0] Instruction_Code
    );
    reg [31:0] PC;
    wire [31:0] PCjump,PCnext1,PCnextmuxout;
    wire branch;
    instruction_memory im(reset,PC,Instruction_Code);
    assign PCjump = {PCnext1[31:28],Instruction_Code[25:0],2'b0} + PCnext1;
    assign PCnext1 = (reset&~stall&(PCnext1+4<37))?(PC+32'b100):32'b0;
//     assign branch = reset?(~Instruction_Code[31]&~Instruction_Code[29]&Instruction_Code[27]):0;
//    mux_21 m3(PCnext1,PCjump,PCnextmuxout,branch);
    always@(posedge clk)
    begin
        if(!stall)
            PC <= PCnextmuxout;
    end
    always@(negedge reset)
    begin
        if(reset==0)
        PC<=0;
    end
    assign branch = reset?(~Instruction_Code[31]&~Instruction_Code[29]&Instruction_Code[27]):0;
    mux_21 m3(PCnext1,PCjump,PCnextmuxout,branch);
endmodule