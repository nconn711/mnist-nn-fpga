module state_machine (
	input logic Clk, Reset, Compute,
	output logic [2:0] Layer,
	output logic [2:0] Active,
	output logic [9:0] Tick,
	output logic ActFuncActive,
	output logic R
);

	logic [9:0] next_tick;
	logic next_R;

	enum logic [4:0] {IDLE, START, DONE, LOAD_1, LOAD_2, LOAD_3, ACT_1, ACT_2, ACT_3} curr_state, next_state;
	
	always_ff @ (posedge Clk) begin
		if (Reset) begin
			curr_state <= IDLE;
			Tick <= 9'b0;
			R <= 1'b1;
		end
		else begin
			curr_state <= next_state;
			Tick <= next_tick;
			R <= next_R;
		end
	end
	
	always_comb begin
	
		next_state = curr_state;
		next_tick = Tick;
		next_R = R;
		Layer = 3'b0;
		Active = 3'b0;
		ActFuncActive = 1'b0;
		
		unique case (next_state)
			IDLE:		if (Compute)
							next_state = START;
			START:		next_state = LOAD_1;
			LOAD_1:		if (Tick > 785 + 4)
							next_state = ACT_1;
			ACT_1:		if (Tick > 20 + 2)
							next_state = LOAD_2;
			LOAD_2:		if (Tick > 21 + 4)
							next_state = ACT_2;
			ACT_2:		if (Tick > 20 + 2)
							next_state = LOAD_3;
			LOAD_3:		if (Tick > 21 + 4)
							next_state = ACT_3;
			ACT_3:		if (Tick > 10 + 2)
							next_state = DONE;
			DONE:		if (~Compute)
							next_state = IDLE;
		endcase
		
		unique case (curr_state)
			IDLE, DONE:	next_R = 1'b1;
			LOAD_1:	begin 
						if (next_state == ACT_2)
							next_tick = 9'b0;
						else begin
							next_tick = Tick + 1;
							Layer = 3'b001;
							if (Tick >= 2)
								Active = 3'b001;
						end
					end
			ACT_1:	begin 
						if (next_state == LOAD_2)
							next_tick = 9'b0;
						else begin
							next_tick = Tick + 1;
							Layer = 3'b001;
							if (Tick >= 2)
								ActFuncActive = 1'b1;
						end
					end
			LOAD_2:	begin 
						if (next_state == ACT_2)
							next_tick = 9'b0;
						else begin
							next_tick = Tick + 1;
							Layer = 3'b010;
							if (Tick >= 2)
								Active = 3'b010;
						end
					end
			ACT_2:	begin 
						if (next_state == LOAD_3)
							next_tick = 9'b0;
						else begin
							next_tick = Tick + 1;
							Layer = 3'b001;
							if (Tick >= 2)
								ActFuncActive = 1'b1;
						end
					end
			LOAD_3:	begin 
						if (next_state == ACT_3) begin
							next_tick = 9'b0;
						end
						else begin
							next_tick = Tick + 1;
							Layer = 3'b100;
							if (Tick >= 2)
								Active = 3'b100;
						end
					end
			ACT_3:	begin 
						if (next_state == DONE)
							next_tick = 9'b0;
						else begin
							next_tick = Tick + 1;
							Layer = 3'b001;
							if (Tick >= 2)
								ActFuncActive = 1'b1;
						end
					end
								
		endcase
		
	end
	
endmodule