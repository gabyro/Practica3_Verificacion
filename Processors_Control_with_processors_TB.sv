import Definitions ::*;
module Processors_Control_with_processors_TB;
localparam  WORD_LENGHT = 16;
 // Input Ports
reg clk = 0;
reg reset = 1;
reg start = 0;
reg [3:0]N = 1;
reg [7:0]V = 2;
PROCESSORS_CONTROL_SIGNALS control;
Rows_a_FIFO rows;
PROCESSOR_RESULT result;

Processors_Control    DUT_CONTROL
(
  .clk(clk),
  .reset(reset),
  .start(start),
  .N(N),
  //outputs
  .control(control)
);

Processors_Array    PROCESSORS
(
	//Input Ports.
	.clk(clk),
	.reset(reset),
	.start(control.rst_processor),
	.v(V),
	.Row(rows),

	//Output Ports.
	.result(result)

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
#24 start = 1;
    N = 1;
#4  start = 0;
forever  begin
  #200 start = 1;
      N = N+1;
  #4  start = 0;
end
end

initial begin
	rows.Row1 = 1;
  rows.Row2 = 2;
  rows.Row3 = 3;
  rows.Row4 = 4;
end

endmodule
