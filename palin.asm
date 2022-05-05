//Tarun Arumugam 530001455

// File name: palin.asm

// The program develops a Palindrome checker application. 
// The input to the program is a 5 digit integer A and is stored in RAM[0] (R0).
// A helper value of 10 is stored in RAM[8] (R8) by virtue of the tst file command.
// Number A is a positive integer.
// A has exactly 5 digits and no more no less.

// Program functions as follows: 
// Extract the individual digits from number A and store them in R2-R6 registers in that order.
// Result of 1 is stored in R1 if the number A is a Palindrome else result of 0 is stored in R1

// Put your code below this line

@5
D=A
@count
M=D

(LOOP)
    @count
    D=M
    @PALINCHECK
    D ; JEQ

    (mod)
        @R0
        D=M
        @rem
        M=D
        (LOOPmod)
            @R8
            D=M
            @rem
            D=D-M
            @SAVE
            D ; JGT

            @R8
            D=M
            @rem
            M=M-D

            @LOOPmod
            0 ; JMP

            (SAVE)
                @count
                D=M
                @5
                D=D-A
                @saveR2
                D ; JEQ

                @count
                D=M
                @4
                D=D-A
                @saveR3
                D ; JEQ

                @count
                D=M
                @3
                D=D-A
                @saveR4
                D ; JEQ

                @count
                D=M
                @2
                D=D-A
                @saveR5
                D ; JEQ

                @count
                D=M
                @1
                D=D-A
                @saveR6
                D ; JEQ

                (saveR2)
                    @rem
                    D=M
                    @R2
                    M=D
                    @DECDIV
                    0 ; JMP

                (saveR3)
                    @rem
                    D=M
                    @R3
                    M=D
                    @DECDIV
                    0 ; JMP

                (saveR4)
                    @rem
                    D=M
                    @R4
                    M=D
                    @DECDIV
                    0 ; JMP

                (saveR5)
                    @rem
                    D=M
                    @R5
                    M=D
                    @DECDIV
                    0 ; JMP

                (saveR6)
                    @rem
                    D=M
                    @R6
                    M=D
                    @DECDIV
                    0 ; JMP

    (DECDIV)
        @count
        M=M-1

        @R0
        D=M
        @rem
        M=D 
        @countDECDIV
        M=0
        (LOOPdecdiv)
            @R8
            D=M
            @rem
            D=D-M
            @SAVEdecdiv
            D ; JGT

            @R8
            D=M
            @rem
            M=M-D

            @countDECDIV
            M=M+1

            @LOOPdecdiv
            0 ; JMP

        (SAVEdecdiv)
            @countDECDIV
            D=M
            @R0
            M=D
            @LOOP
            0 ; JMP

(PALINCHECK)
    (check1)
        @R2
        D=M
        @R6
        D=D-M
        @failed
        D ; JNE
    (check2)
        @R3
        D=M
        @R5
        D=D-M
        @failed
        D ; JNE

    @R1
    M=1
    @END
    0 ; JMP
    
    (failed)
        @R1
        M=0

(END)
    @END
    0 ; JMP