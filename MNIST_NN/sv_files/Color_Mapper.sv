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
    input logic Clk
    input logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
    input logic [15:0] canvas [27:0][27:0],
    output logic [7:0]  Red, Green, Blue 
);

    logic num_on;
    logic ball_on;
    logic canvas_on;
    logic [4:0] X_Block, Y_Block;
	logic [9:0] X, Y;
    logic [15:0] Addr;
    logic [9:0] numrow;
    logic [3:0] numcol;
    logic [7:0] line;

    assign X = (DrawX >= 200-1) ? (DrawX - (200-1)) : 10'hfff;
    assign Y = (DrawY >= (44-1)) ? (DrawY - (44-1)) : 10'hfff;
    assign line = (DrawY >= (165-1) && DrawY <= (315-1)) ? (DrawY - 164) : 8'hff; 
    assign numcol = (DrawX >= 55 && DrawX <= 143) ? ((DrawX - 55)%11) : 4'hf;

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

        //set_addr
        if (DrawY >= 164 && DrawY <= 178 && DrawX >= 55 && DrawX <= 65) //0 - num1
            Addr = NUM_0 + line%15;
        else if (DrawY >= 179 && DrawY <= 193 && DrawX >= 55 && DrawX <= 65) //1 - num1
            Addr = NUM_1 + line%15;
        else if (DrawY >= 194 && DrawY <= 208 && DrawX >= 55 && DrawX <= 65) //2 - num1
            Addr = NUM_2 + line%15;
        else if (DrawY >= 209 && DrawY <= 223 && DrawX >= 55 && DrawX <= 65) //3 - num1
            Addr = NUM_3 + line%15;
        else if (DrawY >= 224 && DrawY <= 238 && DrawX >= 55 && DrawX <= 65) //4 - num1
            Addr = NUM_4 + line%15;
        else if (DrawY >= 239 && DrawY <= 253 && DrawX >= 55 && DrawX <= 65) //5 - num1
            Addr = NUM_5 + line%15;
        else if (DrawY >= 254 && DrawY <= 268 && DrawX >= 55 && DrawX <= 65) //6 - num1
            Addr = NUM_6 + line%15;
        else if (DrawY >= 269 && DrawY <= 283 && DrawX >= 55 && DrawX <= 65) //7 - num1
            Addr = NUM_7 + line%15; 
        else if (DrawY >= 284 && DrawY <= 298 && DrawX >= 55 && DrawX <= 65) //8 - num1
            Addr = NUM_8 + line%15;
        else if (DrawY >= 299 && DrawY <= 313 && DrawX >= 55 && DrawX <= 65) //9 - num1
            Addr = NUM_9 + line%15;
        
        else if (DrawY >= 164 && DrawY <= 313 && DrawX >= 66 && DrawX <= 76) //:
            Addr = NUM_: + line%15;

        else if (DrawY >= 164 && DrawY <= 313 && DrawX >= 99 && DrawX <= 109) //.
            Addr = NUM_ + line%15;

        else if (DrawY >= 164 && DrawY <= 313 && DrawX >= 132 && DrawX <= 142) //%
            Addr = NUM_% + line%15;

        else 
            Addr = NUM_0;

        //num_on_proc
        if (DrawY >= 164 && DrawY <= 314 && DrawX >= 55 && DrawX <= 143 && numrow[numcol])
            num_on = 1'b1;
        else 
            num_on = 1'b0;

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
        else if (num_on)
            begin
                Red = 8'h88; 
                Green = 8'h88;
                Blue = 8'h88;
            end
        else if (canvas_on)
            begin
                Red = canvas[X_Block][Y_Block][10:3];
                Green = canvas[X_Block][Y_Block][10:3];
                Blue = canvas[X_Block][Y_Block][10:3];
            end
        else if ((DrawX >= 197 && DrawX <= 198 && DrawY > 42 && DrawY < 436) || //left
                (DrawY >= 41 && DrawY <= 42 && DrawX > 198 && DrawX < 592) || //top
                (DrawX >= 591 && DrawX <= 592 && DrawY > 42 && DrawY < 436) || //right
                (DrawY >= 435 && DrawY <= 436 && DrawX > 198 && DrawX < 592)) //bottom
            begin
                Red = 8'h88; 
                Green = 8'h88;
                Blue = 8'h88;
            end
        else
            begin 
                Red = 8'h00; 
                Green = 8'h00;
                Blue = 8'h00;
            end      
    end 

    ram_nums rn	(
									.Clk(Clk),
									.Reset(Reset),
									.Address(Addr),
									.Q(numrow)
								);
    
endmodule