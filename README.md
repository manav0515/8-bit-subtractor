# 🔧 8-bit Subtractor – RTL to GDSII

This project demonstrates a complete **ASIC design flow** for a basic **8-bit subtractor**, implemented using Verilog and taken through the **RTL to GDSII** flow using **Synopsys tools** such as Design Compiler, IC Compiler II, and PrimeTime.

---

## 📌 Project Overview

- **Design: -** Unsigned 8-bit subtractor (`A - B`)
- **Inputs: -** A[7:0], B[7:0]
- **Outputs: -** Diff[7:0], Borrow
- **RTL Language: -** Verilog HDL
- **Toolchain: -** Synopsys Design Compiler (DC), IC Compiler II (ICC2), PrimeTime
- **Flow: -** RTL → Synthesis → Floorplan → Placement → Routing → GDSII + STA

---

## 🧠 Functional Description

```verilog
assign {borrow, diff} = A - B;
