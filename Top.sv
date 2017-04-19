module Top(
	//Input Ports.
	input clk_low,
	input clk_high,
	input reset,
	input synch_rst


	//Output Ports.


);


PROCESSOR_RESULT result_PROARRAY_2_BIGMUX_wire;
bit [7:0]BIGMUXout_2_MUX_wire;
bit [7:0]MUXout_2_FIFO_wire;
bit [7:0]FIFOout_2_UARTandMUX_wire;
bit FIFOempty_2_UART_wire;
bit FIFOfull_2_UART_wire;
bit FIFO_push;
PROCESSORS_CONTROL_SIGNALS processor_control;

//-------------------------fifo wires-----------------------------------
bit ONESHOTout_2_FIFOpush_wire;

//--------------------- UART MODULE --------------------------------------




//--------------------- PROCESSORS ARRAY ---------------------------------
Processors_Array		PROCESSORS(
	//Input Ports.
	.clk(clk_low),
	.reset(reset),
	.start(processor_control.rst_processor),
	.v(100),			//Falta conectar a UART
	.Row(100),			//Falta conectar a UART

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
 .reset(reset),
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
  .start(1'b1),			//Falta start UART
  .N(6),					//Falta start UART
  //outputs
  .control(processor_control)
);


endmodule
