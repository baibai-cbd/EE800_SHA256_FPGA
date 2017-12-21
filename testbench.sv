module testbench();

timeunit 10ns;

timeprecision 1ns;

logic sw9=0;
logic sw8=0;
logic sw7=0;
logic [7:0] SW=0;
logic [6:0] hex1, hex2, hex3, hexC, hexU, hexL;
logic [7:0] leds;
//
logic clk=0;
logic Reset, Add, Load;
logic [31:0] w_out;
logic [31:0] k_out;
logic [31:0] mux_out;
logic [6:0] count_decrement;
logic finished;

toplevel toplevel0(.*);

always begin: CLOCK_GENERATION
	#1 clk = ~clk;
end

//
//
//
initial begin:	TEST_VECTORS
Reset = 1; // active low
Add = 1;
Load = 1;
//
//

#2 Load=0;
#2 Load=1;
//
#2.5 Add=0;
#1 Add=1;

//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;
//
//#1 Add=0;
//#1 Add=1;

end









endmodule
