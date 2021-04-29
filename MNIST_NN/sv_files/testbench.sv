module testbench;

timeunit 10ns;
timeprecision 1ns;

logic Clk = 0;
logic [1:0] KEY;
logic [9:0] SW;
logic [7:0] x_displ, y_displ, button;
logic [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
logic [9:0] LEDR;
logic [15:0] Probability [9:0];
logic VGA_HS;
logic VGA_VS;
logic [ 3: 0] VGA_R;
logic [ 3: 0] VGA_G;
logic [ 3: 0] VGA_B;

testtop_level test (
	.MAX10_CLK1_50(Clk),
	.*
);

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 
	
	
initial begin: TEST

KEY = 2'b11;
SW = 10'b0;

#20
KEY = 2'b10;
#20
KEY = 2'b11;

end: TEST

endmodule