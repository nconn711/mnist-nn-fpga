module state_machine (
	input logic Clk, Reset, Compute,
	output logic [2:0] Layer,
	output logic [9:0] Tick,
	output logic LD_IO
);

	logic [9:0] tick, next_tick;
	logic ready, next_ready;
	logic start [4:0];
	logic [2:0] layer, next_layer;
	
	assign Tick = tick;
	assign Layer = layer;

	enum logic [4:0] {IDLE, START, DONE, LAYER_1, LAYER_2, LAYER_3} curr_state, next_state;
	
	always_ff @ (posedge Clk) begin
		if (Reset) begin
			curr_state <= IDLE;
			tick <= 9'b0;
			ready <= 1'b1;
			layer <= 3'b0;
		end
		else begin
			curr_state <= next_state;
			tick <= next_tick;
			ready <= next_ready;
			layer <= next_layer;
		end
	end
	
	always_comb begin
	
		next_state = curr_state;
		next_tick = tick;
		next_ready = ready;
		next_layer = layer;
		LD_IO = 1'b0;
		
		unique case (next_state)
			IDLE:			if (Compute)
								next_state = START;
			DONE:			if (~Compute)
								next_state = IDLE;
			START:		next_state = LAYER_1; // start forward propagation
			LAYER_1:		if (tick > 784 + 3) // change delay maybe
								next_state = LAYER_2;
			LAYER_2:		if (tick > 20 + 3) // ^^
								next_state = LAYER_3;
			LAYER_3:		if (tick > 20 + 3) // ^^
								next_state = DONE;
		endcase
		
		unique case (curr_state)
			IDLE:			next_ready = 1'b1;
			DONE:			next_ready = 1'b1;
			START:	begin
							next_ready = 1'b0;
							next_tick = 9'b0;
							next_layer = 3'b001;
						end
						
			LAYER_1:	begin 
							if (tick > 784)
								LD_IO = 1'b1;
							if (next_state == LAYER_2) begin
								next_tick = 9'b0;
								next_layer = 3'b010;
							end
							else
								next_tick = tick + 1;
						end
			LAYER_2:	begin
							if (tick > 20)
								LD_IO = 1'b1;
							if (next_state == LAYER_3) begin
								next_tick = 9'b0;
								next_layer = 3'b100;
							end
							else
								next_tick = tick + 1;
						end
			LAYER_3:	begin
							if (tick > 20)
								LD_IO = 1'b1;
							if (next_state == DONE) begin
								next_tick = 9'b0;
								next_layer = 3'b000;
							end
							else
								next_tick = tick + 1;
						end
								
		endcase
		
	end
	
endmodule