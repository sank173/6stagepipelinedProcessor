`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 16:17:38
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(
    input [4:0] Rd_exe_mem,
    input [4:0] Rd_mem_wb,
    input [4:0] Rs_reg_exe,
    input [4:0] Rt_reg_exe,
    input Regwrite_exe_mem,
    input Regwrite_mem_wb,
    output [1:0] Rs_cont,
    output [1:0] Rt_cont
);

reg [1:0] rs, rt;

always @(*) begin
    if (Rs_reg_exe == Rd_exe_mem & Regwrite_exe_mem == 1 & Rd_exe_mem != 5'b0)
        rs <= 2'b01;
    else if (Rs_reg_exe == Rd_mem_wb & Regwrite_mem_wb == 1 && Rd_mem_wb != 5'b0)
        rs <= 2'b10;
    else
        rs <= 2'b00;
end

always @(*) begin
    if (Rt_reg_exe == Rd_exe_mem & Regwrite_exe_mem == 1 & Rd_exe_mem != 5'b0)
        rt <= 2'b01;
    else if (Rt_reg_exe == Rd_mem_wb & Regwrite_mem_wb == 1 & Rd_mem_wb != 5'b0)
        rt <= 2'b10;
    else
        rt <= 2'b00;
end

assign Rs_cont = rs;
assign Rt_cont = rt;

endmodule
