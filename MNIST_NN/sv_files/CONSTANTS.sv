
`ifndef _BRAM_ADDRS__SV 
`define _BRAM_ADDRS__SV

package BRAM_ADDRS;
   
	// STARTING ADDRESSES
	
   	parameter WEIGHT_1 = 10'h0; // layer 1 weight
	parameter WEIGHT_2 = 10'h311; // layer 2 weight
	parameter WEIGHT_3 = 10'h326; // layer 3 weight
	
	parameter NUM_0 = 10'h00;
	parameter NUM_1 = 10'h0F;
	parameter NUM_2 = 10'h1E;
	parameter NUM_3 = 10'h2D;
	parameter NUM_4 = 10'h3C;
	parameter NUM_5 = 10'h4B;
	parameter NUM_6 = 10'h5A;
	parameter NUM_7 = 10'h69;
	parameter NUM_8 = 10'h78;
	parameter NUM_9 = 10'h87;
	parameter NUM_dp = 10'h96;
	parameter NUM_colon = 10'hA5;
	parameter NUM_percent = 10'hB4;
	
	// biases are stored immediately after weights
   	parameter BIAS_1 = 10'h310; // layer 1 bias
	parameter BIAS_2 = 10'h325; // layer 2 bias
	parameter BIAS_3 = 10'h33a; // layer 3 bias
	
	parameter INPUT = 10'h0; // input
	
	parameter SIGMOID = 16'h0; // sigmoid start

   
endpackage

`endif 