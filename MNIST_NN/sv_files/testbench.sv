module testbench;

timeunit 10ns;
timeprecision 1ns;

logic Clk = 0;
logic MAX10_CLK1_50;
logic [1:0] KEY;
logic [9:0] SW;
logic [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
logic [9:0] LEDR;

assign MAX10_CLK1_50 = Clk;
top_level top (.*);

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 
	
	
initial begin: TEST

KEY = 2'b11;
SW = 10'b0;

#10 KEY = 2'b10;
#10 KEY = 2'b11;
#10 KEY = 2'b01;
#10 KEY = 2'b01;


end: TEST

endmodule