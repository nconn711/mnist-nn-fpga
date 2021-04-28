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


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	  
    always_comb
    begin:Ball_on_proc
        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 1'b1)) 
        begin 
            Red = 8'hff;
            Green = 8'h55;
            Blue = 8'h00;
        end       
        else 
        begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h7f - DrawX[9:3];
        end      
    end 
    
endmodule

module canvas(
    input [9:0] X_Pos, Y_Pos,
    input [15:0]reg [27:0][27:0],
    input frame_clk, Reset, Run
);
    logic [27:0] RegX, RegY;
    logic [4:0] X_Block, Y_Block;
    assign X = (X_Pos - 200);
    assign Y = (Y_pos - 44);

    always_comb
        begin
            for (int x=0; x<28; x++) begin
                for (int y=0; y<28; y++) begin
                    if(X >= x*14 && X < (x+1)*14) 
                        X_Block = x;
                    else
                        X_Block = 32;

                    if(Y >= y*14 && Y < (y+1)*14)
                        Y_Block = x;
                    else
                        Y_Block = 32;
                end
            end
        end

    always_ff @ (posedge frame_clk)
        begin
            if(Reset)
                begin
                    reg <='{28{28{16'b0}}};
                end
            else 
                begin
                    if (X_Pos >= 199 && X_Pos <= 591 && Y_Pos >= 43 && Y_Pos <= 435) //or X_Block/Y_Block == 32
                        reg[X_Block][Y_Block] <= reg[X_Block][Y_Block] + 2000;
                end
        end
endmodule 