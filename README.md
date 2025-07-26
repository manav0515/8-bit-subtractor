# 8-bit-subtractor
This project demonstrates a complete ASIC design flow for a basic 8-bit subtractor, implemented using Verilog and synthesized through the RTL to GDSII flow using Synopsys tools such as Design Compiler and IC Compiler II.

---

## 📌 Project Overview

- Design: - Unsigned 8-bit subtractor (`A - B`)
- Inputs: - A[7:0], B[7:0]
- Outputs: - Diff[7:0], Borrow
- RTL Language: - Verilog HDL
- Toolchain: - Synopsys Design Compiler (DC) + IC Compiler II (ICC2)
- Flow: - RTL → Synthesis → Floorplanning → Placement → Routing → GDSII

---

## 🧠 Functional Description

```verilog
assign {borrow, diff} = A - B;
