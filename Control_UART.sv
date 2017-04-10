module CONTROL_UART(
	//Input Ports.
	input clk,
	input reset,
	input start
	//Output Ports.
	output UART_CONTROL_SIGNALS control
);

enum int unsigned {} state, next_state;

//-----------------Cambio de estado secuencial---------------------
always_ff@(posedge clk or negedge reset) begin
	if(~reset)
		state <= IDLE;
	else
		state <= next_state;
end



endmodule
