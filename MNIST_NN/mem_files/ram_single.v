//Code for inferred RAM 2^10 address space x 16 bits
module ram_inferred (q, d, a, we, clk);
    parameter ADDR_WIDTH=10, 
              DATA_WIDTH=16, 
              ADDR_SIZE=1024, 
              FILE_NAME=" ";

    output [DATA_WIDTH-1:0] q;
    input [DATA_WIDTH-1:0] d;
    input [ADDR_WIDTH-1:0] a;
    input we;
    input clk;
     
   reg [DATA_WIDTH-1:0] mem [ADDR_SIZE-1:0];
   initial begin
    $readmemh(FILE_NAME, mem);
   end

    always @(posedge clk) begin
        if (we)
            mem[a] <= d;
        q <= mem[a];
   end

endmodule