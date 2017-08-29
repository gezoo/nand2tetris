// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(BEGIN)  
  
@KBD  
D = M  
@CLEAN  
D;JEQ  
  
@SCREEN          //涂黑   
D = A  
@Bcount  
A = M + D  
M = -1  
  
@Bcount          //键盘按下  
M = M + 1  
D = M  
@8192            //8K  
D = D - A  
@Bcount  
M = D  
@END  
D;JGE  
@8192  
D = D + A  
@Bcount  
M = D  
@END  
0;JMP  
  
(CLEAN)          //无键盘按下   
  
@SCREEN          //涂白   
D = A  
@Wcount  
A = M + D  
M = 0  
  
@Wcount          //键盘按下  
M = M + 1  
D = M  
@8192            //8K  
D = D - A  
@Wcount  
M = D  
@END  
D;JGE  
@8192  
D = D + A  
@Wcount  
M = D  
  
(END)  
@BEGIN  
0;JMP  