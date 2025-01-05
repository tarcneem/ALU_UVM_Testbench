

class Alu_xor_sequence extends uvm_sequence#(tar_alu_sequence_item);
    `uvm_object_utils(Alu_xor_sequence)
    
    //constructor
        function new(string name="Alu_xor_sequence");
           super.new(name);
        endfunction
    
        //body task
    
        virtual task body();
        tar_alu_sequence_item req=tar_alu_sequence_item::type_id::create("req");
        start_item(req);
        req.randomize()with{opcode==3'b111;};         // 3'b001 represents XOR
        finish_item(req);
    
        endtask
    
    endclass