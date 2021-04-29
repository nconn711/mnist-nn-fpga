module pointer (
    input logic frame_clk,
    input logic Reset,
    input logic [7:0] X_displ, Y_displ,
    output logic [9:0] X_pos, Y_pos, Size
);

    logic [9:0] x_pos, y_pos;

    parameter [9:0] X_Center=320;  // Center position on the X axis
    parameter [9:0] Y_Center=240;  // Center position on the Y axis
    parameter [9:0] X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] X_Step=1;      // Step size on the X axis
    parameter [9:0] Y_Step=1;      // Step size on the Y axis
	 parameter [7:0] Sensitivity=8'hfe; // mask lower bits of displacement values

    assign X_pos = x_pos;
    assign Y_pos = y_pos;
	 assign Size = 4;

    always_ff @ (posedge frame_clk or posedge Reset) begin
        
        if (Reset) begin
            x_pos <= X_Center;
            y_pos <= Y_Center;
        end
        else begin
				
				// y position calculation
				
				if (Y_displ[7]) begin
					if ((y_pos - Size - (((Y_displ ^ 8'hff) + 1) & Sensitivity)) <= Y_Min)
						y_pos <= Y_Min + 1 + Size;
					else
						y_pos <= y_pos - (((Y_displ ^ 8'hff) + 1) & Sensitivity);
				end
				else begin
					if ((y_pos + Size + (Y_displ & Sensitivity)) >= Y_Max)
						y_pos <= Y_Max - 1 - Size;
					else
						y_pos <= y_pos + (Y_displ & Sensitivity);
				end
				
				
				// x position calculation
				
				if (X_displ[7]) begin
					if ((x_pos - Size - (((X_displ ^ 8'hff) + 1) & Sensitivity)) <= X_Min)
						x_pos <= X_Min + 1 + Size;
					else
						x_pos <= x_pos - (((X_displ ^ 8'hff) + 1) & Sensitivity);
				end
				else begin
					if ((x_pos + Size + (X_displ & Sensitivity)) >= X_Max)
						x_pos <= X_Max - 1 - Size;
					else
						x_pos <= x_pos + (X_displ & Sensitivity);
				end
				
				
        end

    end

endmodule