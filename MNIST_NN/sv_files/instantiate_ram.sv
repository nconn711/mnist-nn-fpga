module ram_weights_biases (
	input logic Clk, Reset,
	input logic [9:0] Address [19:0],
	output logic [15:0] Q [19:0]
);


	ram r [19:0] (
						.address(Address),
						.clock(Clk),
						.data({20{16'b0}}),
						.wren({20{1'b0}}),
						.q(Q) );
	defparam
		r[0].altsyncram_component.init_file = "HEX/ram_0.hex",
		r[1].altsyncram_component.init_file = "HEX/ram_1.hex",
		r[2].altsyncram_component.init_file = "HEX/ram_2.hex",
		r[3].altsyncram_component.init_file = "HEX/ram_3.hex",
		r[4].altsyncram_component.init_file = "HEX/ram_4.hex",
		r[5].altsyncram_component.init_file = "HEX/ram_5.hex",
		r[6].altsyncram_component.init_file = "HEX/ram_6.hex",
		r[7].altsyncram_component.init_file = "HEX/ram_7.hex",
		r[8].altsyncram_component.init_file = "HEX/ram_8.hex",
		r[9].altsyncram_component.init_file = "HEX/ram_9.hex",
		r[10].altsyncram_component.init_file = "HEX/ram_10.hex",
		r[11].altsyncram_component.init_file = "HEX/ram_11.hex",
		r[12].altsyncram_component.init_file = "HEX/ram_12.hex",
		r[13].altsyncram_component.init_file = "HEX/ram_13.hex",
		r[14].altsyncram_component.init_file = "HEX/ram_14.hex",
		r[15].altsyncram_component.init_file = "HEX/ram_15.hex",
		r[16].altsyncram_component.init_file = "HEX/ram_16.hex",
		r[17].altsyncram_component.init_file = "HEX/ram_17.hex",
		r[18].altsyncram_component.init_file = "HEX/ram_18.hex",
		r[19].altsyncram_component.init_file = "HEX/ram_19.hex";

endmodule

module ram_input_output (
	input logic Clk, Reset, Wren,
	input logic [9:0] Address,
	input logic [15:0] D,
	output logic [15:0] Q
);


	ram r (
				.address(Address),
				.clock(Clk),
				.data(D),
				.wren(Wren),
				.q(Q) );
				
endmodule