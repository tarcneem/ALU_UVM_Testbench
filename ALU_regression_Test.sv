`include "Alu_env.sv"



class ALU_regression_Test extends base_alu_test;

 
  `uvm_component_utils(ALU_regression_Test)


// Constructor  
function new(string name = "ALU_regression_Test",uvm_component parent);  
  super.new(name,parent);  
endfunction  



ALU_random_sequence rand_trans = ALU_random_sequence::type_id::create("rand_trans");

Alu_add_sequence add_trans = Alu_add_sequence::type_id::create("add_trans");

Alu_sub_sequence sub_trans = Alu_sub_sequence::type_id::create("sub_trans");

Alu_and_sequence and_trans = Alu_and_sequence::type_id::create("and_trans");

Alu_or_sequence or_trans = Alu_or_sequence::type_id::create("or_trans");

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);


  rand_trans.start(env.agent.sqr);
  add_trans.start(env.agent.sqr);
  sub_trans.start(env.agent.sqr);
  and_trans.start(env.agent.sqr);
  or_trans.start(env.agent.sqr);

phase.drop_objection(this);
`uvm_info(get_type_name(), "End of ALU regression test", UVM_LOW);
endtask

endclass
