
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 15:18:43
// Design Name: 
// Module Name: MEM
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



module MEM(
    input [31:0] ALU_result_out, // address
    input [31:0] Rt_out1, // writeData
    input reset,
   input MemWriteDout3,
   input MemReadout3,
    output reg [31:0] Mem_Read_dat
);

reg [7:0] dataReg [51:0]; //byte addressable 40 memory locations

//reading and writing
always@(*)
begin
    if(MemReadout3 == 1'b1)
        begin
        Mem_Read_dat =  {dataReg[(ALU_result_out<<2)], dataReg[(ALU_result_out<<2) + 1], dataReg[(ALU_result_out<<2) + 2], dataReg[(ALU_result_out<<2) +3 ]};
        end
    else if(MemWriteDout3 == 1'b1)
        begin
        dataReg[(ALU_result_out<<2)]   <= Rt_out1[31:24];
        dataReg[(ALU_result_out<<2) +1] <= Rt_out1[23:16];
        dataReg[(ALU_result_out<<2) +2] <= Rt_out1[15:8];
        dataReg[(ALU_result_out<<2) +3] <= Rt_out1[7:0];
        end
        
    else
    Mem_Read_dat = ALU_result_out;  
      
end

//initialization of data memory
always@(negedge reset)
begin

    dataReg[0] = 8'b0; dataReg[1] = 8'b0; dataReg[2] = 8'b0; dataReg[3] = 8'b0; //first 32 bit location
    dataReg[4] = 8'b0; dataReg[5] = 8'b0; dataReg[6] = 8'b0; dataReg[7] = 8'b0; //second 32 bit location
    dataReg[8] = 8'hBC; dataReg[9] = 8'b0; dataReg[10] = 8'd25; dataReg[11] = 8'hD4; //third 32 bit location
    dataReg[12] = 8'hAC; dataReg[13] = 8'hD5; dataReg[14] = 8'b0; dataReg[15] = 8'b0; //fourth 32 bit location
    dataReg[16] = 8'b0; dataReg[17] = 8'b0; dataReg[18] = 8'b0; dataReg[19] = 8'b0; //fourth 32 bit location
   dataReg[20] = 8'b0; dataReg[21] = 8'b0; dataReg[22] = 8'b0; dataReg[23] = 8'b0; //fourth 32 bit location
   dataReg[24] = 8'b0; dataReg[25] = 8'b0; dataReg[26] = 8'b0; dataReg[27] = 8'b0; //fourth 32 bit location
   dataReg[28] = 8'b0; dataReg[29] = 8'b0; dataReg[30] = 8'b0; dataReg[31] = 8'b0; //fourth 32 bit location
   dataReg[32] = 8'b0; dataReg[33] = 8'b0; dataReg[34] = 8'b0; dataReg[35] = 8'b0; //fourth 32 bit location
   dataReg[36] = 8'b0; dataReg[37] = 8'b0; dataReg[38] = 8'b0; dataReg[39] = 8'd25 ; //fourth 32 bit location
   dataReg[40] = 8'b0; dataReg[41] = 8'b0; dataReg[42] = 8'b0; dataReg[43] = 8'b0; //fourth 32 bit location
   dataReg[44] = 8'b0; dataReg[45] = 8'b0; dataReg[46] = 8'b0; dataReg[47] = 8'b0; //fourth 32 bit location
   dataReg[48] = 8'hAC; dataReg[49] = 8'hD5; dataReg[50] = 8'b0; dataReg[51] = 8'b0; //fourth 32 bit location
end

endmodule