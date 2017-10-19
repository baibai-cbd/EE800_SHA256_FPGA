# EE800_SHA256_FPGA

Yuhao Dong  
Instructor: Dov Kruger  

## Progress
* ✓Basic logic functions
* ✓message expansion block
*  main loop


## Module explaination
**sha256_logicfunc_rotaters**  
configurable right shifter and right rotater  
**sha256_logicfunc**  
s0,s1,ch,maj,S0,S1 functions  
**sha256_expansionmessage**  
turn the 512bits into 64*32bits w_file for use  



## Reference Source

SHA256 wikipedia page  
https://en.wikipedia.org/wiki/SHA-2  
A detailed breakdown of the algorithm in pdf  
http://www.iwar.org.uk/comsec/resources/cipher/sha256-384-512.pdf  
An implementation of this kind, I used his idea for the w_file expansion  
http://www.ee.usyd.edu.au/people/philip.leong/UserFiles/File/papers/sha_fpl02.pdf  
An slide about synthesis result(performance differences) of different operators in verilog  
http://web.engr.oregonstate.edu/~traylor/ece474/beamer_lectures/verilog_operators.pdf  
