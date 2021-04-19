module top_level (
	input logic MAX10_CLK1_50,
	input logic [1:0] KEY,
	input logic [9:0] SW,
	output logic [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output logic [9:0] LEDR
);

	logic Clk;
	assign Clk = MAX10_CLK1_50;
	logic reset_ah, press_ah;
	
	logic [15:0] probability [9:0];
	logic [15:0] display;
	
	assign display = probability[SW];
	
	
	hex_driver hex_display [5:0] ( {8'b0, display}, {HEX5, HEX4, HEX3, HEX2, HEX1, HEX0} );
	assign LEDR = 10'b0;
	

	neural_network nn	(
								.Clk(Clk),
								.Reset(reset_ah),
								.Compute(press_ah),
								.R(),
								.Probability(probability) );
										
										
	sync buttons [1:0] ( Clk, ~KEY, {press_ah, reset_ah} );

endmodule