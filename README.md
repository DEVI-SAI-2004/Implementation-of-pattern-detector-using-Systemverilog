Verilog-based Serial Pattern Detector

## Overview
This project implements a synchronous serial bit-stream pattern detector in Verilog HDL. The design utilizes a shift register architecture coupled with combinational equality logic to monitor serial input data streams and assert a detection flag upon recognizing a pre-defined target bit sequence.

## Architecture & Data Flow
* **Shift Register (`shift_reg`):** A synchronous register that shifts incoming serial data bits (`in_bit`) on every positive clock edge.
* **Comparator Module (`$eq`):** Continuously checks the shift register's current window against the target sequence constant (`8'b10101011`).
* **Sequential Control:** Synchronous active-high reset logic clears the pipeline, ensuring robust state recovery.

### RTL Schematic Diagram
*(Generated via synthesis tools showing the shift register, MUX blocks, and comparator logic)*  
<img width="1413" height="474" alt="Screenshot 2026-09-27 124500" src="https://github.com/user-attachments/assets/bc09b86e-23cb-4313-833e-6aea777c628c" />

## Simulation & Verification
The design was verified using self-checking testbenches, observing accurate waveform state transitions across continuous input streams.

* **Toolchain:** ModelSim / EDA Playground
* **Waveform Results:**
<img width="1916" height="325" alt="Screenshot 2026-09-30 090325" src="https://github.com/user-attachments/assets/c14e9d83-c2ae-45a9-b866-5d17de428aca" />
## Repository Structure
```text
├── design.sv       # Core Verilog RTL code (Shift register & comparator)
├── testbench.sv    # Testbench for stimulus generation and monitoring
└── README.md
