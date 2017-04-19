import Definitions ::*;
module CONTROL_UART(
	//Input Ports.
	input clk,
	input reset,
	input Tx_ready,
	input Rx_interrupt,
	input [7:0]Rx_value,
	input [3:0]N,
	input [7:0]output_fifo_value,
	//Output Ports.
	output UART_CONTROL_SIGNALS control
	);

//------------------------------Counter wires----------------------------------
bit counter_sync_rst;
bit counter_enable;
bit [3:0]count;

enum int unsigned {IDLE, LENGHT, CMD, CMD1, CMD2, CMD3, CMD4, SEND_FE, SEND_FE2, SEND_L, SEND_L2, FIFO_SEND, FIFO_POP_WAIT_TX, FIFO_POP, SEND_EF, SEND_EF2, MATRIX, SAVE_MATRIX, VECTOR, SAVE_VECTOR} state, next_state;

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
        if( Rx_interrupt & (Rx_value == 8'hFE) )
          next_state = LENGHT;
        else
          next_state = IDLE;
    LENGHT:
        if(Rx_interrupt)
          next_state = CMD;
        else
          next_state = LENGHT;
    CMD:
        if(~Rx_interrupt)
					next_state = CMD;
				else if(Rx_value == 8'h01)
          next_state = CMD1;
        else if(Rx_value == 8'h02)
          next_state = CMD2;
        else  if(Rx_value == 8'h03)
          next_state = CMD3;
				else
						next_state = IDLE;
    CMD1:
        if(Rx_interrupt)
          next_state = IDLE;
        else
          next_state = CMD1;
    CMD2:
        if(Rx_interrupt)
          next_state = SEND_FE;
        else
          next_state = CMD2;
    SEND_FE:
				if(Tx_ready)
          	next_state = SEND_FE;
				else
						next_state = SEND_FE2;
		SEND_FE2:
				if(Tx_ready)
					next_state = SEND_L;
				else
					next_state = SEND_FE2;
    SEND_L:
				if(Tx_ready)
						next_state = SEND_L;
				else
						next_state = SEND_L2;
		SEND_L2:
        if(Tx_ready)
          next_state = FIFO_SEND;
        else
          next_state = SEND_L2;
    FIFO_SEND:
				  if(Tx_ready)
						next_state = FIFO_SEND;
					else
          	next_state = FIFO_POP_WAIT_TX;
		FIFO_POP_WAIT_TX:
				if(Tx_ready)
					next_state = FIFO_POP;
				else
					next_state = FIFO_POP_WAIT_TX;
		FIFO_POP:
				if(count < N-1)
					next_state = FIFO_SEND;
				else
					next_state = SEND_EF;
		SEND_EF:
					if(Tx_ready)
						next_state = SEND_EF;
					else
          next_state = SEND_EF2;
		SEND_EF2:
				if(Tx_ready)
					next_state = IDLE;
				else
					next_state = SEND_EF2;
    CMD3:
        next_state = IDLE;
    // CMD4:
    //     if(Rx_interrupt)
    //       next_state = MATRIX;
    //     else
    //       next_state = CMD4;
		// MATRIX:
		//
		//
    // S8:
    //     next_state = IDLE;
	endcase
end

//----------------lógica combinación de salidas--------------------
always_comb begin
	//Outputs
	control = 0;
  counter_sync_rst = 1'b0;
	counter_enable = 1'b0;

	case(state)
		IDLE:	begin

		end
		LENGHT:	begin
			control.L_register_enable = 1;
		end
		CMD:	begin

		end
		CMD1:	begin
			control.N_register_enable = 1;
		end
		CMD2:	begin

		end
		SEND_FE:	begin
			control.UART_send = 1;
			control.UART_send_data = 8'hFE;
		end
		SEND_FE2:	begin
			control.UART_send_data = 8'hFE;
		end
		SEND_L:	begin
			control.UART_send = 1;
			control.UART_send_data = N+1;
		end
		SEND_L2:	begin
			control.UART_send_data = N+1;
			counter_sync_rst = 1'b1;
		end
		FIFO_SEND:	begin
			control.UART_send = 1;
			control.UART_send_data = output_fifo_value;
		end
		FIFO_POP_WAIT_TX:	begin
			control.UART_send_data = output_fifo_value;
		end
		FIFO_POP:	begin
			control.pop_FIFO_out = 1;
			counter_enable = 1'b1;
		end
		SEND_EF:	begin
			control.UART_send = 1;
			control.UART_send_data = 8'hEF;
		end
		SEND_EF2:	begin
			control.UART_send_data = 8'hEF;
		end
		CMD3:	begin

		end
	endcase
end


CounterParameter
#(.Maximum_Value (9))				COUNTER
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.enable(counter_enable),
	.SyncReset(counter_sync_rst),

	// Output Ports
	.Flag(),
	.Counting(count)
);

endmodule
