/*import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "tar_alu_sequence_item.sv" */
class Alu_add_sequence extends uvm_sequence#(tar_alu_sequence_item);
    `uvm_object_utils(Alu_add_sequence)
    
    // Constructor
    function new(string name="Alu_add_sequence");
        super.new(name);
    endfunction
    
    // Body task
    virtual task body();
        // Instance of transaction 
        tar_alu_sequence_item req;
        
        repeat(5) begin
            req = tar_alu_sequence_item::type_id::create("req");
            start_item(req);
            
            // Randomize with constraint and check for success
            if(!req.randomize() with {opcode == 3'b000;}) begin
                `uvm_error("ALU_ADD_SEQ", "Randomization failed")
            end
            
            // Assertions
            assert_opcode_is_add: assert (req.opcode == 3'b000) else
                `uvm_error("ALU_ADD_SEQ", $sformatf("Opcode is not ADD. Got %0b", req.opcode))
            
            assert_a_in_range: assert (req.A inside {[0:32'hFFFFFFFF]}) else
                `uvm_error("ALU_ADD_SEQ", $sformatf("A is out of range. Got %0h", req.A))
            
            assert_b_in_range: assert (req.B inside {[0:32'hFFFFFFFF]}) else
                `uvm_error("ALU_ADD_SEQ", $sformatf("B is out of range. Got %0h", req.B))
            
            finish_item(req);
        end
    endtask

endclass