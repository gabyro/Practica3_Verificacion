module Practica3_Top(
	//Input Ports.
	input clk,
	input reset,
	input synch_rst,
	
	
	//Output Ports.


);


PROCESSOR_RESULT result_PROARRAY_2_BIGMUX_wire;
bit [7:0]BIGMUXout_2_MUX_wire;
bit [7:0]MUXout_2_FIFO_wire;
bit [7:0]FIFOout_2_UARTandMUX_wire;
bit FIFOempty_2_UART_wire;
bit FIFOfull_2_UART_wire;

//		UART WIRES

bit [7:0]UARTout_2_FIFOpop_wire;

//--------------------- UART MODULE --------------------------------------



//--------------------- PROCESSORS ARRAY ---------------------------------
Processors_Array(
	//Input Ports.
	.clk(clk),
	.reset(reset),
	.start(),
	.v(),
	.Rows_a_FIFO Row(),
	
	//Output Ports.
	.PROCESSOR_RESULT result(result_PROARRAY_2_BIGMUX_wire)

);

//---------------------- MUX 4 A 1 ----------------------------------------
.Multiplexers_4_to_1
#(.WORD_LENGHT(8))
BIG_MUX

(
	// Input Ports
	.Selector(),
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

//---------------------- FIFO ----------------------------------------------
.FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_P3
(

	.data_input(MUXout_2_FIFO_wire),
	.push(UARTout_2_FIFOpop_wire || ),
	.pop(UARTout_2_FIFOpop_wire),
	.clk(clk),
	.reset(reset),
	.synch_rst(synch_rst),
	
	.data_out(FIFOout_2_UARTandMUX_wire),
	.full_out(FIFOfull_2_UART_wire),
	.empty_out(FIFOempty_2_UART_wire)

);


endmodule
