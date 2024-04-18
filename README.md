# 6-Stage Pipelined Processor Implementation in Verilog

Welcome to the 6-stage pipelined processor project implemented in Verilog! This processor is designed to handle load (lw), store (sw), jump (j), or (or), and immediate (andi) instructions efficiently. It incorporates forwarding to resolve data hazards and supports a wide range of operations.

# Overview

The processor architecture comprises six stages:
Instruction Fetch (IF)
Decode (ID)
Register Read (RR)
Execution (EX)
Memory (MEM)
Writeback (WB)
Each stage is carefully designed to optimize performance and minimize latency.

# Supported Instructions

lw (Load): Load data from memory into a register.
sw (Store): Store data from a register into memory.
or (Bitwise OR): Perform bitwise OR operation between two registers.
andi (Bitwise AND Immediate): Perform bitwise AND operation between a register and an immediate value.
j (Jump): Jump to a specified target address.

# Initialization

Upon reset, the processor initializes with a set of predefined instructions and data. The instruction memory is loaded with the following code sequence:
lw R1, R2, #10
sw R1, R3, #5
or R2, R5, R3
or R1, R6, R7
andi R1, R3, #10

# Usage

To use this processor implementation:

Clone the repository to your local machine.
Open the Verilog files in your preferred Verilog simulator or synthesis tool.
Simulate or synthesize the design to observe its functionality.

# Contributors

Sanket Lonkar - Initial implementation
