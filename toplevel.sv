module toplevel(input clk, Reset, Add, Load,
					 input sw9, sw8, sw7,
					 input [7:0] SW,
					 output logic [6:0] hex1, hex2, hex3, hexC, hexU, hexL,
					 output logic [7:0] leds,
					 //
					 output logic [31:0] w_out,
					 output logic [31:0] k_out,
					 output logic [31:0] mux_out,
					 output logic [6:0] count_decrement,
					 //
					 output logic finished
					 //
					 );
					 
/////////////////////////////////////////////////////////////////////
wire init, next;
w_file w_file_instance(.*);
//w_state_machine w_sm_instance(.*);
/////////////////////////////////////////////////////////////////////
// w_out
logic [511:0] block;
assign block = 512'h00000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061626380;
/////////////////////////////////////////////////////////////////////
logic [31:0] a,b,c,d,e,f,g,h;
wire [6:0] count;
//wire w_init, w_next, m_init, m_next;
//wire init_m, next_m;
//
// k_out
//
wire done;
//
main_loop main_loop_instance(.*, .init, .next, .k_i(k_out), .w_i(w_out));
//main_loop_state_machine mlsm_instance(.*, .init(init_m), .next(next_m));
/////////////////////////////////////////////////////////////////////
wire add_soft;
loop_count_controller lcc_instance(.*, .Add(add_soft));
/////////////////////////////////////////////////////////////////////
hardware_button_state_machine hbsm_instance(.*);
/////////////////////////////////////////////////////////////////////
// mux_out
simplemux sm_instance(.*);
/////////////////////////////////////////////////////////////////////

// count_decrement
assign count_decrement = count - 1;
k_file k_file_instance(.sel(count_decrement), .k_out);
/////////////////////////////////////////////////////////////////////
logic [31:0] dis_out;
simplemux display_mux(.a(k_out), .b(w_out), .c(mux_out), .d({25'b0, count}), .e(32'b0), .f(32'b0), .g(32'b0), .h(32'b0), .sw9(SW[2]), .sw8(SW[1]), .sw7(SW[0]), .mux_out(dis_out));
/////////////////////////////////////////////////////////////////////
assign leds = dis_out[31:24];
//
HexDriver Hex1(.In0(dis_out[23:20]),
                .Out0(hex1));

HexDriver Hex2(.In0(dis_out[19:16]),
                .Out0(hex2));
//
HexDriver Hex3(.In0(dis_out[15:12]),
                .Out0(hex3));

HexDriver HexA(.In0(dis_out[11:8]),
                .Out0(hexC));

HexDriver HexB(.In0(dis_out[7:4]),
                .Out0(hexU));

HexDriver HexC(.In0(dis_out[3:0]),
                .Out0(hexL));
			 
/////////////////////////////////////////////////////////////////////////////////////
//logicmux test_logic_mux(.*);
//
logic [31:0] h0,h1,h2,h3,h4,h5,h6,h7;
assign h0 = 32'h6a09e667;
assign h1 = 32'hbb67ae85;
assign h2 = 32'h3c6ef372;
assign h3 = 32'ha54ff53a;
assign h4 = 32'h510e527f;
assign h5 = 32'h9b05688c;
assign h6 = 32'h1f83d9ab;
assign h7 = 32'h5be0cd19;

//h0 := 0x6a09e667
//h1 := 0xbb67ae85
//h2 := 0x3c6ef372
//h3 := 0xa54ff53a
//h4 := 0x510e527f
//h5 := 0x9b05688c
//h6 := 0x1f83d9ab
//h7 := 0x5be0cd19
///////////////////////////////////////////////////////////////////////////////////////
//logic [1:0] to_sw_sig, to_hw_sig;
//logic [31:0] to_sw_port, msg;
//logic io_ready;
//io_module new_io_module(.clk(clk), .reset_n(Reset), .to_sw_sig, .to_hw_sig, .to_sw_port, .msg, .io_ready);
/////////////////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////////////////
//logic [7:0] useless_led;
////
//    DE1_SoC_QSYS u0 (
//        .clk_clk                               (clk),                               //                            clk.clk
//        .key_external_connection_export        (4'b0000),        //        key_external_connection.export
//        .reset_reset_n                           (Reset),
//		  .clk_sdram_clk						        (DRAM_CLK),           //                          reset.reset_n
//        .sdram_wire_addr          (DRAM_ADDR),          //        sdram_controller_0_wire.addr
//        .sdram_wire_ba            (DRAM_BA),            //                               .ba
//        .sdram_wire_cas_n         (DRAM_CAS_N),         //                               .cas_n
//        .sdram_wire_cke           (DRAM_CKE),           //                               .cke
//        .sdram_wire_cs_n          (DRAM_CS_N),          //                               .cs_n
//        .sdram_wire_dq            (DRAM_DQ),            //                               .dq
//        .sdram_wire_dqm           (DRAM_DQM),           //                               .dqm
//        .sdram_wire_ras_n         (DRAM_RAS_N),         //                               .ras_n
//        .sdram_wire_we_n          (DRAM_WE_N),          //                               .we_n
//        .to_hw_sig_external_connection_export  (to_hw_sig),  //  to_hw_sig_external_connection.export
//        .to_sw_port_external_connection_export (to_sw_port), // to_sw_port_external_connection.export
//        .to_sw_sig_external_connection_export  (to_sw_sig)   //  to_sw_sig_external_connection.export
//    );

//



endmodule























