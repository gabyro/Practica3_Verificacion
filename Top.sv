import Definitions ::*;
module Top(
	//Input Ports.
	input clk_low,
	input clk_high,
	input reset,
	input synch_rst,
	input Rx_in,

	//Output Ports.
	output Tx_out

);


PROCESSOR_RESULT result_PROARRAY_2_BIGMUX_wire /*synthesis keep*/;
bit [7:0]BIGMUXout_2_MUX_wire;
bit [7:0]MUXout_2_FIFO_wire;
bit [7:0]FIFOout_2_UARTandMUX_wire;
bit FIFOempty_2_UART_wire;
bit FIFOfull_2_UART_wire;
bit FIFO_push;
bit [7:0]UART_V_2_PROARRAY_wire /*synthesis keep*/;
bit UARTModule_START_2_SYNCH_wire /*synthesis keep*/;
bit UARTModule_START_SYNCH_2_CONTROL_wire;
bit [3:0]UARTModule_N_2_Control_wire;
bit UARTout_2_FIFOpop_wire;


PROCESSORS_CONTROL_SIGNALS processor_control /*synthesis keep*/;
Rows_a_FIFO struct_fifos_result /*synthesis keep*/;

//-------------------------fifo wires-------------------------------------
bit ONESHOTout_2_FIFOpush_wire;


//--------------------- UART MODULE --------------------------------------
UART_MODULE UART_MOD
(
	//Input Ports.
	.clk_low(clk_low),
	.clk_high(clk_high),
	.reset(reset),
	.Rx_in(Rx_in),
	.pop(processor_control.pop_a_v),
	.reset_fifos(processor_control.rst_FIFO_in),
	.output_fifo_value(FIFOout_2_UARTandMUX_wire),

	//Output Ports.
	.Tx_out(Tx_out),
	.v(UART_V_2_PROARRAY_wire),
	.fifos_out(struct_fifos_result),
	.start(UARTModule_START_2_SYNCH_wire),
	.fifo_out_pop(UARTout_2_FIFOpop_wire),
	.n(UARTModule_N_2_Control_wire)

);
//------------------------Synchronizer------------------------------------
syncronizer_start SYNCH
(
  .asynch(UARTModule_START_2_SYNCH_wire),
  .clk_low(clk_low),
  .clk_high(clk_high),
  .rst(reset),
  .synch(UARTModule_START_SYNCH_2_CONTROL_wire)
  );



//--------------------- PROCESSORS ARRAY ---------------------------------
Processors_Array		PROCESSORS(
	//Input Ports.
	.clk(clk_low),
	.reset(reset),
	.start(processor_control.rst_processor),
	.v(UART_V_2_PROARRAY_wire),
	.Row(struct_fifos_result),

	//Output Ports.
	.result(result_PROARRAY_2_BIGMUX_wire)

);

//---------------------- MUX 4 A 1 ----------------------------------------
Multiplexers_4_to_1
#(.WORD_LENGHT(8))
BIG_MUX

(
	// Input Ports
	.Selector(processor_control.processor_number),
	.Data_0(result_PROARRAY_2_BIGMUX_wire.result_PRO1),
	.Data_1(result_PROARRAY_2_BIGMUX_wire.result_PRO2),
	.Data_2(result_PROARRAY_2_BIGMUX_wire.result_PRO3),
	.Data_3(result_PROARRAY_2_BIGMUX_wire.result_PRO4),

	// Output Ports
	.Mux_Output_log(BIGMUXout_2_MUX_wire)

);

//------------------------ MUX ---------------------------------------------
Multiplexers
#(.WORD_LENGHT(8))
MUX
(
	// Input Ports
	.Selector(UARTout_2_FIFOpop_wire),
	.Data_0(BIGMUXout_2_MUX_wire),
	.Data_1(FIFOout_2_UARTandMUX_wire),

	// Output Ports
	.Mux_Output_log(MUXout_2_FIFO_wire)

);

//---------------------- ONE SHOT PUSH CONTROL-----------------------------------------
ONEshot oneshot(
 .in(processor_control.push_result),
 .clk(clk_high),
 .reset(~clk_low),
 .out(ONESHOTout_2_FIFOpush_wire)
);


//---------------------- FIFO ----------------------------------------------
assign FIFO_push = UARTout_2_FIFOpop_wire || ONESHOTout_2_FIFOpush_wire;
FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_P3
(

	.data_input(MUXout_2_FIFO_wire),
	.push(FIFO_push),
	.pop(UARTout_2_FIFOpop_wire),
	.clk(clk_high),
	.reset(reset),
	.synch_rst(processor_control.rst_FIFO_out),

	.data_out(FIFOout_2_UARTandMUX_wire),
	.full_out(FIFOfull_2_UART_wire),
	.empty_out(FIFOempty_2_UART_wire)

);

//--------------------------------Control-------------------------------------
Processors_Control			CONTROL_PROCESSORS
(
   .clk(clk_low),
	.reset(reset),
   .start(UARTModule_START_SYNCH_2_CONTROL_wire),			//Falta start UART
   .N(UARTModule_N_2_Control_wire),					//Falta start UART
  //outputs
   .control(processor_control)
);


endmodule
