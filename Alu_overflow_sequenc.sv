
/*import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "tar_alu_sequence_item.sv" */



class Alu_overflow_sequenc extends uvm_sequence#(tar_alu_sequence_item);
    `uvm_object_utils(Alu_overflow_sequenc)
    
    //constructor
        function new(string name="Alu_overflow_sequenc");
           super.new(name);
        endfunction
    
        //body task
    
        virtual task body();
        //instance of transaction 
            tar_alu_sequence_item req=tar_alu_sequence_item::type_id::create("req");
        //notify the driver that a transaction is ready to be sent
        start_item(req);
    
        //build the add sequence
 // Set A and B to 32'hFFFF for overflow testing and randomize other fields
        req.randomize() with {
            A == 32'hFFFF;
            B == 32'hFFFF;
        };       // Send the transaction to the driver

        finish_item(req);
    
        endtask
    
    endclass