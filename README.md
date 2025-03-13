# UVM Testbench for ALU

## 📌 Project Overview
This repository contains a **Universal Verification Methodology (UVM) testbench** for an **Arithmetic Logic Unit (ALU)**. The testbench is designed to verify the functionality of the ALU by generating different test scenarios and checking expected results against actual outputs.

## 🔥 Features
- Implements a **UVM-based** test environment.
- Supports **randomized and directed tests** for different ALU operations.
- Includes a **scoreboard** to track and compare expected vs. actual results.
- Covers operations such as:
  - Addition (`ADD`)
  - Subtraction (`SUB`)
  - AND (`AND`)
  - OR (`OR`)
  - XOR (`XOR`)
  - Overflow conditions
  - Undefined opcodes handling
- Supports **regression testing** to ensure reliability across multiple runs.

## 📂 Repository Structure

```
├── ALU.sv                      # ALU Design Under Test (DUT)
├── ALU_random_sequence.sv      # Generates random ALU operations
├── ALU_regression_Test.sv      # Regression test configuration
├── Alu_add_sequence.sv         # Test sequence for ADD operation
├── Alu_sub_sequence.sv         # Test sequence for SUB operation
├── Alu_and_sequence.sv         # Test sequence for AND operation
├── Alu_or_sequence.sv          # Test sequence for OR operation
├── Alu_xor_sequence.sv         # Test sequence for XOR operation
├── Alu_overflow_sequence.sv    # Tests ALU overflow scenarios
├── Alu_undefined_opcode_sequence.sv  # Tests unknown opcode behavior
├── Alu_env.sv                  # UVM Environment setup
├── Alu_scoreboard.sv           # Scoreboard to compare expected vs actual values
├── alu_agent.sv                # Agent that drives and monitors transactions
├── tar_alu_driver.sv           # UVM Driver implementation
├── tar_alu_monitor.sv          # UVM Monitor implementation
├── tar_alu_interface.sv        # Interface connecting testbench to DUT
├── tar_alu_sequencer.sv        # Generates test sequences
├── tar_alu_sequence_item.sv    # Defines transaction structure
├── base_alu_test.sv            # Base test class
├── random_test.sv              # Randomized test scenario
├── package.sv                  # UVM package including all components
├── subscriber.sv               # Subscriber to analyze results
├── top.sv                      # Top-level testbench module
└── README.md                   # Project documentation
```

## 🛠 How to Run the Testbench
1. **Ensure you have UVM installed** in your simulator (e.g., ModelSim, Questa, VCS).
2. **Compile the design and testbench**:
   ```sh
   vlog -sv ALU.sv package.sv top.sv
   ```
3. **Run the simulation**:
   ```sh
   vsim -c -do "run -all"
   ```
4. **Analyze the waveforms and logs** to verify ALU behavior.

## 📊 Expected Output
- The testbench prints pass/fail messages for each operation.
- The scoreboard verifies correctness by comparing expected and actual values.
- The regression test ensures the ALU operates correctly under various conditions.

## 🚀 Future Improvements
- Implement **assertions** to catch unexpected behavior.
- Extend the testbench to support **more ALU operations**.

## 📜 License
This project is open-source and licensed under the MIT License.

---
🎯 **Maintainer:**Tarneem

