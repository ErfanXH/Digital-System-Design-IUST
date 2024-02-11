MUX2X1 Verilog Module

This repository contains a simple 2x1 Multiplexer (MUX) implemented in Verilog.

# Module Description

The MUX2X1 module takes three inputs and produces one output. The inputs are two data wires, <i>D0</i> and <i>D1</i>, and a select wire <i>S</i>. The output is a single wire <i>Y</i>.

The module works as follows:

The output Y is determined by the select wire S.

- If <i>S</i> is low (0), then <i>Y</i> is equal to <i>D0</i>.

- If <i>S</i> is high (1), then <i>Y</i> is equal to <i>D1</i>.

This is achieved by the line assign Y = ( D0 & ~S ) | ( D1 & S );.

# Usage

To use this module, include it in your Verilog project and instantiate it as needed. You will need to connect the D0, D1, and S inputs and the Y output to the appropriate parts of your project.

# Testing

This module should be thoroughly tested to ensure it works as expected.

### MUX2X1 Testbench

This repository contains a testbench for a 2x1 Multiplexer (MUX) implemented in Verilog.

The MUX2X1_tb module is a testbench designed to test the functionality of the MUX2X1 module. It instantiates the MUX2X1 module and applies various combinations of inputs to it, checking the output each time.

# License

Distributed under the MIT License.

This code is provided by <a href="https://github.com/ErfanXH/Digital-System-Design-IUST">ErfanXH</a> and all rights are reserved.
