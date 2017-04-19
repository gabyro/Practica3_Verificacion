module syncronizer_start
(
  input asynch,
  input clk_low,
  input clk_high,
  input rst,
  output synch
  );
//------------------------wires---------------------------
  bit meta_wire;
  bit Reg2out_2_rstReg1_wire;

  Register
#(.Word_Length(1))     REGISTER_1
 (
   // Input Ports
   .clk(clk_high),
   .reset(rst),
   .Data_Input(asynch),
   .enable(asynch||Reg2out_2_rstReg1_wire),
   .sync_reset(Reg2out_2_rstReg1_wire),
   // Output Ports
   .Data_Output(meta_wire)
 );

 Register
  #(.Word_Length(1))     REGISTER_2
  (
    // Input Ports
    .clk(clk_low),
    .reset(rst),
    .Data_Input(meta_wire),
    .enable(1'b1),
    .sync_reset(1'b0),
    // Output Ports
    .Data_Output(Reg2out_2_rstReg1_wire)
  );
endmodule