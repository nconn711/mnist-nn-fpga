//Code for inferred ROM 2^16 address space x 16 bits
module rom #(parameter ADDR_WIDTH=16, DATA_WIDTH=16, ADDR_SIZE=65536, FILE_NAME=" ")
    (output logic [DATA_WIDTH-1:0] q,
     input logic [DATA_WIDTH-1:0] d,
     input logic [ADDR_WIDTH-1:0] a,
     input logic clk);

	reg [DATA_WIDTH-1:0] mem [ADDR_SIZE-1:0];
   initial begin
    $readmemh(FILE_NAME, mem);
   end
    always @(posedge clk) begin
        q <= mem[a];
   end
endmodule