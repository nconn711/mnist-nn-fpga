//Code for inferred RAM 2^10 address space x 16 bits
module ram #(parameter ADDR_WIDTH=10, DATA_WIDTH=16, ADDR_SIZE=1024, FILE_NAME=" ")
    (output logic [DATA_WIDTH-1:0] q,
     input logic [DATA_WIDTH-1:0] d,
     input logic [ADDR_WIDTH-1:0] a,
     input logic we, clk);
     
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