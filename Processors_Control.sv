import Definitions ::*;
module Processors_Control
(
  input clk, reset,
  input start,
  input [3:0]N,
  //outputs
  output PROCESSORS_CONTROL_SIGNALS control
);
//--------------------------Wires--------------------------------------
bit counter_sync_rst;
bit [4:0]counter_value;

enum int unsigned {IDLE, WIPE_FIFO, PROCESSING, S1, S2, S3, S4, S5, S6, S7, S8} state, next_state;

//-----------------Cambio de estado secuencial---------------------
always_ff@(posedge clk or negedge reset) begin
	if(~reset)
		state <= IDLE;
	else
		state <= next_state;
end

//------------Logica combinacional del proximo estado---------------
always_comb begin : next_state_logic
	next_state = IDLE;
	case(state)
		IDLE:
        if(start)
          next_state = WIPE_FIFO;
        else
          next_state = IDLE;
    WIPE_FIFO:
        if(N == 1)
          next_state = S1;
        else
          next_state = PROCESSING;
    PROCESSING:
        if(counter_value == (N-2))
          next_state = S1;
        else if(counter_value == 2*N-2)     //Revisar que si haga corrimiento en vez de multiplicador
          next_state = S5;
        else
          next_state = PROCESSING;
    S1:
        if(N > 1)
          next_state = S2;
        else
          next_state = IDLE;
    S2:
        if(N > 2)
          next_state = S3;
        else
          next_state = IDLE;
    S3:
        if(N > 3)
          next_state = S4;
        else
          next_state = IDLE;
    S4:
        if(N > 4)
          next_state = PROCESSING;
        else
          next_state = IDLE;
    S5:
        if(N > 5)
          next_state = S6;
        else
          next_state = IDLE;
    S6:
        if(N > 6)
          next_state = S7;
        else
          next_state = IDLE;
    S7:
        if(N > 7)
          next_state = S8;
        else
          next_state = IDLE;
    S8:
        next_state = IDLE;
	endcase
end

//----------------lógica combinación de salidas--------------------
always_comb begin
	//Outputs
	control = 0;
  counter_sync_rst = 0;


	case(state)
    IDLE: begin
      control = 0;
      counter_sync_rst = 1;
      control.rst_processor = 1'b1;
    end
    WIPE_FIFO:  begin
      counter_sync_rst = 1;
      control.rst_FIFO_out = 1;
      control.rst_processor = 1'b1;
    end
    PROCESSING:
      control.pop_a_v = 1'b1;
    S1: begin
        control.rst_processor = 1'b1;
        control.push_result = 1'b1;
        control.processor_number = 2'b00;
        control.pop_a_v = 1'b1;
    end
    S2: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b01;
        control.pop_a_v = 1'b1;
    end
    S3: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b10;
        control.pop_a_v = 1'b1;
    end
    S4: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b11;
        control.pop_a_v = 1'b1;
    end
    S5: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b00;
        control.pop_a_v = 1'b1;
    end
    S6: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b01;
        control.pop_a_v = 1'b1;
    end
    S7: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b10;
        control.pop_a_v = 1'b1;
    end
    S8: begin
        control.push_result = 1'b1;
        control.processor_number = 2'b11;
        control.pop_a_v = 1'b1;
    end
	endcase
end

//---------------------------Counter----------------------------------------
CounterParameter
#(.Maximum_Value())       COUNTER
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.SyncReset(counter_sync_rst),
	// Output Ports
	.Flag(),
	.Counting(counter_value)
);

endmodule

bit rst_processor;
bit push_result;
bit pop_a_v;
bit [3:0]processor_number;
