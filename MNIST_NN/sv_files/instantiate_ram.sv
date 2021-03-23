module instantiate_ram (
	input logic Reset,
	input logic Clk,
	input logic [7:0] Address_a, Address_b,
	output logic [15:0] Q_a, Q_b
);


ram_4k (
			.address_a(Address_a),
			.address_b(Address_b),
			.clock(Clk),
			.data_a(16'b0),
			.data_b(16'b0),
			.wren_a(1'b0),
			.wren_b(1'b0),
			.q_a(Q_a),
			.q_b(Q_b) );

endmodule