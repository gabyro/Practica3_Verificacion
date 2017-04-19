import Definitions ::*;
module UART_MODULE(
	//Input Ports.
	input clk_low, clk_high,
	input reset,
	input Rx_in,
	input pop,
	input [7:0]output_fifo_value,

	//Output Ports.
	output Tx_out,
	output [7:0]v,
	output UART_FIFOS fifos_out,
	output start,
	output fifo_out_pop,
	output [3:0]n

);

bit [7:0]RxOut_UART_2_RGNandFIFOS_wire;
bit tx_ready;
bit [7:0]L;
//-------wires fifo registers--------------------
bit fifo_row_2_pop;
bit fifo_row_3_pop;
bit fifo_row_4_pop;
UART_CONTROL_SIGNALS control;
bit UART_Rx_interupt;

//----------------------------- CONTROL UART ------------------------------
CONTROL_UART		CONTROL(
	//Input Ports.
	.clk(clk_high),
	.reset(reset),
	.Tx_ready(tx_ready),
	.Rx_interrupt(UART_Rx_interupt),
	.Rx_value(RxOut_UART_2_RGNandFIFOS_wire),
	.N(n),
	.L(L),
	.output_fifo_value(output_fifo_value),
	//Output Ports.
	.control(control)
);

//----------------------------- UART --------------------------------------
UART
#(.WORD_LENGHT (8))
FIRST_PART_UART
(
  //inputs
  .clk(clk_high),
  .rst(reset),
  .Rx_in(Rx_in),
  .Tx_in(control.UART_send_data),
  .send(control.UART_send),
	.clear_interrupt(1'b0),		//Deprecated
  //outputs
  .Rx_out(RxOut_UART_2_RGNandFIFOS_wire),
  .Tx_out(Tx_out),
  .new_Rx(UART_Rx_interupt),
  .Tx_ready(tx_ready),
  .Rx_error(),
	.test()
  );

//--------------------------- N REGISTER ------------------------------------
Register
#(
	.Word_Length (4)
)
REGISTER_N
(
	// Input Ports
	.clk(clk_high),
	.reset(reset),
	.Data_Input(RxOut_UART_2_RGNandFIFOS_wire[3:0]),
	.enable(control.N_register_enable),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(n)
);
//--------------------------- L REGISTER ------------------------------------
Register
#(
	.Word_Length (8)
)
REGISTER_L
(
	// Input Ports
	.clk(clk_high),
	.reset(reset),
	.Data_Input(RxOut_UART_2_RGNandFIFOS_wire),
	.enable(control.L_register_enable),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(L)
);

//--------------------------FIFO vector-----------------------------------------
FIFO_2_clks
#(.WORDLENGHT(8), .Mem_lenght(16))			FIFO_VECTOR
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push(control.push_FIFO1),
	.pop(pop),
	.clk_pop(clk_low),		//Slow
	.clk_push(clk_high),		//Fast
	.reset(reset),
	.synch_rst(control.rst_FIFOS),

	.data_out(v),
	.full_out(),
	.empty_out()
);

//--------------------------FIFO row 1-----------------------------------------
FIFO_2_clks
#(.WORDLENGHT(8), .Mem_lenght(16))			FIFO_ROW_1
(
	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push(control.push_FIFO2),
	.pop(pop),
	.clk_pop(clk_low),		//Slow
	.clk_push(clk_high),		//Fast
	.reset(reset),
	.synch_rst(control.rst_FIFOS),

	.data_out(fifos_out.FIFO1),
	.full_out(),
	.empty_out()
);

//--------------------------FIFO row 2-----------------------------------------
Register
#(	.Word_Length (1))		FIFO_ROW_2_POP_REGISTER
(
	// Input Ports
	.clk(clk_low),
	.reset(reset),
	.Data_Input(pop),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(fifo_row_2_pop)
);

FIFO_2_clks
#(.WORDLENGHT(8), .Mem_lenght(16))			FIFO_ROW_2
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push(control.push_FIFO3),
	.pop(fifo_row_2_pop),
	.clk_pop(clk_low),		//Slow
	.clk_push(clk_high),		//Fast
	.reset(reset),
	.synch_rst(control.rst_FIFOS),

	.data_out(fifos_out.FIFO2),
	.full_out(),
	.empty_out()
);

//--------------------------FIFO row 3-----------------------------------------
Register
#(	.Word_Length (1))		FIFO_ROW_3_POP_REGISTER
(
	// Input Ports
	.clk(clk_low),
	.reset(reset),
	.Data_Input(fifo_row_2_pop),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(fifo_row_3_pop)
);

FIFO_2_clks
#(.WORDLENGHT(8), .Mem_lenght(16))			FIFO_ROW_3
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push(control.push_FIFO4),
	.pop(fifo_row_3_pop),
	.clk_pop(clk_low),		//Slow
	.clk_push(clk_high),		//Fast
	.reset(reset),
	.synch_rst(control.rst_FIFOS),

	.data_out(fifos_out.FIFO3),
	.full_out(),
	.empty_out()
);

//--------------------------FIFO row 4-----------------------------------------
Register
#(	.Word_Length (1))		FIFO_ROW_4_POP_REGISTER
(
	// Input Ports
	.clk(clk_low),
	.reset(reset),
	.Data_Input(fifo_row_3_pop),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(fifo_row_4_pop)
);

FIFO_2_clks
#(.WORDLENGHT(8), .Mem_lenght(16))			FIFO_ROW_4
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push(control.push_FIFO5),
	.pop(fifo_row_4_pop),
	.clk_pop(clk_low),		//Slow
	.clk_push(clk_high),		//Fast
	.reset(reset),
	.synch_rst(control.rst_FIFOS),

	.data_out(fifos_out.FIFO4),
	.full_out(),
	.empty_out()
);

assign fifo_out_pop = control.pop_FIFO_out;

endmodule
