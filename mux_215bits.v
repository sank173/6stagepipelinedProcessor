`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 19:12:42
// Design Name: 
// Module Name: mux_215bits
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



module mux_215bits(
    input [4:0] in0,
    input [4:0] in1,
    output reg [4:0] out, 
    input select
    
);

always @* begin
    if (select) begin
        out = in1;
    end else begin
        out = in0;
    end
end

endmodule
