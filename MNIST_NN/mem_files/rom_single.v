//Code for inferred ROM 2^16 address space x 16 bits
module rom (q, d, a, we, clk);
    parameter ADDR_WIDTH=16, 
              DATA_WIDTH=16, 
              ADDR_SIZE=65536, 
              FILE_NAME=" ";

    output [DATA_WIDTH-1:0] q;
    input [DATA_WIDTH-1:0] d;
    input [ADDR_WIDTH-1:0] a;
    input clk;

	reg [DATA_WIDTH-1:0] mem [ADDR_SIZE-1:0];
   initial begin
    $readmemh(FILE_NAME, mem);
   end
    always @(posedge clk) begin
        q <= mem[a];
   end
endmodule