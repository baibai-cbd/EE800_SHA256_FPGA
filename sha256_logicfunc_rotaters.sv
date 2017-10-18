// SHA 256 logic functions
//  rotaters
//
//	 @author: Yuhao Dong
//  @date: sep.4th.2017



module rightrotate6(input clk,reset,
						  input  [31:0]x,
						  output logic [31:0]y);
// right rotate 6
parameter DIGITS=6;

	always_ff @ (posedge clk)
		begin
			y[31:(32-DIGITS)] <= x[(DIGITS-1):0];
			y[(31-DIGITS):0] <= x[31:DIGITS];
		end
endmodule
///////////////////////////////////////////////

///////////////////////////////////////////////
module new_rightrotater (input  [31:0]x,
								 output [31:0]y);
parameter DIGITS=6;

assign y = {x[(DIGITS-1):0], x[31:DIGITS]};

endmodule
///////////////////////////////////////////////

///////////////////////////////////////////////
module rightshifter (input  [31:0]x,
							output [31:0]y);
parameter DIGITS=3;

assign y = x >> DIGITS;							
							
endmodule
