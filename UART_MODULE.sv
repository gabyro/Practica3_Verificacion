module UART_MODULE(
	//Input Ports.
	input clk,
	input reset,
	
	//Output Ports.

);

.UART
#(.WORD_LENGHT (8), .FREQUENCY (50000000), .BAUDRATE(9600) )
FIRST_PART_UART
(
  //inputs
  .clk(),
  input rst,
  input Rx_in,
  input [WORD_LENGHT-1:0] Tx_in,
  input send,
  //outputs
  output [WORD_LENGHT-1:0]Rx_out,
  output Tx_out,
  output new_Rx,
  output Tx_ready
  );

endmodule
