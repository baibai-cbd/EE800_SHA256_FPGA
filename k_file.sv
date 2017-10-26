// k file
//
// 64 k seed values
//	 @author: Yuhao Dong
//


module k_file (input [6:0] sel,
					output[31:0] k_out);

logic [31:0] k_value[63:0];

assign k_value[0] = 32'h428a2f98;
assign k_value[1] = 32'h71374491;
assign k_value[2] = 32'hb5c0fbcf;
assign k_value[3] = 32'he9b5dba5;
assign k_value[4] = 32'h3956c25b;
assign k_value[5] = 32'h59f111f1;
assign k_value[6] = 32'h923f82a4;
assign k_value[7] = 32'hab1c5ed5;
assign k_value[8] = 32'hd807aa98;
assign k_value[9] = 32'h12835b01;
assign k_value[10] = 32'h243185be;
assign k_value[11] = 32'h550c7dc3;
assign k_value[12] = 32'h72be5d74;
assign k_value[13] = 32'h80deb1fe;
assign k_value[14] = 32'h9bdc06a7;
assign k_value[15] = 32'hc19bf174;
assign k_value[16] = 32'he49b69c1;
assign k_value[17] = 32'hefbe4786;
assign k_value[18] = 32'h0fc19dc6;
assign k_value[19] = 32'h240ca1cc;
assign k_value[20] = 32'h2de92c6f;
assign k_value[21] = 32'h4a7484aa;
assign k_value[22] = 32'h5cb0a9dc;
assign k_value[23] = 32'h76f988da;
assign k_value[24] = 32'h983e5152;
assign k_value[25] = 32'ha831c66d;
assign k_value[26] = 32'hb00327c8;
assign k_value[27] = 32'hbf597fc7;
assign k_value[28] = 32'hc6e00bf3;
assign k_value[29] = 32'hd5a79147;
assign k_value[30] = 32'h06ca6351;
assign k_value[31] = 32'h14292967;
assign k_value[32] = 32'h27b70a85;
assign k_value[33] = 32'h2e1b2138;
assign k_value[34] = 32'h4d2c6dfc;
assign k_value[35] = 32'h53380d13;
assign k_value[36] = 32'h650a7354;
assign k_value[37] = 32'h766a0abb;
assign k_value[38] = 32'h81c2c92e;
assign k_value[39] = 32'h92722c85;
assign k_value[40] = 32'ha2bfe8a1;
assign k_value[41] = 32'ha81a664b;
assign k_value[42] = 32'hc24b8b70;
assign k_value[43] = 32'hc76c51a3;
assign k_value[44] = 32'hd192e819;
assign k_value[45] = 32'hd6990624;
assign k_value[46] = 32'hf40e3585;
assign k_value[47] = 32'h106aa070;
assign k_value[48] = 32'h19a4c116;
assign k_value[49] = 32'h1e376c08;
assign k_value[50] = 32'h2748774c;
assign k_value[51] = 32'h34b0bcb5;
assign k_value[52] = 32'h391c0cb3;
assign k_value[53] = 32'h4ed8aa4a;
assign k_value[54] = 32'h5b9cca4f;
assign k_value[55] = 32'h682e6ff3;
assign k_value[56] = 32'h748f82ee;
assign k_value[57] = 32'h78a5636f;
assign k_value[58] = 32'h84c87814;
assign k_value[59] = 32'h8cc70208;
assign k_value[60] = 32'h90befffa;
assign k_value[61] = 32'ha4506ceb;
assign k_value[62] = 32'hbef9a3f7;
assign k_value[63] = 32'hc67178f2;
					
					
always @(sel)
begin
	k_out = k_value[sel];
	
	if(sel==7'b1111111)
	begin
		k_out = 32'b0;
	end
end					

endmodule


//k[0..63] :=
//   32'h428a2f98, 32'h71374491, 32'hb5c0fbcf, 32'he9b5dba5, 32'h3956c25b, 32'h59f111f1, 32'h923f82a4, 32'hab1c5ed5,
//   32'hd807aa98, 32'h12835b01, 32'h243185be, 32'h550c7dc3, 32'h72be5d74, 32'h80deb1fe, 32'h9bdc06a7, 32'hc19bf174,
//   32'he49b69c1, 32'hefbe4786, 32'h0fc19dc6, 32'h240ca1cc, 32'h2de92c6f, 32'h4a7484aa, 32'h5cb0a9dc, 32'h76f988da,
//   32'h983e5152, 32'ha831c66d, 32'hb00327c8, 32'hbf597fc7, 32'hc6e00bf3, 32'hd5a79147, 32'h06ca6351, 32'h14292967,
//   32'h27b70a85, 32'h2e1b2138, 32'h4d2c6dfc, 32'h53380d13, 32'h650a7354, 32'h766a0abb, 32'h81c2c92e, 32'h92722c85,
//   32'ha2bfe8a1, 32'ha81a664b, 32'hc24b8b70, 32'hc76c51a3, 32'hd192e819, 32'hd6990624, 32'hf40e3585, 32'h106aa070,
//   32'h19a4c116, 32'h1e376c08, 32'h2748774c, 32'h34b0bcb5, 32'h391c0cb3, 32'h4ed8aa4a, 32'h5b9cca4f, 32'h682e6ff3,
//   32'h748f82ee, 32'h78a5636f, 32'h84c87814, 32'h8cc70208, 32'h90befffa, 32'ha4506ceb, 32'hbef9a3f7, 32'hc67178f2