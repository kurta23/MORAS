// R0: Length of the array (N)
// Array starts at RAM[100]
// Temp registers: R1, R2, R3, R4, R5

@0
D=M              // Load length of array into D
@1
M=D              // Store length in R1 (remaining passes)
@1
M=M-1            // R1 = R1 - 1

(OUTER_LOOP)
@1
D=M              // Check if R1 == 0
@DONE
D;JEQ            // If no passes left, exit

@100
D=A              // Start address of the array
@2
M=D              // R2 = Start address
@3
M=0              // R3 = Inner loop counter

(INNER_LOOP)
@2
A=M              // Set A to R2 (current address)
D=M              // D = RAM[R2] (current value)
@4
M=D              // R4 = RAM[R2]

@2
A=M+1            // Set A to R2+1 (next address)
D=M              // D = RAM[R2+1] (next value)
@5
M=D              // R5 = RAM[R2+1]

@4
D=M              // D = R4
@5
D=D-M            // D = R4 - R5
@NO_SWAP
D;JLE            // If R4 <= R5, no swap

// Swap R4 and R5
@5
D=M              // D = R5
@2
A=M              // Set A to R2
M=D              // RAM[R2] = R5

@4
D=M              // D = R4
@2
A=M+1            // Set A to R2+1
M=D              // RAM[R2+1] = R4

(NO_SWAP)
@2
M=M+1            // Increment R2 (move to next pair)
@3
M=M+1            // Increment R3 (inner loop counter)
@1
D=M              // Load R1 (remaining passes)
@3
D=D-M            // D = R1 - R3
@INNER_LOOP
D;JGT            // If R3 < R1, continue inner loop

// Decrement remaining passes
@1
M=M-1            // R1 = R1 - 1
@OUTER_LOOP
0;JMP            // Repeat outer loop

(DONE)
@DONE
0;JMP            // Infinite loop to stop
