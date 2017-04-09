module Processor_module(
	//Input ports.
	
	input clk,
	input reset,
	input start,
	input [7:0]a,
	input [7:0]v,
	//Output ports
	output [7:0]v_out,
	output [7:0]result

);

bit [7:0]REG1out_2_AddMult_wire;
bit [7:0]AddMult_out_2_REG1_wire;

//---------------------------- REGISTER 1 ---------------------------------
Register
#(
	.Word_Length (8)
)
Register1

(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(AddMult_out_2_REG1_wire),
	.enable(1'b1),
	.sync_reset(start),

	// Output Ports
	.Data_Output(REG1out_2_AddMult_wire)
);

 assign AddMult_out_2_REG1_wire= REG1out_2_AddMult_wire + (a*v);
 
//----------------------------- REGISTER 2 ----------------------------------
Register
#(
	.Word_Length (8)
)
Register2

(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(v),
	.enable(1'b1),
	.sync_reset(1'b0),

	// Output Ports
	.Data_Output(v_out)
);

assign result = AddMult_out_2_REG1_wire;


endmodule