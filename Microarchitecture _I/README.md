# Components of processor

## Program Execution flow

![image](https://github.com/user-attachments/assets/92c94a6d-b34e-4947-9ff1-001d25cd6828)

## Instruction Memory

![image](https://github.com/user-attachments/assets/a8e4bdfc-fcbf-41b2-934c-1c47eeb1eb4d)

 The instruction memory has a single read port. It takes a 32-bit instruction address input, A, and reads the 32-bit data (i.e., instruction) from that address onto the read data output, RD.

## Program counter

![image](https://github.com/user-attachments/assets/cbc5f69f-81e1-41d8-a3d9-669f4d0fc231)

 The program counter is an ordinary 32-bit register. Its output, PC, points to the current instruction. Its input, PCNext, indicates the address of the next instruction


 ## Register file

 ![image](https://github.com/user-attachments/assets/1658d51a-f7a1-4ed5-9797-9beb6e9bff6a)

The 32-element × 32-bit register file has two read ports and one write port. The read ports take 5-bit address inputs, A1 and A2, each specifying one of 25 = 32 registers as source operands. They read the 32-bit register values onto read data outputs RD1 and RD2, respectively. The write port takes a 5-bit address input, A3; a 32-bit write data input, WD; a
 write enable input, WE3; and a clock. If the write enable is 1, the register file writes the data into the specified register on the rising edge of the clock.

 ## Data Memory

 ![image](https://github.com/user-attachments/assets/05154eef-cf99-45f5-9036-06616f33e4f5)

The data memory has a single read/write port. If the write enable, WE, is 1, it writes data WDinto address A on the rising edge of the clock. If the write enable is 0, it reads address A onto RD.
