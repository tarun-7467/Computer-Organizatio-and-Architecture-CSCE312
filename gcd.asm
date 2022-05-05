//Tarun Arumugam 530001455

// File name: gcd.asm

// This program calculates the greatest common divisor (gcd) of two given 
// non-negative integers, which are stored in RAM[0] (R0) and RAM[1] (R1). 
// The gcd is stored in RAM[2] (R2).

// Put your code below this line

@R0 
D = M       
@a 
M = D    

@R1 
D = M       
@b 
M = D

@0 
D = A

@x
M = D 

@0 
D = A 

@temp
M = D 

@a
D = M

@check1
D;JEQ

@proceed
0;JMP
(check1)
    @b
    D = M
    @R2
    M = D
    @end
    0;JMP

(proceed)
    @b
    D = M
    @check2
    D;JEQ
    @proceed1
    0;JMP
    (check2)
        @a
        D = M
        @R2
        M = D
        @end
        0;JMP

(proceed1)
(loop)
    (loop2)
        @a
        D = M       
        @b
        D = D - M   
        @carry
        D;JLT 
        @end 
        D;JLT       
        @zero 
        D;JEQ       
        @temp
        M = M + 1   
        @b
        D = M        
        @a
        M = M - D    
        @loop2     
        0;JMP
    (zero)
        @temp
        M = M + 1   
    (carry)
        @b
        D = D + M
        @x
        M = D
        @R2
        M = D
        @b
        D = M
        @a
        M = D
        @x
        D = M
        @b
        M = D   
        @x
        D = M
        @loop
        D; JGT
(end)
    @end
    0;JMP 
