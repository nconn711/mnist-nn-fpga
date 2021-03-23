module top_level (
	input logic MAX10_CLK1_50,
	input logic [1:0] KEY,
	input logic [9:0] SW,
	output logic [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output logic [9:0] LEDR
);

	logic Clk;
	assign Clk = MAX10_CLK1_50;
	
	logic reset_ah, run_ah;
	logic [7:0] address_a, address_b;
	logic [15:0] q_a, q_b;
	
	assign address_a = SW[7:0];
	
	hex_driver hex_display [5:0] ( {address_a, q_a}, {HEX5, HEX4, HEX3, HEX2, HEX1, HEX0} );
	assign LEDR = 10'b0;
	

	instantiate_ram ram_0	(
										.Reset(reset_ah),
										.Clk(Clk),
										.Address_a(address_a),
										.Address_b(address_b),
										.Q_a(q_a),
										.Q_b(q_b) );
										
										
	sync buttons [1:0] ( Clk, ~KEY, {run_ah, reset_ah} );

endmodule