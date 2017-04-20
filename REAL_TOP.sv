module REAL_TOP(
	//Input Ports.
  input clk,
  input reset,
  input Rx,

  //Output Ports.
  output Tx,
  output test

);
bit clk_1MHZ /*synthesis keep*/;
bit clk_115k /*synthesis keep*/;
bit clk_1k /*synthesis keep*/;

//--------------------------------PLL------------------------------------------
PLL NUESTRO_PLL(
	.areset(~reset),
	.inclk0(clk),
	.c0(clk_1MHZ),
	.locked()
	);

Clk_Divider
	#(.Freq_in(1000000), .Freq_out(115200))		DIVISOR_115
	(
	//Input ports
	.clk_FPGA(clk_1MHZ),
	.reset(reset),

	//Output ports
	.clk_signal(clk_115k)

);

Clk_Divider
	#(.Freq_in(1000000), .Freq_out(1000))		DIVISOR_1k
	(
	//Input ports
	.clk_FPGA(clk_1MHZ),
	.reset(reset),

	//Output ports
	.clk_signal(clk_1k)

);


//------------------------------NOT TOP----------------------------------------
 Top NOT_TOP(
 	//Input Ports.
 	.clk_low(clk_1k),
 	.clk_high(clk_115k),
 	.reset(reset),
 	.synch_rst(1'b0),
 	.Rx_in(Rx),

 	//Output Ports.
 	.Tx_out(Tx)

 );

endmodule
