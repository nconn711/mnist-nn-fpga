
module mnist_nn (
	button_export,
	clk_clk,
	hex_digits_export,
	key_external_connection_export,
	keycode_export,
	leds_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	spi0_MISO,
	spi0_MOSI,
	spi0_SCLK,
	spi0_SS_n,
	usb_gpx_export,
	usb_irq_export,
	usb_rst_export,
	x_displ_export,
	y_displ_export,
	floatingpoint_0_export,
	floatingpoint_1_export,
	floatingpoint_2_export,
	floatingpoint_3_export,
	floatingpoint_4_export,
	floatingpoint_5_export,
	floatingpoint_6_export,
	floatingpoint_7_export,
	floatingpoint_8_export,
	floatingpoint_9_export,
	fixedpoint_0_export,
	fixedpoint_1_export,
	fixedpoint_2_export,
	fixedpoint_3_export,
	fixedpoint_4_export,
	fixedpoint_5_export,
	fixedpoint_6_export,
	fixedpoint_7_export,
	fixedpoint_8_export,
	fixedpoint_9_export);	

	output	[7:0]	button_export;
	input		clk_clk;
	output	[15:0]	hex_digits_export;
	input	[1:0]	key_external_connection_export;
	output	[7:0]	keycode_export;
	output	[13:0]	leds_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		spi0_MISO;
	output		spi0_MOSI;
	output		spi0_SCLK;
	output		spi0_SS_n;
	input		usb_gpx_export;
	input		usb_irq_export;
	output		usb_rst_export;
	output	[7:0]	x_displ_export;
	output	[7:0]	y_displ_export;
	output	[15:0]	floatingpoint_0_export;
	output	[15:0]	floatingpoint_1_export;
	output	[15:0]	floatingpoint_2_export;
	output	[15:0]	floatingpoint_3_export;
	output	[15:0]	floatingpoint_4_export;
	output	[15:0]	floatingpoint_5_export;
	output	[15:0]	floatingpoint_6_export;
	output	[15:0]	floatingpoint_7_export;
	output	[15:0]	floatingpoint_8_export;
	output	[15:0]	floatingpoint_9_export;
	input	[15:0]	fixedpoint_0_export;
	input	[15:0]	fixedpoint_1_export;
	input	[15:0]	fixedpoint_2_export;
	input	[15:0]	fixedpoint_3_export;
	input	[15:0]	fixedpoint_4_export;
	input	[15:0]	fixedpoint_5_export;
	input	[15:0]	fixedpoint_6_export;
	input	[15:0]	fixedpoint_7_export;
	input	[15:0]	fixedpoint_8_export;
	input	[15:0]	fixedpoint_9_export;
endmodule
