// main_loop
//
// the 64 iteration loop that integrates k_file, w_file and a~h registers
//
//	 @author: Yuhao Dong
//


module main_loop (input clk, Reset,
						input init, next,
						input [31:0] h0,h1,h2,h3,h4,h5,h6,h7,
						input [31:0] k_i, w_i,
						output[31:0] a,b,c,d,e,f,g,h);
						
logic [31:0] T1,T2;

always_ff @ (posedge clk, negedge Reset)
begin
	if(~Reset)
	begin
		a <= 32'b0;
		b <= 32'b0;
		c <= 32'b0;
		d <= 32'b0;
		e <= 32'b0;
		f <= 32'b0;
		g <= 32'b0;
		h <= 32'b0;
	end
	else if(init)
	begin
		a <= h0;
		b <= h1;
		c <= h2;
		d <= h3;
		e <= h4;
		f <= h5;
		g <= h6;
		h <= h7;
	end
	else if(next)
	begin
		a <= a_next;
		b <= a;
		c <= b;
		d <= c;
		e <= e_next;
		f <= e;
		g <= f;
		h <= g;
	end
end
/////////////////////////////////////////
// ch
logic[31:0] ch_out;
ch ch_instance(.e, .f, .g, .ch_out);

// maj
logic[31:0] maj_out;
maj maj_instance(.a, .b, .c, .maj_out);

// S0
logic[31:0] S0_out;
S0 S0_instance(.a, .S0_out);

// S1
logic[31:0] S1_out;
S1 S1_instance(.e, .S1_out);

assign T1 = h + S1_out + ch_out + k_i + w_i;
assign T2 = S0_out + maj_out;
logic[31:0] a_next, e_next;
assign a_next = T1 + T2;
assign e_next = d + T1;
	
endmodule
//////////////////////////////////////////////////
//////////////////////////////////////////////////
module main_loop_state_machine (input clk, Reset, m_init, m_next,
								output init, next);
								
enum logic [1:0] {RESET, IDLE, LOAD, NEXT}
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
				if (m_init == 1'b1)
				begin
					next_state = LOAD;
				end
				else
				if (m_next == 1'b1)
				begin
					next_state = NEXT;
				end
				else
				begin
					next_state = IDLE;
				end
			end
				
			LOAD: begin
				next_state = IDLE;
			end
			
			NEXT: begin
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
			
			LOAD: begin
					init = 1'b1;
			end
			
			NEXT: begin
					next = 1'b1;
			end
		endcase
	end

endmodule


///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
module loop_count_controller (input clk, Reset, Add, Load,
										output w_init, w_next, m_init, m_next,
										output [6:0] count);

enum logic [3:0] {RESET, IDLE, LOAD1, LOAD2, NEXT1, NEXT2}
							curr_state, next_state;							

logic [6:0] count_next;
//
always_ff @ (posedge clk, negedge Reset) 
	begin
			if (~Reset) 
			begin
				curr_state <= RESET;
				count <= 7'b0;
			end 
			else 
			begin
				curr_state <= next_state;
				count <= count_next;
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
				if (Load == 1'b0)
				begin
					next_state = LOAD1;
				end
				else
				if (Add == 1'b0)
				begin
					next_state = NEXT1;
				end
				else
				begin
					next_state = IDLE;
				end
			end
				
			LOAD1: begin
				if (Load == 1'b1)
					next_state = LOAD2;
				else
					next_state = LOAD1;
			end
			
			LOAD2: begin
					next_state = IDLE;
			end
			
			NEXT1: begin
				if (Add == 1'b1)
					next_state = NEXT2;
				else
					next_state = NEXT1;
			end
			
			NEXT2: begin
					next_state = IDLE;
			end
		endcase
	end
	
// state behavior
always_comb
	begin
		w_init = 1'b0;
		w_next = 1'b0;
		m_init = 1'b0;
		m_next = 1'b0;
		count_next = count;
		unique case(curr_state)
			RESET: begin
			end
			
			IDLE: begin
			end
			
			LOAD1: begin
			end
			
			LOAD2: begin
					w_init = 1'b1;
					m_init = 1'b1;
			end
			
			NEXT1: begin
			end
			
			NEXT2: begin
					w_next = 1'b1;
					m_next = 1'b1;
					count_next = count + 1;
			end
			
		endcase
	end

endmodule

