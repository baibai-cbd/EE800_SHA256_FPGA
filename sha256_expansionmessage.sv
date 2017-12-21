// SHA 256 expansion message blocks
// 
//
//	 @author: Yuhao Dong
//  @date: Oct.4th.2017

module w_file (input clk, Reset,
					input [511: 0] block,
					input init, next,
					output[31:0] w_out);

logic [511: 0] w_data;
logic [31:0] w_new;

assign w_out = w_data[31:0];

always_ff @ (posedge clk, negedge Reset)
begin
	if(~Reset)
	begin
		w_data <= 512'b0;
	end
	else if(init)
	begin
		w_data <= block;
	end
	else if(next)
	begin
		w_data[479:0] <= w_data[511:32];
		w_data[511:480] <= w_new;
	end
end		

operation_logic ol1(.w_2(w_data[479:448]), .w_15(w_data[63:32]), .w_16(w_data[31:0]), .w_7(w_data[319:288]),
						  .w_new);
// questionable
endmodule


module operation_logic (input [31:0] w_2,w_15,w_16,w_7,
							   output[31:0] w_new);
								
logic[31:0] s0_out;
s0 s0_inside(.w_15, .s0_out);			

logic[31:0] s1_out;
s1 s1_instance(.w_2, .s1_out);

assign w_new = s1_out + w_7 + s0_out + w_16;

endmodule


//depreciated
/*
module w_state_machine (input clk, Reset, w_init, w_next,
								output logic init, next);
								
enum logic [3:0] {	RESET, IDLE, DONE,
							LOAD1, LOAD2,
							NEXT1, NEXT2}
							curr_state, next_state;

always_ff @ (posedge clk, negedge Reset) 
	begin
			if (~Reset) 
			begin
				curr_state <= RESET;
			end 
			else 
			begin
				curr_state <= next_state;
			end
	end


// next state declaration
always_comb
	begin
		next_state = curr_state;
		unique case(curr_state)
			RESET: begin
				next_state = IDLE;
			end
			
			IDLE: begin
				if (w_init == 1'b1)
				begin
					next_state = LOAD1;
				end
				else
				if (w_next == 1'b1)
				begin
					next_state = NEXT1;
				end
				else
				begin
					next_state = IDLE;
				end
			end
				
			LOAD1: begin
					next_state = IDLE;
			end
			
			NEXT1: begin
					next_state = IDLE;
			end
		endcase
	end
	
// state behavior
always_comb
	begin
		init = 1'b0;
		next = 1'b0;
		unique case(curr_state)
			RESET: begin
			end
			
			IDLE: begin
			end
			
			LOAD1: begin
					init = 1'b1;
			end
			
			NEXT1: begin
					next = 1'b1;
			end
		endcase
	end

endmodule
*/





