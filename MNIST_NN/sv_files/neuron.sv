module neuron #(
	parameter IN=784,		// Number of inputs to neuron
	parameter RANGE=4,	// Floating point range e.g. [-2, 2]
	parameter BIT=16		// Fixed point range e.g. [2^15, 2^15 - 1]
)(
	input logic [IN-1:0] In,
	output logic [RES-1:0] Out
);
	
	
	
	
endmodule