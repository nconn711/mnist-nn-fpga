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
		r[0].altsyncram_component.init_file = "ram_files/MIF/ram_0.mif",
		r[1].altsyncram_component.init_file = "ram_files/MIF/ram_1.mif",
		r[2].altsyncram_component.init_file = "ram_files/MIF/ram_2.mif",
		r[3].altsyncram_component.init_file = "ram_files/MIF/ram_3.mif",
		r[4].altsyncram_component.init_file = "ram_files/MIF/ram_4.mif",
		r[5].altsyncram_component.init_file = "ram_files/MIF/ram_5.mif",
		r[6].altsyncram_component.init_file = "ram_files/MIF/ram_6.mif",
		r[7].altsyncram_component.init_file = "ram_files/MIF/ram_7.mif",
		r[8].altsyncram_component.init_file = "ram_files/MIF/ram_8.mif",
		r[9].altsyncram_component.init_file = "ram_files/MIF/ram_9.mif",
		r[10].altsyncram_component.init_file = "ram_files/MIF/ram_10.mif",
		r[11].altsyncram_component.init_file = "ram_files/MIF/ram_11.mif",
		r[12].altsyncram_component.init_file = "ram_files/MIF/ram_12.mif",
		r[13].altsyncram_component.init_file = "ram_files/MIF/ram_13.mif",
		r[14].altsyncram_component.init_file = "ram_files/MIF/ram_14.mif",
		r[15].altsyncram_component.init_file = "ram_files/MIF/ram_15.mif",
		r[16].altsyncram_component.init_file = "ram_files/MIF/ram_16.mif",
		r[17].altsyncram_component.init_file = "ram_files/MIF/ram_17.mif",
		r[18].altsyncram_component.init_file = "ram_files/MIF/ram_18.mif",
		r[19].altsyncram_component.init_file = "ram_files/MIF/ram_19.mif";

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