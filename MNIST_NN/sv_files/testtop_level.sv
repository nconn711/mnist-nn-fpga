module testtop_level (
	input logic MAX10_CLK1_50,
	input logic [1:0] KEY,
	input logic [9:0] SW,
	input logic [7:0] x_displ, y_displ, button,
	output logic [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output logic [9:0] LEDR,
	output logic [15:0] Probability [9:0],
	output logic VGA_HS,
	output logic VGA_VS,
	output logic [ 3: 0] VGA_R,
	output logic [ 3: 0] VGA_G,
	output logic [ 3: 0] VGA_B
);

	logic Reset_h;

	//////// REG/WIRE declarations //////////
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;
	logic [9:0] x_pos, y_pos;
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];


    //instantiate a vga_controller, ball, and color_mapper here with the ports.

	logic [9:0] BallX_Interconnect, BallY_Interconnect, BallS_Interconnect;
	logic [9:0] DrawX_Interconnect, DrawY_Interconnect;
	logic Clk_25_Interconnect;

	logic [15:0] canvas [27:0][27:0];
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
        .BallX(BallX_Interconnect),
        .BallY(BallY_Interconnect),
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
	logic [15:0] display;

	assign display = probability[SW];
	//assign display = {x_pos[5:0], y_pos};
	assign Probability = probability;

	hex_driver hex_display [5:0] ( {8'b0, display}, {HEX5, HEX4, HEX3, HEX2, HEX1, HEX0} );

	neural_network nn_instance (
		.Clk(MAX10_CLK1_50),
		.Reset(Reset_h),
		.Compute(VGA_VS),
		.canvas(canvas),
		.Ready(),
		.Probability(probability)
	);


endmodule