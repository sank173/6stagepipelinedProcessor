`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 17:05:17
// Design Name: 
// Module Name: Processor
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

module Processor(
    input clock,
    input reset
    );

wire [31:0] instruction_code;
wire [31:0] instruction_code_out;
wire RegWriteD,MemtoRegD,MemWriteD,ALUSrcD,RegDstD,JumpD,MemRead;
wire [1:0] AlUControlD20;
wire stall;


wire [25:0] instruction_code_out1;
wire [1:0] AlUControlD20out;
wire RegWriteout,MemtoRegDout,MemWriteDout,ALUSrcDout,RegDstDout,JumpDout,MemReadout;

wire [31:0] Read_dat1;
wire [31:0] Read_dat2;
// make wire for RegWriteout4
// make wire for write_reg_num_out1
// make wire for Write_Dat
wire RegWriteout4;
wire [4:0] write_reg_num_out1;
wire [31:0] Write_Dat;


wire [31:0] immediateData_in;
wire[31:0] immediateData_out;
wire[31:0] RS_out;
wire[31:0] Rt_out;

wire [1:0] AlUControlD20out1;
wire RegWriteout1,MemtoRegDout1,MemWriteDout1,ALUSrcDout1,RegDstDout1,JumpDout1,MemReadout1;

wire [25:0] instruction_code_out2;
wire [1:0] AlUControlD20out2;
wire RegWriteout2,MemtoRegDout2,MemWriteDout2,ALUSrcDout2,RegDstDout2,JumpDout2,MemReadout2;
wire [31:0] ALU_result;
wire [31:0] ALU_result_out,Rt_out1;
wire [1:0] Rs_cont,Rt_cont;
wire [31:0] muxout1,muxout2,ALUin2;
wire [4:0] write_reg_num;


wire [4:0] write_reg_num_out;
wire RegWriteout3,MemWriteDout3,MemReadout3,MemtoRegDout3;

wire [31:0] Mem_Read_dat;

wire [31:0] ALU_result_out1,Mem_Read_dat_out;
wire MemtoRegDout4;

wire [31:0] PCnext_out1;

wire [5:0] opcode;
wire [5:0] opcodeidrr;




// fetch,regbank if_id,instruction_decode instance
instruction_fetch A(clock,reset,stall,instruction_code);

// instr fetch and decode regiter bank instance
IF_ID B (clock,reset,stall,instruction_code,instruction_code_out,opcode);
// instrutction decode instacne
instruction_decode C(instruction_code_out,RegWriteD,MemtoRegD,MemWriteD,AlUControlD20,ALUSrcD,RegDstD,JumpD,MemRead);
///  decode and register read regiter bank instance
ID_RR D(opcode,clock,reset,stall,instruction_code_out,RegWriteD,MemtoRegD,MemWriteD,AlUControlD20,ALUSrcD,RegDstD,JumpD,MemRead,instruction_code_out1,RegWriteout,MemtoRegDout,MemWriteDout,AlUControlD20out,ALUSrcDout,RegDstDout,JumpDout,MemReadout,opcodeidrr);
// register file instance
Register_File E(instruction_code_out1[25:21],instruction_code_out1[20:16],write_reg_num_out1,Write_Dat,reset,clock,RegWriteout4,Read_dat1,Read_dat2);

// sign extending the immediate value in case of load , store word
assign immediateData_in[31:16] = {16{instruction_code_out1[15]}};
assign immediateData_in[15:0] = instruction_code_out1[15:0];

//  selecting the control signal , 0 if to stall , 1 send the original control signal to rr_ex register bank
mux_21single R(RegWriteout,1'b0,RegWriteout1,stall);
mux_21single S(ALUSrcDout,1'b0,ALUSrcDout1,stall);
mux_21single T(RegDstDout,1'b0,RegDstDout1,stall);
mux_21single U(AlUControlD20out[0],1'b0,AlUControlD20out1[0],stall);
mux_21single V(AlUControlD20out[1],1'b0,AlUControlD20out1[1],stall);
mux_21single W(MemWriteDout,1'b0,MemWriteDout1,stall);
mux_21single X(MemReadout,1'b0,MemReadout1,stall);
mux_21single Y(MemtoRegDout,1'b0,MemtoRegDout1,stall);


// rr_ex regiter bank instance
RR_EX F(Read_dat1,Read_dat2,clock,reset,stall,immediateData_in,instruction_code_out1,RegWriteout1,ALUSrcDout1,RegDstDout1,AlUControlD20out1,MemWriteDout1,MemReadout1,MemtoRegDout1,RS_out,Rt_out,immediateData_out,MemReadout2,MemtoRegDout2,instruction_code_out2,MemWriteDout2,RegWriteout2,ALUSrcDout2,RegDstDout2,AlUControlD20out2);

//  4 -1 mux (32 bits) selecting between forwarded values and rs_out / rt_out
mux_41 G(RS_out,ALU_result_out,Write_Dat,32'b0,muxout1,Rs_cont);
mux_41 H(Rt_out,ALU_result_out,Write_Dat,32'b0,muxout2,Rt_cont);

// 2-1 mux for selecting 2 input to alu (between immeadiate value and normal register read value)
mux_21 I(muxout2,immediateData_out,ALUin2,ALUSrcDout2);

// 2-1 mux (5 bits) to select back rt ot rd in reister file to  write back in reister file
mux_215bits J(instruction_code_out2[20:16],instruction_code_out2[15:11],write_reg_num,RegDstDout2);

// Alu instance
ALU K(muxout1,ALUin2,AlUControlD20out2,ALU_result);

// ex-mem register bank instance
EX_MEM L(clock,reset,write_reg_num,ALU_result,muxout2,MemWriteDout2,RegWriteout2,MemReadout2,MemtoRegDout2,ALU_result_out,Rt_out1,RegWriteout3,MemWriteDout3,MemReadout3,MemtoRegDout3,write_reg_num_out);

// mem instance
MEM M(ALU_result_out,Rt_out1,reset,MemWriteDout3,MemReadout3,Mem_Read_dat);
// mem-wb register instacne
MEM_WB N(clock,reset,ALU_result_out,write_reg_num_out,Mem_Read_dat,MemtoRegDout3,RegWriteout3,write_reg_num_out1,ALU_result_out1,Mem_Read_dat_out,MemtoRegDout4,RegWriteout4);

//  write back mux instacne
mux_21 O(ALU_result_out1,Mem_Read_dat_out,Write_Dat,MemtoRegDout4);

// forwarding unit
forwarding_unit P(write_reg_num_out,write_reg_num_out1,instruction_code_out2[25:21],instruction_code_out2[20:16],RegWriteout3,RegWriteout4,Rs_cont,Rt_cont);
// stalling unit
stalling_unit Q( instruction_code_out1[25:21],instruction_code_out1[20:16],instruction_code_out2[20:16],MemReadout2,stall);

endmodule














    
    

    

