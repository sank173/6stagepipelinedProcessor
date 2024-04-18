6-Stage Pipelined Processor Implementation in Verilog

This project implements a 6-stage pipelined processor in Verilog. The processor supports the following instructions: load (lw), store (sw), jump (j), or (or), and immediate (andi). It also incorporates forwarding to resolve data hazards.

Description
The processor consists of the following units:

Instruction Fetch (IF)
Decode (ID)
Register Read (RR)
Execution (EX)
Memory (MEM)
Writeback (WB)
Additionally, it utilizes five pipelined registers:

IF/ID
ID/RR
RR/EX
EX/MEM
MEM/WB
Upon reset, the PC and all register file registers are initialized to 0. The instruction memory and register file are preloaded with predefined values. Data memory (DMEM) is organized such that each location contains 8-bit data, and 32-bit values require 4 locations in big-endian format.

Instruction Set
The supported instructions and their formats are as follows:

lw (Load)

lw destinationReg, offset [sourceReg]
op rs rt offset
sw (Store)

sw sourceReg1, offset [sourceReg2]
op rs rt offset
or (Bitwise OR)

or destinationReg, sourceReg1, sourceReg2
op rs rt rd shamt funct
andi (Bitwise AND Immediate)

andi destinationReg, sourceReg, immediate
op rs rt offset
j (Jump)


j target
op offset
Initialization
Upon reset, the instruction memory is initialized with the following instructions starting at address 0:


lw R1, R2, #10
sw R1, R3, #5
or R2, R5, R3
or R1, R6, R7
andi R1, R3, #10
Usage
To use this processor implementation, follow these steps:

Clone the repository.
Open the Verilog files in your preferred Verilog simulator or synthesis tool.
Simulate or synthesize the design according to your requirements.
Contributors
Sanket Lonkar - Initial implementation
