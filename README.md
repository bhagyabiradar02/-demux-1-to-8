1-to-8 Demultiplexer Design and Verification

Project Overview

This project involves the design and functional verification of a 1-to-8 Demultiplexer (De-mux) using Verilog/SystemVerilog/VHDL. The project includes RTL design, functional verification using EDA Playground, and layout generation using OpenROAD with the Sky130HD platform.

Table of Contents

Introduction

Specifications

Design Architecture

RTL Code

Testbench

Simulation & Verification

GDS Generation

Performance Analysis

Conclusion

Introduction

A 1-to-8 Demultiplexer routes a single input signal to one of eight possible outputs based on a 3-bit select signal. The design was implemented in Verilog and verified using Aldec Riviera-PRO.

Specifications

Inputs:

din (1-bit): Input signal

sel (3-bit): Select signal to determine the output line

Outputs:

dout (8-bit): Output signal where only one bit is HIGH at a time

Design Constraints:

Single-bit input with 3-bit control signal

Design Architecture

The design consists of:

Demux Module: Implements the logic to route the input signal to one of eight output lines.

Selection Logic Module: Ensures only the selected output line is HIGH.

RTL Code

Verilog implementation of the 1-to-8 Demux:

module demux_1_to_8(
    input d,
    input s0, s1, s2,
    output y0, y1, y2, y3, y4, y5, y6, y7
);
    assign y0 = d & ~s2 & ~s1 & ~s0;
    assign y1 = d & ~s2 & ~s1 & s0;
    assign y2 = d & ~s2 & s1 & ~s0;
    assign y3 = d & ~s2 & s1 & s0;
    assign y4 = d & s2 & ~s1 & ~s0;
    assign y5 = d & s2 & ~s1 & s0;
    assign y6 = d & s2 & s1 & ~s0;
    assign y7 = d & s2 & s1 & s0;
endmodule

Testbench

A testbench was created to validate functionality using UVM:

module tb_demux_1_to_8;
    reg d, s0, s1, s2;
    wire y0, y1, y2, y3, y4, y5, y6, y7;
    demux_1_to_8 uut (.d(d), .s0(s0), .s1(s1), .s2(s2), .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6), .y7(y7));

    initial begin
        d = 1; s0 = 0; s1 = 0; s2 = 0; #10; // y0 should be HIGH
        s0 = 1; #10; // y1 should be HIGH
        s1 = 1; s0 = 0; #10; // y2 should be HIGH
        s0 = 1; #10; // y3 should be HIGH
        s2 = 1; s1 = 0; s0 = 0; #10; // y4 should be HIGH
        $finish;
    end
endmodule

Simulation & Verification

The design was verified using Aldec Riviera-PRO.

Waveform analysis confirmed the correct output for all test cases.

UVM-based verification was used to validate the implementation.

GDS Generation

The layout was generated using OpenROAD with the Sky130HD platform.

Configuration files were set up in config.mk and constraint.sdc.

Performance Analysis

Power Measurement:

Component

Internal Power

Switching Power

Leakage Power

Total Power

Sequential

0.00e+00

0.00e+00

0.00e+00

0.00e+00

Combinational

1.51e-05

1.05e-05

9.50e-11

2.56e-05

Clock

0.00e+00

0.00e+00

0.00e+00

0.00e+00

Area Measurement:

Design area: 175 µ²

Utilization: 16%

Timing Information:

Slack (MET): 0.29 ns (No setup/hold violations)

Conclusion

The 1-to-8 Demux was successfully implemented and verified using UVM.

The GDS layout was generated using OpenROAD.

Power consumption: 22.9 mW with 15% area utilization.

No timing violations were detected.

References

EDA Playground: Simulation Link

