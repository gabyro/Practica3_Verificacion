module CONTROL_UART(
	//Input Ports.
	input clk,
	input reset,
	input fifo_ready,
	input Tx_ready,
	input Rx_interrupt,
	input Rx_value,
	//Output Ports.
	output UART_CONTROL_SIGNALS control
);

enum int unsigned {IDLE, LENGHT, CMD, CMD1, CMD2, CMD3, CMD4, SEND_FE, SEND_FE2, SEND_L, SEND_L2, FIFO_POP, FIFO_POP2, FIFO_POP3 SEND_EF, SEND_EF2, MATRIX, SAVE_MATRIX, VECTOR, SAVE_VECTOR} state, next_state;

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
        if( Rx_interrupt & (Rx_value == 0xFE) )
          next_state = LENGHT;
        else
          next_state = IDLE;
    LENGHT:
        if(Rx_interrupt)
          next_state = CMD;
        else
          next_state = LENGHT;
    CMD:
        if( Rx_interrupt )
					if(Rx_value == 0x01)
	          next_state = CMD1;
	        else if(Rx_value == 0x02)
	          next_state = CMD2;
	        else  if(Rx_value == 0x03)
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
          next_state = SEND_FE2;
		SEND_FE2:
				if(Tx_ready)
					next_state = SEND_L;
				else
					next_state = SEND_FE2;
    SEND_L:
          next_state = SEND_L2;
		SEND_L2:
        if(Tx_ready)
          next_state = FIFO_POP;
        else
          next_state = SEND_L2;
    FIFO_POP:
          next_state = FIFO_POP2;
		FIFO_POP2:
				if(~fifo_ready)
					next_state = FIFO_POP2;
				else
					next_state = FIFO_POP3;
		FIFO_POP3:
				if(fifo_ready)
					next_state = FIFO_POP3;
				else
					if(count <N-1)
						next_state = FIFO_POP;
					else
						next_state = SEND_EF;
		SEND_EF:
          next_state = SEND_EF2;
		SEND_EF2:
				if(Tx_ready)
					next_state = IDLE;
				else
					next_state = SEND_EF2;
    CMD3:
        next_state = IDLE;
    CMD4:
        if(Rx_interrupt)
          next_state = MATRIX;
        else
          next_state = CMD4;
		MATRIX:


    S8:
        next_state = IDLE;
	endcase
end

endmodule
