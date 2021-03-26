module neuron_784_20 (
	input logic Clk, Active,
	input logic [9:0] Tick,
	input logic [15:0] X,
	input logic [15:0] W,
	output logic [15:0] Z
);
	logic [41:0] accumulator;
	logic sload;
	logic [15:0] x, w;
	
	always_comb begin
		sload = 1'b0;
		x = X;
		w = W;
		if (~Active) begin
			sload = 1'b1; 	// clear accumulator
			x = 16'b0;		// ^^
		end
		Z = (accumulator >> 16); // need activation function
	end
	
	mult_accum m0 (
						.accum_sload(sload),
						.clock0(Clk),
						.dataa(x),
						.datab(w),
						.result(accumulator) );
endmodule

module neuron_20_20 (
	input logic Clk, Active,
	input logic [9:0] Tick,
	input [15:0] X,
	input [15:0] W,
	output logic [15:0] Z
);
	logic [41:0] accumulator;
	logic sload;
	logic [15:0] x, w;
	
	always_comb begin
		sload = 1'b0;
		x = X;
		w = W;
		if (~Active) begin
			sload = 1'b1; 	// clear accumulator
			x = 16'b0;		// ^^
		end
		Z = (accumulator >> 16); // need activation function
	end
	
	mult_accum m0 (
						.accum_sload(sload),
						.clock0(Clk),
						.dataa(x),
						.datab(w),
						.result(accumulator) );
endmodule

module neuron_20_10 (
	input logic Clk, Active,
	input logic [9:0] Tick,
	input [15:0] X,
	input [15:0] W,
	output logic [15:0] Z
);
	logic [41:0] accumulator;
	logic sload;
	logic [15:0] x, w;
	
	always_comb begin
		sload = 1'b0;
		x = X;
		w = W;
		if (~Active) begin
			sload = 1'b1; 	// clear accumulator
			x = 16'b0;		// ^^
		end
		Z = (accumulator >> 16); // need activation function
	end
	
	mult_accum m0 (
						.accum_sload(sload),
						.clock0(Clk),
						.dataa(x),
						.datab(w),
						.result(accumulator) );
endmodule