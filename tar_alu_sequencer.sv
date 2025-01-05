`ifndef tar_alu_sequencer
`define tar_alu_sequencer


class tar_alu_sequencer extends uvm_sequencer #(tar_alu_sequence_item);
    //register to the factory 
        `uvm_component_utils(tar_alu_sequencer)
    //constructor
    function new(string name="tar_alu_sequencer",uvm_component parent);
      super.new(name,parent);
    endfunction
        endclass

        `endif // End of include guard
