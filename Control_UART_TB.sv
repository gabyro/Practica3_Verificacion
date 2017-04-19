import Definitions ::*;
module Control_UART_TB;
localparam  WORD_LENGHT = 16;
 // Input Ports
reg clk = 0;
reg reset = 1;
reg Tx_ready = 0;
reg Rx_interrupt = 0;
reg [7:0]Rx_value = 0;
reg [3:0]N = 4;
reg [7:0]output_fifo_value = 10;
UART_CONTROL_SIGNALS control;

CONTROL_UART      DUT (
	//Input Ports.
	.clk(clk),
	.reset(reset),
	.Tx_ready(Tx_ready),
	.Rx_interrupt(Rx_interrupt),
	.Rx_value(Rx_value),
	.N(N),
	.output_fifo_value(output_fifo_value),
	//Output Ports.
	.control(control)
);

/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 1;
        #4 reset = 0;
	#4 reset = 1;
end


initial begin // Raiz
  //N
  #38 Rx_interrupt = 1;
      Rx_value = 'hfe;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = 'h3;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = 1;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = N;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = 'hef;
  #4  Rx_interrupt = 0;

  //Send result
  #40 Rx_interrupt = 1;
      Rx_value = 'hfe;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = 'h3;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = 'h2;
  #4  Rx_interrupt = 0;
  #40 Rx_interrupt = 1;
      Rx_value = 'hef;
  #4  Rx_interrupt = 0;
  //Send result tx flags
  #40 Tx_ready = 1;
  #8  Tx_ready = 0;
  #40 Tx_ready = 1;
  #8  Tx_ready = 0;
  #40 Tx_ready = 1;
  #12  Tx_ready = 0;
  #40 Tx_ready = 1;
  #12  Tx_ready = 0;
  #40 Tx_ready = 1;
  #12  Tx_ready = 0;
  #40 Tx_ready = 1;
  #12  Tx_ready = 0;
  #40 Tx_ready = 1;
  #12  Tx_ready = 0;
  #40 Tx_ready = 1;
  #12  Tx_ready = 0;



end

endmodule
