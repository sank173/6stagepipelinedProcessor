`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2024 21:03:10
// Design Name: 
// Module Name: Processor_test
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



module Processor_test();

reg clock =0;
reg reset =0;

Processor dut (clock,reset);

//always
//begin

//clock = ~clock; #10;
//end
//initial
//begin
//reset = 1; #5;
//reset =0; #200;
//reset =1;

//end
initial begin
    reset=1'b0; #1;
    reset=1'b1; #130;
    $stop;
end

initial begin
        clock=1'b0;
        forever begin
            #5 clock=~clock;
            end
        end
endmodule