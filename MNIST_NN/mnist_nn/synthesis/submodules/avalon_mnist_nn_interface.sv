
/***********************************

Register Map:

0-9	:	10x 32-bit Probabilites
10		:	32-bit Start Register
11		:	32-bit Done Register
12-15	:	Not Used

************************************/
module avalon_mnist_nn_interface (
	input logic CLK,
	input logic RESET,
	input logic AVL_READ,
	input logic AVL_WRITE,
	input logic AVL_ADDR,
	input logic [31:0] AVL_WRITEDATA,
	output logic [31:0] AVL_READDATA
);

	logic start, ready;
	logic [15:0] probability [9:0];


	neural_network nn_0 (
		.Clk(CLK),
		.Reset(RESET),
		.Compute(start),
		.Ready(ready),
		.Probability(probability)
	);
								
	reg_file reg_file_0 (
		.Clk(CLK),
		.Reset(RESET),
		.W(AVL_WRITE),
		.Addr(AVL_ADDR),
		.Write_Data(AVL_WRITEDATA),
		.Read_Data(AVL_READDATA),
		.Done(ready),
		.Start(start),
		.Probability(probability)
	);


endmodule