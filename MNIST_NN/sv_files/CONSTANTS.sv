
`ifndef _BRAM_ADDRS__SV 
`define _BRAM_ADDRS__SV

package BRAM_ADDRS;
   
	// STARTING ADDRESSES
	
   	parameter WEIGHT_1 = 10'h0; // layer 1 weight
	parameter WEIGHT_2 = 10'h311; // layer 2 weight
	parameter WEIGHT_3 = 10'h326; // layer 3 weight
	
	// biases are stored immediately after weights
   	parameter BIAS_1 = 10'h310; // layer 1 bias
	parameter BIAS_2 = 10'h325; // layer 2 bias
	parameter BIAS_3 = 10'h33a; // layer 3 bias
	
	parameter INPUT = 10'h0; // input
	
	parameter SIGMOID = 16'h0; // sigmoid start
   
endpackage

`endif 