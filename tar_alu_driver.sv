`ifndef tar_alu_driver
`define tar_alu_driver


class tar_alu_driver extends uvm_driver#(tar_alu_sequence_item);
  //register driver to factory
  `uvm_component_utils(tar_alu_driver)
  //declare an interface handle
  virtual tar_alu_interface vif;
  //constructor
  function new(string name="tar_alu_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual tar_alu_interface)::get(this,"","vif",vif))
      `uvm_fatal(get_type_name(),"can't access interface");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      driving();
      `uvm_info(get_type_name(),$sformatf(" rst=%d A=%d, B=%d, opcode=%h",req.rst,req.A,req.B,req.opcode),UVM_LOW);
      seq_item_port.item_done();
      
      
    end
  endtask
  
  task driving ();
    @(vif.DRIVER_CB)
    vif.DRIVER_CB.rst<=req.rst;
    vif.DRIVER_CB.A<=req.A;
    vif.DRIVER_CB.B <=req.B;
    vif.DRIVER_CB.opcode<=req.opcode;
    
  endtask
endclass


  `endif // End of include guard
