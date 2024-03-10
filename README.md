# ULA_VHDL

## Overview
This repository contains the VHDL code for implementing a device featuring an Arithmetic Logic Unit (ALU) with a test interface system. The project is designed for FPGA boards and provides both the simulation and implementation aspects of digital design using VHDL.

## Features
- ALU capable of performing a variety of arithmetic and logical operations.
- Testbench files for simulation of the ALU design.
- Hardware testing capabilities using LEDs, switches, and push buttons on the FPGA board.

## Development Environment
The project was developed using:
- *Xilinx ISE Digital Design Suite*: For coding and project management.
- *ISim*: Integrated simulator in Xilinx ISE for simulating VHDL designs.
- *Xilinx Spartan-3 XC3S700A-FG484 FPGA*: Target device for physical implementation and testing.

## Files Description
- *SimULA.vhd*: Testbench file for simulating the basic functionalities of the ALU.
- *Sim_ULA.vhd*: Testbench file for more extensive simulation scenarios of the ALU.
- *Relatorio_SD_ULA.pdf*: A comprehensive lab report detailing the simulation results, implementation process, and testing methodologies on the FPGA board.

## Getting Started
To get started with this project, clone this repository and open the project files in Xilinx ISE. You will need to have Xilinx ISE and ISim installed on your computer to compile the VHDL code and run simulations.

## Hardware Testing
For hardware testing:
1. Load the compiled design onto a Xilinx Spartan-3 FPGA.
2. Use the switches on the board to select the desired ALU operation.
3. Use push buttons and a board switch to manage the inputs to the ALU.
4. Observe the outcomes of ALU operations through LEDs on the development board.

## Contributing
Contributions to this project are welcome. Please ensure to follow coding standards and add comments for clarity when submitting pull requests.

## License
[Specify the license under which this project is available, e.g., MIT, GPL]

## Contact
For any inquiries or contributions, please [specify contact method, e.g., create an issue in this repository].
