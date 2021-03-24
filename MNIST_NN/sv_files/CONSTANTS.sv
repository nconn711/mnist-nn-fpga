
`ifndef _BRAM_ADDRS__SV 
`define _BRAM_ADDRS__SV

package BRAM_ADDRS;
   
	// STARTING ADDRESSES
	
   parameter WEIGHT_1 = 10'h1; // layer 1 weight
	parameter WEIGHT_2 = 10'h312; // layer 2 weight
	parameter WEIGHT_3 = 10'h327; // layer 3 weight
	
												// biases are stored immediately before weights
   parameter BIAS_1 = WEIGHT_1 - 1; // layer 1 bias
	parameter BIAS_2 = WEIGHT_2 - 1; // layer 2 bias
	parameter BIAS_3 = WEIGHT_3 - 1; // layer 3 bias
	
	parameter INPUT = 10'h0; // input
	parameter LAYER_IO_1 = 10'h310; // layer 1 IO
	parameter LAYER_IO_2 = 10'h324; // layer 2 IO
	parameter LAYER_IO_3 = 10'h338; // layer 3 IO
   
endpackage

`endif 