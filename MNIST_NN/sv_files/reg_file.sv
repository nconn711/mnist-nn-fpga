module reg_file (
	input logic Clk, Reset,
	input logic W,
	input logic [3:0] Addr,
	input logic [31:0] Write_Data,
	output logic [31:0] Read_Data,
	input logic Done,
	input logic [15:0] Probability [9:0],
	output logic Start
);

	logic [31:0] Register [15:0];

	assign Read_Data = Register[Addr];
	assign Start = Register[10][0];

	always_ff @ (posedge Clk) begin
		for (int i = 0; i < 10; i = i + 1)
			Register[i] <= {16'b0, Probability[i]};
		Register[11][0] <= Done;
		if (Reset)
			Register <= '{16{32'b0}};
		else if (W)
			Register[Addr] <= Write_Data;
	end

endmodule