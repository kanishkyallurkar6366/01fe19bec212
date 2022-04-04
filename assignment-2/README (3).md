
# PIPELINE MODELLING

Consider a pipeline that carries out the following stage-wise operations :
1. Inputs: Three register addresses(rs1,rs2 and rd), an ALU function (func), and a memory address (addr)
2. Stage 1: Read two 16-bit numbers from the registers specified by "rs1" and "rs2", and store them in A and B.
3. Stage 2: Perform an ALU operation on A and B specified by "func",and store in Z
4. Stage 3: Write the value of Z in the register specified by "rd".
5. Stage 4: Also write the value of Z in memory.

The assumptions to be made are the register bank consists of 16 16-bit registers.
1. 4-bits are required to specify a register address.
2. 2 registera reads and 1 register write can be performed every clock cycle.
3. register addresses are "rs1", "rs2", and "rd".

Assume that the memory is organised as 256x16
1. 8-bits to specify memory address 
2. each memory bit is of 16 bit data which can read in single clock cycle
3. memory address specified as "addr".




