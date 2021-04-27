module reg_file (
	input logic Clk, Reset,
	input logic W,
	input logic [3:0] Addr, Byte_En,
	input logic [31:0] Write_Data,
	output logic [31:0] Read_Data,
	input logic [127:0] Dec,
	input logic Done,
	output logic [127:0] Key, Enc,
	output logic Start
);

	logic [31:0] Register [15:0];

	assign Read_Data = Register[Addr];

	assign Key = {Register[0], Register[1], Register[2], Register[3]};
	assign Enc = {Register[4], Register[5], Register[6], Register[7]};
	assign Start = Register[14][0];

	always_ff @ (posedge Clk) begin
		Register[11:8] <= '{Dec[31:0], Dec[63:32], Dec[95:64], Dec[127:96]};
		Register[15][0] <= Done;
		if (Reset)
			Register <= '{16{32'b0}};
		else if (W && !(Addr != 4'b1110 && Addr[3])) begin
			Register[Addr][7:0] <= Byte_En[0] ? Write_Data[7:0] : Register[Addr][7:0];
			Register[Addr][15:8] <= Byte_En[1] ? Write_Data[15:8] : Register[Addr][15:8];
			Register[Addr][23:16] <= Byte_En[2] ? Write_Data[23:16] : Register[Addr][23:16];
			Register[Addr][31:24] <= Byte_En[3] ? Write_Data[31:24] : Register[Addr][31:24];
		end
	end

endmodule