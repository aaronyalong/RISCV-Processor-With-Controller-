# RISCV-Processor-With-Controller-

## Overview
This project is a RISC-V processor implemented in Verilog, featuring a 5-stage pipeline, control logic, memory modules, and an ALU. It is designed for educational and experimental purposes, providing insight into processor architecture and hardware design.

## Features
- **5-Stage Pipeline:** Implements the standard instruction pipeline stages: Fetch, Decode, Execute, Memory, and Writeback.
- **ALU (Arithmetic Logic Unit):** Handles arithmetic and logic operations.
- **Register File:** Supports register operations with read and write capabilities.
- **Instruction & Data Memory:** Stores instructions and data for program execution.
- **Control Unit:** Decodes instructions and generates control signals.
- **Multiplexers & Flip-Flops:** Essential for data flow and storage within the processor.
- **Testbench (`tb_processor.v`):** Verifies processor functionality through simulation.

## Files and Modules
- `ALU.v` - Performs arithmetic and logic operations.
- `ALUController.v` - Generates control signals for the ALU.
- `Controller.v` - Decodes instructions and generates control signals.
- `DataMem.v` - Implements the data memory module.
- `Datapath.v` - Integrates various modules for instruction execution.
- `FlipFlop.v` - Provides storage for registers and state elements.
- `ImmGen.v` - Generates immediate values from instruction fields.
- `InstMem.v` - Implements the instruction memory module.
- `Mux.v` - Multiplexer for data selection.
- `RegFile.v` - Implements the processor's register file.
- `processor.v` - Top-level module integrating all components.
- `tb_processor.v` - Testbench for simulating and verifying processor behavior.

## Simulation and Testing
To test the processor:
1. Use a Verilog simulator such as ModelSim, Vivado, or Icarus Verilog.
2. Compile the source files along with `tb_processor.v`.
3. Run the simulation and observe output signals to verify correct execution.

## Usage
This project is useful for:
- Understanding processor design and implementation.
- Learning about the RISC-V instruction set and pipelining.
- Experimenting with custom instruction modifications.

## Future Enhancements
- Support for additional RISC-V instructions.
- Optimization for performance and power efficiency.
- Implementation of forwarding and hazard detection.

## License
This project is released under the MIT License. Feel free to use and modify it for educational and research purposes.

