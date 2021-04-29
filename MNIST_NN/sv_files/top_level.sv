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
	input logic  [ 1: 0] KEY,
    input logic [ 9: 0] SW,
 	output logic [ 9: 0] LEDR,
	output logic [ 7: 0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
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

	logic Reset_h, vssig, blank, sync, VGA_Clk;

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
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];
	
	
	mnist_nn u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode),
		.x_displ_export(x_displ),
		.y_displ_export(y_displ),
		.button_export(button)
		
	 );


    //instantiate a vga_controller, ball, and color_mapper here with the ports.

	logic [9:0] BallX_Interconnect, BallY_Interconnect, BallS_Interconnect;
	logic [9:0] DrawX_Interconnect, DrawY_Interconnect;
	logic Clk_25_Interconnect;

	logic [15:0] canvas [27:0][27:0];
	logic [9:0] x_pos, y_pos;
	logic canvas_run;

	assign canvas_run = ((x_displ != 0 || y_displ != 0) && (button & 8'b1)) ? 1'b1 : 1'b0;

	vga_controller vga_instance ( 
        .Clk(MAX10_CLK1_50),
        .Reset(Reset_h),
        .hs(VGA_HS),
        .vs(VGA_VS),
        .pixel_clk(Clk_25_Interconnect),
        .blank(),
        .sync(),
        .DrawX(DrawX_Interconnect),
        .DrawY(DrawY_Interconnect)
    );

	pointer pointer_instance (
		.frame_clk(VGA_VS),
		.Reset(Reset_h),
		.X_displ(x_displ),
		.Y_displ(y_displ),
		.X_pos(x_pos),
		.Y_pos(y_pos),
		.Size(BallS_Interconnect)
	);
								
//	ball ball_instance (	
//        .Reset(Reset_h),
//        .frame_clk(VGA_VS),
//        .keycode(keycode),
//        .BallX(BallX_Interconnect),
//        .BallY(BallY_Interconnect),
//        .BallS(BallS_Interconnect)
//    );
								
	color_mapper color_instance ( 
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

	canvas_editor canvas_instance (
		.frame_clk(VGA_VS),
		.Reset(Reset_h),
		.Run(canvas_run),
		.X_Pos(x_pos),
		.Y_Pos(y_pos),
		.canvas(canvas)
	);

	logic [15:0] probability [9:0];
	logic [23:0] display;

	//assign display = probability[SW];
	assign display = {2'b0, x_pos, 2'b0, y_pos};

	hex_driver hex_display [5:0] ( display, {HEX5, HEX4, HEX3, HEX2, HEX1, HEX0} );

	neural_network nn_instance (
		.Clk(MAX10_CLK1_50),
		.Reset(Reset_h),
		.Compute(VGA_VS),
		.Ready(),
		.Probability(probability)
	);


endmodule
