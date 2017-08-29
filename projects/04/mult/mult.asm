// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@0  
D=M  //RAM[0] to D register 
@2  
M=0 //RAM[2] = 0
(LOOP)  
@1  
D=M  //RAM[1] to D register
@END  
D;JEQ  // RAM[1] > 0
  
@1  
M=M-1  // RAM[1]--
  
@0  
D=M  
@2  
M=M+D //RAM[2] = RAM[2] + RAM[0]  
  
@1  
D=M  // RAM[1] to D register
@LOOP  
D;JGT  
  
@END  
(END)  
0;JMP 