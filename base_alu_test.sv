  
`ifndef base_alu_test
`define base_alu_test

`include "package.sv"


class base_alu_test extends uvm_test;
    Alu_env env;
    `uvm_component_utils(base_alu_test)


    function new(string name="base_alu_test",uvm_component parent);
     super.new(name,parent);
    endfunction

   function void  build_phase (uvm_phase phase);
   super.build_phase(phase);
   env=Alu_env::type_id::create("env",this);
   endfunction
  
   function void  end_of_elaboration_phase  (uvm_phase phase);
    super.end_of_elaboration_phase (phase);
    `uvm_info(get_type_name(), "End of elaboration phase: verifying component setup", UVM_MEDIUM);
    uvm_top.print_topology();
endfunction


endclass


`endif // End of include guard
