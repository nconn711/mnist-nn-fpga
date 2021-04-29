//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper( 
    input logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
    input logic [15:0] canvas [27:0][27:0],
    output logic [7:0]  Red, Green, Blue 
);

    logic ball_on;
    logic canvas_on;
    logic [4:0] X_Block, Y_Block;
	 logic [9:0] X, Y;
    assign X = (DrawX >= 200-1) ? (DrawX - (200-1)) : 10'hfff;
    assign Y = (DrawY >= (44-1)) ? (DrawY - (44-1)) : 10'hfff;

    int DistX, DistY, Size;
	assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;

    always_comb begin:RGB_Display
        //Ball_on_proc
        if ((DistX*DistX + DistY*DistY) <= (Size * Size)) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;

        //Calc BlockX/Y
		  X_Block = 31;
		  Y_Block = 31;
        for (int x=0; x<28; x++) begin
            for (int y=0; y<28; y++) begin
                if((X >= x*14) && (X < (x+1)*14)) 
                    X_Block = x;
                if((Y >= y*14) && (Y < (y+1)*14))
                    Y_Block = y;
            end
        end

        //Canvas_on_proc
        if (X >= 0 && X < 392 && Y >= 0 && Y < 392) 
            canvas_on = 1'b1;
        else 
            canvas_on = 1'b0;

        //Set RGB values of Display
        if (ball_on) 
            begin 
                Red = 8'hff;
                Green = 8'h00;
                Blue = 8'h00;
            end       
        else if (canvas_on)
            begin
                Red = canvas[X_Block][Y_Block][10:3];
                Green = canvas[X_Block][Y_Block][10:3];
                Blue = canvas[X_Block][Y_Block][10:3];
            end
        else if ((DrawX >= 197 && DrawX <= 198 && DrawY > 42 && DrawY < 436) || 
                (DrawY >= 41 && DrawY <= 42 && DrawX > 198 && DrawX < 592) || 
                (DrawX >= 592 && DrawX <= 593 && DrawY > 42 && DrawY < 436) || 
                (DrawY >= 436 && DrawY <= 437 && DrawX > 198 && DrawX < 592))
            begin
                Red = 8'h88; 
                Green = 8'h88;
                Blue = 8'h88;
            end
        else
            begin 
                Red = 8'h88; 
                Green = 8'h88;
                Blue = 8'h88;
            end      
    end 
    
endmodule