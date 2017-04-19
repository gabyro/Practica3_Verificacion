module UART_MODULE_TB;
  localparam  WORD_LENGHT = 8;
   // Input Ports
  reg clk = 0;
  reg reset = 1;
  reg send = 0;
  reg value = 1;

  reg [7:0]numero = 8'b1101_1011;

  UART_MODULE   DUT(
  	//Input Ports.
  	.clk_low(clk), .clk_high(clk),
  	.reset(reset),
  	.Rx_in(value),
  	.pop(1'b0),
  	.output_fifo_value(8'b1010_1010),
    .reset_fifos(1'b0),

  	//Output Ports.
  	.Tx_out(),
  	.v(),
  	.fifos_out(),
  	.start(),
  	.fifo_out_pop(),
  	.n()

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

  initial
    begin
    #200
      //Start
      //---------------------------Comando 1------------------------------
      #4 value = 0;
         numero = 'hFE;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //L
      #40 value = 0;
         numero = 'h3;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //CMD
      #40 value = 0;
         numero = 'h01;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //N
      #40 value = 0;
         numero = 'h5;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //END
      #40 value = 0;
         numero = 'hEF;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      //---------------------------Comando 4 matriz------------------------------
      #100
      //Start
      #4 value = 0;
         numero = 'hFE;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //L
      #40 value = 0;
         numero = 'h1a;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //CMD
      #40 value = 0;
         numero = 'h04;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //datos
      #40 value = 0;
         numero = 'h00;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h01;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h02;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h03;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h04;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h05;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h06;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h07;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h08;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h09;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h0a;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h0b;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h0c;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h0d;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h0e;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h0f;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h10;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h11;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h12;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h13;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h14;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h15;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h16;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h17;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h18;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h19;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //END
      #40 value = 0;
         numero = 'hEF;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //---------------------------Comando 4 vector------------------------------
      #100
      //Start
      #4 value = 0;
         numero = 'hFE;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //L
      #40 value = 0;
         numero = 'h06;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //CMD
      #40 value = 0;
         numero = 'h04;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //datos
      #40 value = 0;
         numero = 'h00;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h01;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h02;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h03;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

      #40 value = 0;
         numero = 'h04;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //END
      #40 value = 0;
         numero = 'hEF;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //---------------------------Comando 2 resultado------------------------------
      #100
      //Start
      #4 value = 0;
         numero = 'hFE;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //L
      #40 value = 0;
         numero = 'h01;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //CMD
      #40 value = 0;
         numero = 'h02;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;
      //END
      #40 value = 0;
         numero = 'hEF;
      #4  value = numero[0];
      #4  value = numero[1];
      #4  value = numero[2];
      #4  value = numero[3];
      #4  value = numero[4];
      #4  value = numero[5];
      #4  value = numero[6];
      #4  value = numero[7];
      #4 value = ^numero;
      #4 value = 1;

    end

endmodule
