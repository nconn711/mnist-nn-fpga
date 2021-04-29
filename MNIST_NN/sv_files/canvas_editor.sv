module canvas_editor(
    input logic frame_clk, Reset, Run,
    input logic [9:0] X_Pos, Y_Pos,
    output logic [15:0] canvas [27:0][27:0]
);
    logic [4:0] X_Block, Y_Block;
	 logic [9:0] X, Y;
    assign X = (X_Pos > 200) ? (X_Pos - 200) : 0;
    assign Y = (Y_Pos > 44) ? (Y_Pos - 44) : 0;

    always_comb begin
			X_Block = 31;
			Y_Block = 31;
			for (int x=0; x<28; x++) begin
				 for (int y=0; y<28; y++) begin
					  if(X >= x*14 && X < (x+1)*14) 
							X_Block = x;

					  if(Y >= y*14 && Y < (y+1)*14)
							Y_Block = y;
				 end
			end
    end

    always_ff @ (posedge frame_clk or posedge Reset) begin
			if (Reset) begin
					  canvas <= '{28{'{28{16'b0}}}};
			end
			else if (Run) begin
				if (X_Block != 31 && Y_Block != 31) begin
					canvas[X_Block][Y_Block] <= (canvas[X_Block][Y_Block] < 1548) ? canvas[X_Block][Y_Block] + 500 : 2048;
				end
			end
    end
endmodule