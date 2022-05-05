//Tarun Arumugam 530001455

// File name: calc.asm

// The program develops a calculator application. 
// The operands a and b are integer numbers stored in RAM[0] (R0) and RAM[1] (R1), respectively.
// The operation choice c is stored in RAM[2] (R2), respectively
// if c == 1, do a + b
// if c == 2, do a - b
// if c == 3, do a * b
// if c == 4, do a / b
// For Addition and Subtraction operations the operands a and b can be positive or negative.
// For Multiplication operation only ONE operand can be negative.
// For Division operation BOTH operands must be positive and must be greater than 0.
// Store the final result (quotient for Division) in RAM[3] (R3). Only the Division operation 
// stores the remainder in RAM[4] (R4).


// Put your code below this line

@R2
D=M-1
@add
D ; JEQ

D=D-1
@subtract
D ; JEQ

D=D-1
@multiply
D ; JEQ

D=D-1
@divide
D ; JEQ

(add)
    @R1
    D=M
    @R0
    D=D+M

    @R3
    M=D

    @END
    0 ; JMP

(subtract)
    @R1
    D=M
    @R0
    D=M-D

    @R3
    M=D

    @END
    0 ; JMP

(multiply)
    @R6
    M=0
    @R1
    D=M

    @positiveB
    D ; JGE

    (negativeB)
        @R0
        D=M
        @storePositiveA
        D ; JGE
    
    (badInput)
        @1024
        M=0
        M=M-1
        @END
        0 ; JMP

    (storePositiveA)
        @R0
        D=M
        @R5
        M=D

        @R1
        D=M
        @R6
        M=D
        @goodInput
        0; JMP

    (positiveB)
        @R1
        D=M
        @R5
        M=D

        @R0
        D=M
        @R6
        M=D

    (goodInput)
        @ANS
        M=0
        @R5
        D=M
        @count
        M=D
        (loopMult)
            @count
            D=M
            @storeANS
            D ; JEQ

            @count
            M=M-1

            @R6
            D=M

            @ANS
            M=M+D

            @loopMult
            0 ; JMP

    (storeANS)
        @ANS
        D=M

        @R3
        M=D
    
    @END
    0 ; JMP

(divide)
    @R1
    D=M

    @goodInput
    D ; JGT

    (badInput)
        @1024
        M=0
        M=M-1
        @END
        0 ; JMP

    (goodInput)
        @R0
        D=M

        @badInput
        D ; JLE

        @count
        M=0

        @R0
        D=M
        @rem
        M=D

        @R1
        D = M
        @rem
        D = D - M

        @storeDivRem
        D ; JGT
        
        (loopDiv)
            @R1
            D=M
            @rem
            M=M-D

            @count
            M=M+1
            
            @R1
            D = M
            @rem
            D = D - M

            @storeDivRem
            D ; JGT

            @loopDiv
            0 ; JMP

    (storeDivRem)
        @count
        D = M

        @R3
        M = D

        @rem
        D = M

        @R4
        M = D


(END)
    @END
    0 ; JMP