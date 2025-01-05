
class random_test extends base_alu_test;
  `uvm_component_utils(random_test)
      ALU_random_sequence rand_trans;
  
      function new(string name="random_test",uvm_component parent);
      super.new(name,parent);
      endfunction
  
      virtual task run_phase(uvm_phase phase); 
       phase.raise_objection(this);
       rand_trans=ALU_random_sequence::type_id::create("rand_trans");
        repeat(4)begin
          rand_trans.start(env.agent.sqr);
         end
       
       phase.drop_objection(this);
        `uvm_info(get_type_name(),"END of test",UVM_LOW);
  
      endtask
  
  endclass