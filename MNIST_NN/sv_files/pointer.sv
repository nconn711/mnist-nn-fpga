module pointer (
    input logic frame_clk,
    input logic Reset,
    input logic [7:0] X_displ, Y_displ,
    input logic [7:0] Button,
    output logic [9:0] X_pos, Y_pos
);

    always_ff @ (posedge frame_clk) begin
        
        // calculate pointer position and keep within bounds

    end

endmodule