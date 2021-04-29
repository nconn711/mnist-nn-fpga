`include "CONSTANTS.sv"
import BRAM_ADDRS::*;

module neural_network (
	input logic Clk, Reset,
	input logic Compute,
	input logic [15:0] canvas [27:0][27:0],
	output logic Ready,
	output logic [15:0] Probability [9:0]
);

	logic [9:0] address_r0, address_r1;
	logic [15:0] address_r2;
	logic [15:0] q, sigmoid;
	
	logic [15:0] x;
	logic [15:0] w [19:0];
	logic [15:0] z_1_out [19:0], z_1_sig [19:0];
	logic [15:0] z_2_out [19:0], z_2_sig [19:0];
	logic [15:0] z_3_out [9:0], z_3_sig [9:0];
	
	logic [2:0] layer;
	logic [2:0] active;
	logic actFuncActive;
	
	logic [9:0] tick;
	
	always_ff @ (posedge Clk) begin
		
		if (Reset)
			Probability <= '{10{16'b0}};
		else if (Ready)
			Probability <= z_3_sig;
		else if (actFuncActive) begin
			case (layer)
				3'b001:		begin
								if (tick-2 < 20)
									z_1_sig[tick-2] <= sigmoid;
							end
				3'b010:		begin
								if (tick-2 < 20)
									z_2_sig[tick-2] <= sigmoid;
							end
				3'b100:		begin
								if (tick-2 < 10)
									z_3_sig[tick-2] <= sigmoid;
							end	
			endcase
		end
	end
	
	always_comb begin
	
		address_r0 = 10'b0;
		address_r1 = 10'b0;
		address_r2 = 16'b0;
		x = 16'b0;
		
		case (layer)
			3'b001: 	begin
							address_r0 = WEIGHT_1 + tick;
							address_r1 = (tick < 784) ? tick : 0;
							address_r2 = (tick < 20) ? SIGMOID + z_1_out[tick] : 16'b0;
							x = (tick-2 < 784) ? q : 1<<11; // based off resolution
						end
			3'b010: 	begin
							address_r0 = WEIGHT_2 + tick;
							address_r2 = (tick < 20) ? SIGMOID + z_2_out[tick] : 16'b0;
							if (active & 3'b010)
								x = (tick-2 < 20) ? z_1_sig[tick - 2] : 1<<11;
						end
			3'b100: 	begin
							address_r0 = WEIGHT_3 + tick;
							address_r2 = (tick < 10) ? SIGMOID + z_3_out[tick] : 16'b0;
							if (active & 3'b100)
								x = (tick-2 < 20) ? z_2_sig[tick - 2] : 1<<11;
						end
		endcase
		
	end
	
	state_machine s0	(
								.Clk(Clk), .Reset(Reset), .Compute(Compute),
								.Layer(layer), .Active(active),
								.Tick(tick), .ActFuncActive(actFuncActive), .R(Ready)
							);
	
	// first hidden layer
	
	neuron_784_20 n1 [19:0] ( .Clk(Clk), .Active(active[0]), .X(x), .W(w), .Z(z_1_out) );
	
	// second hidden layer
	
	neuron_20_20 n2 [19:0] ( .Clk(Clk), .Active(active[1]), .X(x), .W(w), .Z(z_2_out) );
	
	// output layer
	
	neuron_20_10 n3 [9:0] ( .Clk(Clk), .Active(active[2]), .X(x), .W(w[9:0]), .Z(z_3_out) );
	
	
	ram_weights_biases r0	(
										.Clk(Clk),
										.Reset(Reset),
										.Address('{20{address_r0}}),
										.Q(w)
									);

	assign q = canvas[address_r1 % 28][address_r1 / 28];

	// ram_input_output r1	(
	// 								.Clk(Clk),
	// 								.Reset(Reset),
	// 								.Address(address_r1),
	// 								.Q(q)
	// 							);
					
	rom r2	(
					.address(address_r2),
					.clock(Clk),
					.q(sigmoid)
				);

endmodule