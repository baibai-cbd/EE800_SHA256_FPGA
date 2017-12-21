module simplemux (input [31:0] a,b,c,d,e,f,g,h,
						input sw9,sw8,sw7,
						output logic [31:0] mux_out);
						
always_comb
	begin
		unique case({sw9,sw8,sw7})
			3'b000:
			begin
				mux_out = a;
			end
			
			3'b001:
			begin
				mux_out = b;
			end
			
			3'b010:
			begin
				mux_out = c;
			end
			
			3'b011:
			begin
				mux_out = d;
			end
			
			3'b100:
			begin
				mux_out = e;
			end
			
			3'b101:
			begin
				mux_out = f;
			end
			
			3'b110:
			begin
				mux_out = g;
			end
			
			3'b111:
			begin
				mux_out = h;
			end
			
			default:
			begin
				mux_out = 32'b0;
			end
		endcase
	end
endmodule
