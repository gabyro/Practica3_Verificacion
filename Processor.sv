module Processor_module(
	//Input ports.
	
	input clk,
	input reset,
	input start,
	input a,
	input v,
	//Output ports
	output v_out,
	output result

);

bit REG1out_2_AddMult_wire;
bit AddMult_out_2_REG1_wire;

//---------------------------- REGISTER 1 ---------------------------------
Register
#(
	.Word_Length (8)
)

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
Register_Processor

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

assign result = AddOrMult_out_2_MUX_wire;


endmodule