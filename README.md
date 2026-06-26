# Memory Reference Instructions using Verilog

This project implements **Memory Reference Instructions** using **Verilog HDL**.

The design is based on a partial implementation of Mano’s basic computer architecture, mainly focusing on memory access and arithmetic/branch operations.

## Implemented Instructions

The following memory reference instructions are currently implemented:

- **AND** — Performs bitwise AND operation between AC and memory data  
- **ADD** — Adds memory data to the Accumulator (AC)  
- **LDA** (Load Accumulator) — Loads data from memory into AC  
- **STA** (Store Accumulator) — Stores AC data into memory  
- **BUN** (Branch Unconditionally) — Updates Program Counter to specified address  
- **BSA** (Branch and Save Return Address) — Stores return address and branches to subroutine  

## Features

- Verilog-based implementation of memory reference instructions  
- Simulation support through testbench  
- Demonstrates memory access and instruction execution flow  
- Useful for understanding basic CPU architecture and control logic  

## Future Improvements

This architecture is currently incomplete. The following components will be added in future updates:

- **Register Reference Instructions**
- **I/O Instructions**

After implementing these remaining parts, the complete architecture will be integrated into a single Verilog design.

## Applications

This project is useful for:

- Learning Manos computer concepts  
- Understanding instruction execution cycles  
- Practicing Verilog-based CPU design  
- Academic mini-projects and research  

## Tools Used

- **Verilog HDL**
- GTKwave

## Author

**G. Pranav**  
VLSI Student | Verification Enthusiast
