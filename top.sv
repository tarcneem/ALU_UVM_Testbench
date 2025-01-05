

`include "tar_alu_interface.sv"
`include "base_alu_test.sv"
`include "ALU_regression_Test.sv"

import uvm_pkg::*;
`include "uvm_macros.svh"
module ALU_TB_top();
    logic clk;

  tar_alu_interface vif(.clk(clk));

    //generate clock of 100MHz
always #5 clk=~clk;
    initial begin
      clk = 0;
      
  end
  
  
    ALU DUT(
      .clk(vif.clk),
      .rst(vif.rst),
      .A(vif.A),
      .B(vif.B),
      .Opcode(vif.opcode), 
      .Result(vif.Result),
      .Error(vif.Error)
  );

initial begin
    uvm_config_db#(virtual tar_alu_interface)::set(null,"*","vif",vif);
   run_test("ALU_regression_Test");
end

endmodule