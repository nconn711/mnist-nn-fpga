// module ram_weights_biases (
// 	input logic Clk, Reset,
// 	input logic [9:0] Address [19:0],
// 	output logic [15:0] Q [19:0]
// );


// 	ram r [19:0] (
// 						.address(Address),
// 						.clock(Clk),
// 						.data({20{16'b0}}),
// 						.wren({20{1'b0}}),
// 						.q(Q) );
// 	defparam
// 		r[0].FILE_NAME = "HEX/ram_0.hex",
// 		r[1].FILE_NAME = "HEX/ram_1.hex",
// 		r[2].FILE_NAME = "HEX/ram_2.hex",
// 		r[3].FILE_NAME = "HEX/ram_3.hex",
// 		r[4].FILE_NAME = "HEX/ram_4.hex",
// 		r[5].FILE_NAME = "HEX/ram_5.hex",
// 		r[6].FILE_NAME = "HEX/ram_6.hex",
// 		r[7].FILE_NAME = "HEX/ram_7.hex",
// 		r[8].FILE_NAME = "HEX/ram_8.hex",
// 		r[9].FILE_NAME = "HEX/ram_9.hex",
// 		r[10].FILE_NAME = "HEX/ram_10.hex",
// 		r[11].FILE_NAME = "HEX/ram_11.hex",
// 		r[12].FILE_NAME = "HEX/ram_12.hex",
// 		r[13].FILE_NAME = "HEX/ram_13.hex",
// 		r[14].FILE_NAME = "HEX/ram_14.hex",
// 		r[15].FILE_NAME = "HEX/ram_15.hex",
// 		r[16].FILE_NAME = "HEX/ram_16.hex",
// 		r[17].FILE_NAME = "HEX/ram_17.hex",
// 		r[18].FILE_NAME = "HEX/ram_18.hex",
// 		r[19].FILE_NAME = "HEX/ram_19.hex";

// endmodule

module ram_weights_biases (
	input logic Clk, Reset,
	input logic [9:0] Address [19:0],
	output logic [15:0] Q [19:0]
);


	ram r [19:0] (
						.a(Address),
						.clk(Clk),
						.d({20{16'b0}}),
						.we({20{1'b0}}),
						.q(Q) );
	defparam
		r[0].FILE_NAME = "HEX/ram_0.hex",
		r[1].FILE_NAME = "HEX/ram_1.hex",
		r[2].FILE_NAME = "HEX/ram_2.hex",
		r[3].FILE_NAME = "HEX/ram_3.hex",
		r[4].FILE_NAME = "HEX/ram_4.hex",
		r[5].FILE_NAME = "HEX/ram_5.hex",
		r[6].FILE_NAME = "HEX/ram_6.hex",
		r[7].FILE_NAME = "HEX/ram_7.hex",
		r[8].FILE_NAME = "HEX/ram_8.hex",
		r[9].FILE_NAME = "HEX/ram_9.hex",
		r[10].FILE_NAME = "HEX/ram_10.hex",
		r[11].FILE_NAME = "HEX/ram_11.hex",
		r[12].FILE_NAME = "HEX/ram_12.hex",
		r[13].FILE_NAME = "HEX/ram_13.hex",
		r[14].FILE_NAME = "HEX/ram_14.hex",
		r[15].FILE_NAME = "HEX/ram_15.hex",
		r[16].FILE_NAME = "HEX/ram_16.hex",
		r[17].FILE_NAME = "HEX/ram_17.hex",
		r[18].FILE_NAME = "HEX/ram_18.hex",
		r[19].FILE_NAME = "HEX/ram_19.hex";

endmodule

// module ram_input_output (
// 	input logic Clk, Reset,
// 	input logic [9:0] Address,
// 	output logic [15:0] Q
// );


// 	ram r (
// 				.address(Address),
// 				.clock(Clk),
// 				.data(16'b0),
// 				.wren(1'b0),
// 				.q(Q) );
// 	defparam
// 		r.FILE_NAME = "HEX/ram_IO.hex";
				
// endmodule

module ram_input_output (
	input logic Clk, Reset,
	input logic [9:0] Address,
	output logic [15:0] Q
);


	ram r (
				.a(Address),
				.clk(Clk),
				.d(16'b0),
				.we(1'b0),
				.q(Q) );
	defparam
		r.FILE_NAME = "HEX/ram_IO.hex";
				
endmodule

// module sdram_sigmoid (
// 	input logic Clk, Reset,
// 	input logic [15:0] Address,
// 	output logic [15:0] Q
// );


// 	sdram r (
// 				.address(Address),
// 				.clock(Clk),
// 				.data(16'b0),
// 				.wren(1'b0),
// 				.q(Q) );
// 	defparam
// 		r.FILE_NAME = "HEX/ram_sigmoid.hex";
				
// endmodule

module sdram_sigmoid (
	input logic Clk, Reset,
	input logic [15:0] Address,
	output logic [15:0] Q
);


	sdram r (
				.a(Address),
				.clk(Clk),
				.d(16'b0),
				.we(1'b0),
				.q(Q) );
	defparam
		r.FILE_NAME = "HEX/ram_sigmoid.hex";
				
endmodule