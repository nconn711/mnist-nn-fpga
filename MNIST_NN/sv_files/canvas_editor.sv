module canvas_editor(
    input logic frame_clk, Reset, Run,
    input logic [9:0] X_Pos, Y_Pos,
    input logic [15:0] canvas [27:0][27:0]
);
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
                    canvas <='{28{28{16'b0}}};
                end
            else 
                begin
                    if (X_Block != 32 && Y_Block != 32) //or X_Block/Y_Block == 32
                        canvas[X_Block][Y_Block] <= canvas[X_Block][Y_Block] + 2000;
                end
        end
endmodule