`ifndef ALU_random_sequence
`define ALU_random_sequence


class ALU_random_sequence extends uvm_sequence#(tar_alu_sequence_item);
    `uvm_object_utils(ALU_random_sequence)
    
    //constructor
  function new(string name="ALU_random_sequence");
           super.new(name);
        endfunction
    
        //body task
        virtual task body();
          tar_alu_sequence_item req = tar_alu_sequence_item::type_id::create("req");
         
          // Reset transaction
          req.rst = 1;
          start_item(req); 
          `uvm_info(get_type_name(), "Reset the DUT", UVM_NONE)
          finish_item(req);
          `uvm_info(get_type_name(), "Reset deactiveted ", UVM_NONE)
          #10;
           
  
          req.randomize() with {rst == 0;};
              start_item(req);

              finish_item(req);
         
      endtask
    
    endclass

    `endif // End of include guard
