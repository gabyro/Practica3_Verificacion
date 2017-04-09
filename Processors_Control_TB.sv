import Definitions ::*;
module Processors_Control_TB;
localparam  WORD_LENGHT = 16;
 // Input Ports
reg clk = 0;
reg reset = 1;
reg start = 0;
reg [3:0]N = 4;
PROCESSORS_CONTROL_SIGNALS control;


Processors_Control    DUT
(
  .clk(clk),
  .reset(reset),
  .start(start),
  .N(N),
  //outputs
  .control(control)
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
      N = 4;
  #4  start = 0;
  forever  begin
    #200 start = 1;
        N = N+1;
    #4  start = 0;
  end
end

endmodule
