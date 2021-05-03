//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module top_level (
	///////// Clock /////////
	input logic MAX10_CLK1_50,
	///////// DE10 //////////
	input logic  [1: 0] KEY,
    input logic [9: 0] SW,
 	output logic [9: 0] LEDR,
	output logic [7: 0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	///////// SDRAM /////////
	output logic DRAM_CLK,
	output logic DRAM_CKE,
	output logic [12: 0] DRAM_ADDR,
	output logic [ 1: 0] DRAM_BA,
	inout logic [15: 0] DRAM_DQ,
	output logic DRAM_LDQM,
	output logic DRAM_UDQM,
	output logic DRAM_CS_N,
	output logic DRAM_WE_N,
	output logic DRAM_CAS_N,
	output logic DRAM_RAS_N,
	///////// VGA /////////
	output logic VGA_HS,
	output logic VGA_VS,
	output logic [ 3: 0] VGA_R,
	output logic [ 3: 0] VGA_G,
	output logic [ 3: 0] VGA_B,
	///////// ARDUINO /////////
	inout logic [15: 0] ARDUINO_IO,
	inout logic ARDUINO_RESET_N 
);

	logic Reset_h, Compute_h, vssig, blank, sync, VGA_Clk;

	//////// REG/WIRE declarations //////////
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;
	logic [7:0] x_displ, y_displ, button;

	//////// Structural Code ///////////
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	
	//Assign one button to reset
	assign {Reset_h} = ~(KEY[0]);
	assign {Compute_h} = ~(KEY[1]);

	//Our A/D converter is only 12 bit
	assign VGA_R = ~blank ? 4'b0 : Red[7:4];
	assign VGA_B = ~blank ? 4'b0 : Blue[7:4];
	assign VGA_G = ~blank ? 4'b0 : Green[7:4];

    //instantiate a vga_controller, ball, and color_mapper here with the ports.
	logic [9:0] DrawX_Interconnect, DrawY_Interconnect;
	logic Clk_25_Interconnect;

	vga_controller vga_instance ( 
        .Clk(MAX10_CLK1_50),
        .Reset(Reset_h),
        .hs(VGA_HS),
        .vs(VGA_VS),
        .pixel_clk(Clk_25_Interconnect),
        .blank(blank),
        .sync(sync),
        .DrawX(DrawX_Interconnect),
        .DrawY(DrawY_Interconnect)
    );
								
	color_mapper color_instance ( 
		.Clk(Clk_25_Interconnect)
        .BallX(x_pos),
        .BallY(y_pos),
        .DrawX(DrawX_Interconnect),
        .DrawY(DrawY_Interconnect), 
        .Ball_size(BallS_Interconnect),
		.canvas(canvas),
        .Red(Red),
        .Green(Green),
        .Blue(Blue)
    );

endmodule
