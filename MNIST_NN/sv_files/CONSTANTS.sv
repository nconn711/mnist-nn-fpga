
`ifndef _BRAM_ADDRS__SV 
`define _BRAM_ADDRS__SV

package BRAM_ADDRS;
   
	// STARTING ADDRESSES
	
   parameter WEIGHT_1 = 10'h0; // layer 1 weight
	parameter WEIGHT_2 = 10'h311; // layer 2 weight
	parameter WEIGHT_3 = 10'h326; // layer 3 weight
	
												// biases are stored immediately before weights
   parameter BIAS_1 = 10'h310; // layer 1 bias
	parameter BIAS_2 = 10'h325; // layer 2 bias
	parameter BIAS_3 = 10'h33a; // layer 3 bias
	
	parameter INPUT = 10'h0; // input
	parameter LAYER_IO_1 = 10'h311; // layer 1 IO
	parameter LAYER_IO_2 = 10'h326; // layer 2 IO
	parameter LAYER_IO_3 = 10'h33b; // layer 3 IO
   
endpackage

`endif 