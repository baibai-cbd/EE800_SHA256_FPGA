// SHA 256 logic functions
//  s0, s1, ch, maj
//	 S0, S1
//	 @author: Yuhao Dong
//


module s0 (input  [31:0] w_15,
			  output [31:0] s0_out);

logic [31:0] w_15_7,w_15_18,w_15_s3;

assign s0_out = w_15_7^w_15_18^w_15_s3;

new_rightrotater #(7) rot7(.x(w_15), .y(w_15_7));
new_rightrotater #(18) rot18(.x(w_15), .y(w_15_18));
rightshifter #(3) rsft3(.x(w_15), .y(w_15_s3));
			  
endmodule
/////////////////////////////////////

/////////////////////////////////////
module s1 (input  [31:0] w_2,
			  output [31:0] s1_out);

logic [31:0] w_2_17,w_2_19,w_2_s10;

assign s1_out = w_2_17^w_2_19^w_2_s10;

new_rightrotater #(17) rot17(.x(w_2), .y(w_2_17));
new_rightrotater #(19) rot19(.x(w_2), .y(w_2_19));
rightshifter #(10) rsft10(.x(w_2), .y(w_2_s10));

endmodule



module ch (input [31:0] e,f,g,
			  output[31:0] ch_out);

assign ch_out = (e&f)^((~e)&g);		  

endmodule
//////////////////////////////////////



module maj (input [31:0] a,b,c,
			  output[31:0] maj_out);

assign maj_out = (a&b)^(a&c)^(b&c);		  

endmodule
///////////////////////////////////////


module S0 (input [31:0] a,
			  output[31:0] S0_out);

logic [31:0] a_2,a_13,a_22;

assign S0_out = a_2^a_13^a_22;		  

new_rightrotater #(2) rot2(.x(a), .y(a_2));
new_rightrotater #(13) rot13(.x(a), .y(a_13));
new_rightrotater #(22) rot22(.x(a), .y(a_22));

endmodule
///////////////////////////////////////


module S1 (input [31:0] e,
			  output[31:0] S1_out);

logic [31:0] e_6,e_11,e_25;

assign S1_out = e_6^e_11^e_25;		  

new_rightrotater #(6) rot6(.x(e), .y(e_6));
new_rightrotater #(11) rot11(.x(e), .y(e_11));
new_rightrotater #(25) rot25(.x(e), .y(e_25));

endmodule


module T1 (input [31:0] h, S1_out, ch_out, k_i, w_i,
			  output[31:0] T1_out);

endmodule


module T2 (input [31:0] S0_out, maj_out,
			  output[31:0] T2_out);

endmodule


















