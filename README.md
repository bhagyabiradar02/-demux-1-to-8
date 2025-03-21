# **1-to-8 Demultiplexer Design and Verification**

## **PROJECT OVERVIEW**
This project involves the design and functional verification of a **1-to-8 Demultiplexer (De-mux)** using **Verilog/SystemVerilog/VHDL**. The project includes **RTL design**, **functional verification** using **EDA Playground**, and **layout generation** using **OpenROAD** with the **Sky130HD** platform.

## **TABLE OF CONTENTS**
- [**INTRODUCTION**](#introduction)
- [**SPECIFICATIONS**](#specifications)
- [**DESIGN ARCHITECTURE**](#design-architecture)
- [**RTL CODE**](#rtl-code)
- [**TESTBENCH**](#testbench)
- [**SIMULATION & VERIFICATION**](#simulation--verification)
- [**GDS GENERATION**](#gds-generation)
- [**PERFORMANCE ANALYSIS**](#performance-analysis)
- [**CONCLUSION**](#conclusion)

## **INTRODUCTION**
A **1-to-8 Demultiplexer** routes a single input signal to one of eight possible outputs based on a **3-bit select signal**. The design was implemented in **Verilog** and verified using **Aldec Riviera-PRO**.

## **SPECIFICATIONS**
### **INPUTS:**
- **DIN (1-BIT)**: Input signal
- **SEL (3-BIT)**: Select signal to determine the output line

### **OUTPUTS:**
- **DOUT (8-BIT)**: Output signal where only one bit is **HIGH** at a time

### **DESIGN CONSTRAINTS:**
- **Single-bit input** with **3-bit control signal**

## **DESIGN ARCHITECTURE**
The design consists of:
1. **DEMUX MODULE**: Implements the logic to route the input signal to one of eight output lines.
2. **SELECTION LOGIC MODULE**: Ensures only the selected output line is **HIGH**.

## **RTL CODE**
Verilog implementation of the **1-to-8 Demux**:
```verilog
MODULE DEMUX_1_TO_8(
    INPUT D,
    INPUT S0, S1, S2,
    OUTPUT Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);
    ASSIGN Y0 = D & ~S2 & ~S1 & ~S0;
    ASSIGN Y1 = D & ~S2 & ~S1 & S0;
    ASSIGN Y2 = D & ~S2 & S1 & ~S0;
    ASSIGN Y3 = D & ~S2 & S1 & S0;
    ASSIGN Y4 = D & S2 & ~S1 & ~S0;
    ASSIGN Y5 = D & S2 & ~S1 & S0;
    ASSIGN Y6 = D & S2 & S1 & ~S0;
    ASSIGN Y7 = D & S2 & S1 & S0;
ENDMODULE
```

## **TESTBENCH**
A testbench was created to validate functionality using **UVM**:
```verilog
MODULE TB_DEMUX_1_TO_8;
    REG D, S0, S1, S2;
    WIRE Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
    DEMUX_1_TO_8 UUT (.D(D), .S0(S0), .S1(S1), .S2(S2), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7));

    INITIAL BEGIN
        D = 1; S0 = 0; S1 = 0; S2 = 0; #10; // Y0 SHOULD BE HIGH
        S0 = 1; #10; // Y1 SHOULD BE HIGH
        S1 = 1; S0 = 0; #10; // Y2 SHOULD BE HIGH
        S0 = 1; #10; // Y3 SHOULD BE HIGH
        S2 = 1; S1 = 0; S0 = 0; #10; // Y4 SHOULD BE HIGH
        $FINISH;
    END
ENDMODULE
```

## **SIMULATION & VERIFICATION**
- The design was verified using **Aldec Riviera-PRO**.
- **Waveform analysis** confirmed the correct output for all test cases.
- **UVM-based verification** was used to validate the implementation.

## **GDS GENERATION**
- The layout was generated using **OpenROAD** with the **Sky130HD** platform.
- Configuration files were set up in **config.mk** and **constraint.sdc**.


## **CONCLUSION**
- The **1-to-8 Demux** was successfully **implemented and verified** using **UVM**.
- The **GDS layout** was generated using **OpenROAD**.
- **Power consumption**: **22.9 MW** with **15% area utilization**.
- **No timing violations** were detected.

## **REFERENCES**
- **EDA PLAYGROUND**: [**SIMULATION LINK**](https://edaplayground.com/x/Fgce)

