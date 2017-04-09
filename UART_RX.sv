import Definitions ::*;
module UART_RX
#(parameter WORD_LENGHT = 8, FREQUENCY = 50000000, BAUDRATE = 9600 )
(
  //inputs
  input clk,
  input rst,
  input RX_in,
  //outputs
  output [WORD_LENGHT-1:0]RX_out,
  output received
  );

//------------------frequency div wires----------------------
  bit baudrate_clk;
//---------------------Sincronizer wires-------------------
  bit synch_RX;
  //-----------------RX counter wires------------------------
  bit RX_counter_enable_wire;
  bit RX_flag_wire;
  bit [CeilLog2(WORD_LENGHT+1)-1:0] RX_count_wire;
  //-----------------RX shift register wires----------------
  bit RX_shift_register_enable_wire;
  bit [WORD_LENGHT+2:0]RX_shift_register_out_wire;

//---------------------Sincronizer-------------------
  syncronizer     SYNCH
  (
    .asynch(RX_in),
    .clk(clk),
    .rst(rst),
    .synch(synch_RX)
    );

//-----------------RX counter---------------------------
assign RX_counter_enable_wire = RX_shift_register_enable_wire | ~synch_RX;
CounterParameter
#(.Maximum_Value(WORD_LENGHT+1))      RX_COUNTER
(
	// Input Ports
	.clk(clk),
	.reset(rst),
	.enable(RX_counter_enable_wire),
	.SyncReset(1'b0),
	// Output Ports
	.Flag(RX_flag_wire),
	.Counting(RX_count_wire)
);

//----------------RX register--------------------
assign RX_shift_register_enable_wire = |RX_count_wire;    //Only counts when counter!=0
Register
 #(.Word_Length(WORD_LENGHT+3))     RX_REGISTER
 (
   // Input Ports
   .clk(clk),
   .reset(rst),
   .Data_Input( {synch_RX, RX_shift_register_out_wire[WORD_LENGHT:1]} ),
   .enable(RX_shift_register_enable_wire),
   .sync_reset(RX_counter_enable_wire),
   // Output Ports
   .Data_Output(RX_shift_register_out_wire)
 );


//----------------------------Output signals--------------------------------
assign received = RX_flag_wire;
assign RX_out = RX_shift_register_out_wire[WORD_LENGHT:1];


 endmodule
