`ifndef monitor_sv
`define monitor_sv



class tar_alu_monitor extends uvm_monitor;
  `uvm_component_utils(tar_alu_monitor)
  virtual tar_alu_interface vif;
  uvm_analysis_port#(tar_alu_sequence_item) port;
  tar_alu_sequence_item packet;

  function new(string name="tar_alu_monitor",uvm_component parent);
    super.new(name,parent);
    port=new("port",this);
    packet=new();
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#( virtual tar_alu_interface )::get(this,"","vif",vif))
            `uvm_fatal(get_type_name(),"can't access interface");

  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
       @(vif.MONITOR_CB)
     packet.A = vif.MONITOR_CB.A;
      packet.B = vif.MONITOR_CB.B;
      packet.rst = vif.MONITOR_CB.rst;

      packet.opcode = vif.MONITOR_CB.opcode;
    `uvm_info(get_type_name(),$sformatf("input sampled are : rst=%d A= %d  B=%d opcode=%h",packet.rst,packet.A,packet.B,packet.opcode),UVM_LOW);
     packet.Result = vif.MONITOR_CB.Result;
     packet.Error= vif.MONITOR_CB.Error;
    `uvm_info(get_type_name(),$sformatf("outputs sampled are : result= %d  Error=%d",packet.Result,packet.Error),UVM_LOW);
    port.write(packet);
    end
   
  endtask
endclass





  `endif // End of include guard
