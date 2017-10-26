# EE800_SHA256_FPGA

Yuhao Dong  
Instructor: Dov Kruger  

## Progress
* ✓Basic logic functions
* ✓message expansion block
*  main loop  
Partially done, in step by step push button way for debugging purpose, need change to automatic completion  
*  hardware software communication(big issue)

## Module explaination
**sha256_logicfunc_rotaters**  
configurable right shifter and right rotater  
**sha256_logicfunc**  
s0,s1,ch,maj,S0,S1 functions  
**sha256_expansionmessage**  
turn the 512bits into 64*32bits w_file for use  
**k_file**  
the k constants used in main loop combinational logic  
**main_loop**  
the main iteration loop along with its state machine  




## Reference Source

SHA256 wikipedia page  
https://en.wikipedia.org/wiki/SHA-2  
A detailed breakdown of the algorithm in pdf  
http://www.iwar.org.uk/comsec/resources/cipher/sha256-384-512.pdf  
An implementation of this kind, I used his idea for the w_file expansion  
http://www.ee.usyd.edu.au/people/philip.leong/UserFiles/File/papers/sha_fpl02.pdf  
An slide about synthesis result(performance differences) of different operators in verilog  
http://web.engr.oregonstate.edu/~traylor/ece474/beamer_lectures/verilog_operators.pdf  
About how to use arrays in verilog  
http://www.verilogpro.com/verilog-arrays-plain-simple/  
Q&A about proper way to initialize registers in verilog  
https://electronics.stackexchange.com/questions/226959/is-it-right-to-initialize-a-reg-in-verilog-and-apply-condition-with-initial-valu  
---
Verilog HDL basics  
https://cseweb.ucsd.edu/classes/sp11/cse141L/pdf/01/SV_Part_1.pdf  
https://cseweb.ucsd.edu/classes/sp11/cse141L/pdf/02/02-Verilog2a.pdf  
