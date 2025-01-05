`ifndef alu_agent
`define alu_agent
import uvm_pkg::*; // Import UVM package
`include "uvm_macros.svh"
`include "tar_alu_sequence_item.sv" 
`include "tar_alu_driver.sv" 
`include "tar_alu_monitor.sv" 
`include "tar_alu_sequencer.sv" 


class alu_agent extends uvm_agent;
    //register class to factory
    
    `uvm_component_utils(alu_agent)
    function new(string name ="alu_agent",uvm_component parent);
      super.new(name,parent);
    endfunction
    
    //instance handles of components 
    tar_alu_sequencer sqr;
    tar_alu_driver drv;
    tar_alu_monitor mon;
    
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(get_is_active()==UVM_ACTIVE)begin
        drv=tar_alu_driver::type_id::create("drv",this);
        sqr=tar_alu_sequencer::type_id::create("sqr",this);
      end
      mon=tar_alu_monitor::type_id::create("mon",this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if(get_is_active()==UVM_ACTIVE)begin
        drv.seq_item_port.connect(sqr.seq_item_export);
      end
    endfunction
    
    
    
    
    
  endclass

  `endif // End of include guard
