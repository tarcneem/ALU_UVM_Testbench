

class Alu_and_sequence extends uvm_sequence#(tar_alu_sequence_item);
    `uvm_object_utils(Alu_and_sequence)
    
    //constructor
        function new(string name="Alu_and_sequence");
           super.new(name);
        endfunction
    
        //body task
    
        virtual task body();
        //instance of transaction 
            tar_alu_sequence_item req=tar_alu_sequence_item::type_id::create("req");
        //notify the driver that a transaction is ready to be sent
        start_item(req);
    
        //build the add sequence
        req.randomize()with{opcode==3'b010;};         // 3'b001 represents AND
        
       // Send the transaction to the driver

        finish_item(req);
    
        endtask
    
    endclass