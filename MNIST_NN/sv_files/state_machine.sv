module state_machine (
	input logic Clk, Reset,
	input logic Compute, // start signal for forward propagation
	output logic [2:0] Layer, // layer of neurons we are on
	output logic [2:0] Active, // layer of neurons are active
	output logic [9:0] Tick, // current cycle of state
	output logic ActFuncActive, // activation bit for sigmoid function
	output logic R // ready/done signal
);

	logic [9:0] next_tick;
	logic next_R;

	enum logic [4:0] 	{	
						IDLE, // wait for next compute signal
						START, // sets ready bit to 0 before entering neural network stages
						DONE, // waits until compute signal is low
						LOAD_1, LOAD_2, LOAD_3, // neuron layers compute output in parallel
						ACT_1, ACT_2, ACT_3 // neuron layers compute sigmoid of output in series
						} curr_state, next_state;
	
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
			ACT_1:		if (Tick > 20)
							next_state = LOAD_2;
			LOAD_2:		if (Tick > 21 + 4)
							next_state = ACT_2;
			ACT_2:		if (Tick > 20)
							next_state = LOAD_3;
			LOAD_3:		if (Tick > 21 + 4)
							next_state = ACT_3;
			ACT_3:		if (Tick > 10)
							next_state = DONE;
			DONE:		if (~Compute)
							next_state = IDLE;
		endcase
		
		unique case (curr_state)
			IDLE, DONE:	next_R = 1'b1;
			START: next_R = 1'b0;
			LOAD_1:	begin 
						if (next_state == ACT_1)
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
						end
						Layer = 3'b001;
						if (Tick >= 2)
							ActFuncActive = 1'b1;
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
						end
						Layer = 3'b010;
						if (Tick >= 2)
							ActFuncActive = 1'b1;
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
						end
						Layer = 3'b100;
						if (Tick >= 2)
							ActFuncActive = 1'b1;
					end
								
		endcase
		
	end
	
endmodule