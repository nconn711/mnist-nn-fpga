`include "CONSTANTS.sv"
import BRAM_ADDRS::*;

module neural_network (
	input logic Clk, Reset, Compute,
	output logic R,
	output logic [15:0] Probability [9:0]
);

	logic wren;
	logic [9:0] address_r0, address_r1;
	logic [15:0] data [19:0];
	logic [15:0] data_in;
	
	logic [15:0] x;
	logic [15:0] w [19:0];
	logic [15:0] z_784_20 [19:0];
	logic [15:0] z_20_20 [19:0];
	logic [15:0] z_20_10 [9:0];
	
	logic [2:0] layer;
	logic active_784_20;
	logic active_20_20;
	logic active_20_10;
	
	logic [8:0] tick;
	logic LD_IO;
	
	always_ff @ (posedge Clk) begin
		
		Probability <= z_20_10;
		
	end
	
	always_comb begin
	
		active_784_20 = 1'b0;
		active_20_20 = 1'b0;
		active_20_10 = 1'b0;
		if (tick > 3) // change based on delay
			{active_784_20, active_20_20, active_20_10} = layer;
	
		data_in = 16'b0;
		address_r0 = 10'b0;
		address_r1 = 10'b0;
		
		case (layer)
			3'b001: 	begin
							address_r0 = WEIGHT_1 + tick;
							address_r1 = INPUT + tick;
							if (LD_IO) begin
								data_in = z_784_20[tick];
								address_r1 = LAYER_IO_1 + tick;
							end
						end
			3'b010: 	begin
							address_r0 = WEIGHT_2 + tick;
							address_r1 = LAYER_IO_1 + tick;
							if (LD_IO) begin
								data_in = z_20_20[tick];
								address_r1 = LAYER_IO_2 + tick;
							end
						end
			3'b100: 	begin
							address_r0 = WEIGHT_3 + tick;
							address_r1 = LAYER_IO_2 + tick;
							if (LD_IO) begin
								data_in = z_20_10[tick];
								address_r1 = LAYER_IO_3 + tick;
							end
						end
		endcase
		
	end
	
	state_machine s0	(
								.Clk(Clk), .Reset(Reset), .Compute(Compute),
								.Layer(layer),
								.Tick(tick), .LD_IO(LD_IO)
							);
	
	// first hidden layer
	
	neuron_784_20 n1 [19:0] ( .Clk(Clk), .Active(active_784_20), .Tick(tick), .X(x), .W(w), .Z(z_784_20) );
	
	// second hidden layer
	
	neuron_20_20 n2 [19:0] ( .Clk(Clk), .Active(active_20_20), .Tick(tick), .X(x), .W(w), .Z(z_20_20) );
	
	// output layer
	
	neuron_20_10 n3 [9:0] ( .Clk(Clk), .Active(active_20_10), .Tick(tick), .X(x), .W(w[19:10]), .Z(z_20_10) );
	
	
	ram_weights_biases r0	(
										.Clk(Clk),
										.Reset(Reset),
										.Address('{20{address_r0}}),
										.Q(w)
									);
								
	ram_input_output r1	(
									.Clk(Clk),
									.Reset(Reset),
									.Wren(LD_IO),
									.Address(address_r1),
									.D(data_in),
									.Q(x)
								);

endmodule