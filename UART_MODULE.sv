module UART_MODULE(
	//Input Ports.
	input clk,
	input reset,
	input Rx_in,
	input Tx_in,
	input pop,
	
	//Output Ports.
	output Tx_out,
	output v,
	output UART_FIFOS fifos_out,
	output start,
	output n

);

bit [7:0]RxOut_UART_2_RGNandFIFOS_wire;
bit Reg1out_2_FIFO3_wire;
bit Reg2out_2_FIFO4_wire;
bit Reg3out_2_FIFO5_wire;

//----------------------------- CONTROL UART ------------------------------

//----------------------------- UART --------------------------------------
.UART
#(.WORD_LENGHT (8), .FREQUENCY (50000000), .BAUDRATE(9600) )
FIRST_PART_UART
(
  //inputs
  .clk(clk),
  .rst(reset),
  .Rx_in(Rx_in),
  .Tx_in(Tx_in),
  .send(),
  //outputs
  .Rx_out(RxOut_UART_2_RGNandFIFOS_wire),
  .Tx_out(Tx_out),
  .new_Rx(),
  .Tx_ready()
  );
 
//--------------------------- N REGISTER ------------------------------------
Register
#(
	.Word_Length (4)
)
REGISTER_N
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(RxOut_UART_2_RGN_wire),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(n)
);
 
//--------------------------- 3 REGISTERS -----------------------------------


Register
#(
	.Word_Length (1)
)
REGISTER_1
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(pop),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(Reg1out_2_FIFO3_wire)
);

Register
#(
	.Word_Length (1)
)
REGISTER_2
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(Reg1out_2_FIFO3_wire),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(Reg2out_2_FIFO4_wire)
);

Register
#(
	.Word_Length (1)
)
REGISTER_3
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(Reg2out_2_FIFO4_wire),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(Reg3out_2_FIFO5_wire)
);

//--------------------------- 5 FIFOS ---------------------------------------
FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_1
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push( || pop),
	.pop(pop),
	.clk(clk),
	.reset(reset),
	.synch_rst(),
	
	.data_out(fifos_out.FIFO1),
	.full_out(),
	.empty_out()

);

FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_2
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push( ||pop),
	.pop(pop),
	.clk(clk),
	.reset(reset),
	.synch_rst(),
	
	.data_out(fifos_out.FIFO2),
	.full_out(),
	.empty_out()

);


FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_3
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push( || Reg1out_2_FIFO3_wire),
	.pop(Reg1out_2_FIFO3_wire),
	.clk(clk),
	.reset(reset),
	.synch_rst(),
	
	.data_out(fifos_out.FIFO3),
	.full_out(),
	.empty_out()

);

FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_4
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push( ||Reg2out_2_FIFO4_wire),
	.pop(Reg2out_2_FIFO4_wire),
	.clk(clk),
	.reset(reset),
	.synch_rst(),
	
	.data_out(fifos_out.FIFO4),
	.full_out(),
	.empty_out()

);

FIFO
#(.WORDLENGHT(8), .Mem_lenght(8))
FIFO_5
(

	.data_input(RxOut_UART_2_RGNandFIFOS_wire),
	.push( ||Reg3out_2_FIFO5_wire),
	.pop(Reg3out_2_FIFO5_wire),
	.clk(clk),
	.reset(reset),
	.synch_rst(),
	
	.data_out(fifos_out.FIFO5),
	.full_out(),
	.empty_out()

);

endmodule
