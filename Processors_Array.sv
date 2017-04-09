include Definitions ::*;

module Processors_Array(
	//Input Ports.
	input clk,
	input reset,
	inout start,
	input v,
	input Rows_a_FIFO,
	
	//Output Ports.
	output PROCESSOR_RESULT

);

bit REG1Out_2_REG2_wire;
bit REG2Out_2_REG3_wire;
bit REG3Out_2_PRO_wire;

bit v_out_PRO1_2_PRO2_wire;
bit v_out_PRO2_2_PRO3_wire;
bit v_out_PRO3_2_PRO4_wire;

//---------------------------3 REGISTERS -----------------------------------
Register
#(
	Word_Length (8)
)
REG1
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(start),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(REG1Out_2_REG2_wire)
);

Register
#(
	Word_Length (8)
)
REG2
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(REG1Out_2_REG2_wire),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(REG2Out_2_REG3_wire)
);

Register
#(
	Word_Length (8)
)
REG3
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(REG2Out_2_REG3_wire),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output()
);

//---------------------------4 PROCESSORS -----------------------------------

Processor_module PROCESSOR_1
(
	//Input ports.
	
	.clk(clk),
	.reset(reset),
	.start(start),
	.a(Rows_a_FIFO.Row1),
	.v(v),
	//Output ports
	.v_out(v_out_PRO1_2_PRO2_wire),
	.result(PROCESSOR_RESULT.result_PRO1)

);


Processor_module PROCESSOR_2
(
	//Input ports.
	
	.clk(clk),
	.reset(reset),
	.start(REG1Out_2_REG2_wire),
	.a(Rows_a_FIFO.Row2),
	.v(v_out_PRO1_2_PRO2_wire),
	//Output ports
	.v_out(v_out_PRO2_2_PRO3_wire),
	.result(PROCESSOR_RESULT.result_PRO2)

);

Processor_module PROCESSOR_3
(
	//Input ports.
	
	.clk(clk),
	.reset(reset),
	.start(REG2Out_2_REG3_wire),
	.a(Rows_a_FIFO.Row3),
	.v(v_out_PRO2_2_PRO3_wire),
	//Output ports
	.v_out(v_out_PRO3_2_PRO4_wire),
	.result(PROCESSOR_RESULT.result_PRO3)

);

Processor_module PROCESSOR_4
(
	//Input ports.
	
	.clk(clk),
	.reset(reset),
	.start(REG3Out_2_PRO_wire),
	.a(Rows_a_FIFO.Row4),
	.v(v_out_PRO3_2_PRO4_wire),
	//Output ports
	.v_out(),
	.result(PROCESSOR_RESULT.result_PRO4)

);

//----------------------------------------------------------------------------



endmodule