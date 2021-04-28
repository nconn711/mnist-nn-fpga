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
    input [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
    input [15:0]reg [27:0][27:0]
    output logic [7:0]  Red, Green, Blue 
);

    logic ball_on;
    logic canvas_on;
    logic X_Block;
    logic Y_Block;

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
        for (int x=0; x<28; x++) begin
            for (int y=0; y<28; y++) begin
                if(DrawX >= x*14 && DrawX < (x+1)*14) 
                    X_Block = x;
                else
                    X_Block = 32;

                if(DrawY >= y*14 && DrawY < (y+1)*14)
                    Y_Block = x;
                else
                    Y_Block = 32;
            end
        end

        //Canvas_on_proc
        if (X_Block != 32 && Y_Block != 32) 
            canvas_on = 1'b1;
        else 
            canvas_on = 1'b0;

        //Set RGB values of Display
        if ((ball_on == 1'b1)) 
            begin 
                Red = 8'hff;
                Green = 8'h00;
                Blue = 8'h00;
            end       
        else if ((canvas_on == 1'b1)) 
            begin
                Red = reg[X_Block][Y_Block][11:4];
                Green = reg[X_Block][Y_Block][11:4];
                Blue = reg[X_Block][Y_Block][11:4];
            end
        else
            begin 
                Red = 8'h00; 
                Green = 8'h00;
                Blue = 8'h00;
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
                    if (X_Block != 32 && Y_Block != 32) //or X_Block/Y_Block == 32
                        reg[X_Block][Y_Block] <= reg[X_Block][Y_Block] + 2000;
                end
        end
endmodule 