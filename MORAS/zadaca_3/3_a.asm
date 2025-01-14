// R0: Start of the range
// R1: End of the range
// R2: Sum result

@0
D=M              // Load R0 into D
@1
D=D-M            // D = R0 - R1
@SWAP
D;JGT            // If R0 > R1, jump to SWAP

// Initialize sum
@2
M=0              // R2 = 0

@LOOP
@0
D=M              // D = R0
@2
M=M+D            // R2 = R2 + R0
@0
M=M+1            // R0 = R0 + 1
@1
D=M              // D = R1
@0
D=D-M            // D = R1 - R0
@END
D;JLT            // If R0 > R1, end loop
@LOOP
0;JMP            // Otherwise, repeat the loop

(SWAP)
@0
D=M              // D = R0
@3
M=D              // Temp (R3) = R0
@1
D=M              // D = R1
@0
M=D              // R0 = R1
@3
D=M              // D = Temp (R3)
@1
M=D              // R1 = Temp (R3)
@LOOP
0;JMP            // Start summing after swap

(END)
@END
0;JMP            // Infinite loop to stop
