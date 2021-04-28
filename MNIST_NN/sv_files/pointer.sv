module pointer (
    input logic frame_clk,
    input logic Reset,
    input logic [7:0] X_displ, Y_displ,
    output logic [9:0] X_pos, Y_pos
);

    logic [9:0] x_pos, y_pos;

    assign X_pos = x_pos + X_displ;
    assign Y_pos = y_pos + Y_displ;

    always_ff @ (posedge frame_clk) begin
        
        if (Reset) begin
            x_pos <= 20;
            y_pos <= 20;
        end
        else begin
            x_pos = x_pos + X_displ;
            y_pos = y_pos + Y_displ;
        end

    end

endmodule