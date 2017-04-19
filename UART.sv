import Definitions ::*;
module UART
#(parameter WORD_LENGHT = 8)
(
  //inputs
  input clk,
  input rst,
  input Rx_in,
  input [WORD_LENGHT-1:0] Tx_in,
  input send,
  input clear_interrupt,  //Deprecated
  //outputs
  output [WORD_LENGHT-1:0]Rx_out,
  output Tx_out,
  output new_Rx,
  output Rx_error,
  output Tx_ready,
  output test
  );
  //--------------------------------Wires--------------------------------------
  bit one_shot_send;

  //--------------------------------One Shot-----------------------------------
  	ONEshot					ONE_SHOT_START
	(
		 .in(send),
		 .clk(clk),
		 .reset(rst),
		 .out(one_shot_send)
	);


  //---------------------UART transmission-------------------------
  UART_TX
  #(.WORD_LENGHT(WORD_LENGHT))      TRANSMITTER
  (
    //inputs
    .clk(clk),
    .rst(rst),
    .Tx_in(Tx_in),
    .send(one_shot_send),
    //outputs
    .Tx_out(Tx_out),
    .Tx_ready(Tx_ready)
    );

   //-------------------------- UART RX -------------------------------------------------
   UART_RX
   #(.WORD_LENGHT(WORD_LENGHT)) RECEPTION
   (
     //inputs
     .clk(clk),
     .rst(rst),
     .RX_in(Rx_in),
     .clear_interrupt(clear_interrupt),
     //outputs
     .RX_out(Rx_out),
     .received(new_Rx),
	  .Rx_error(Rx_error)
     );

endmodule
