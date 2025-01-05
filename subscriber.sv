`ifndef subscriber
`define subscriber

class subscriber extends uvm_subscriber#(tar_alu_sequence_item);
    
  tar_alu_sequence_item trans;//declare the Sequence item 

//   regestration 
  `uvm_component_utils(subscriber)
  
  
//   constructor
  function new(string name="subscriber", uvm_component parent);
    super.new(name, parent);
    trans = tar_alu_sequence_item::type_id::create("trans", this);
   Arithmetic_Logic_Unit = new();
  endfunction
      
  
  // Write method to process each trans
  virtual function void write(input tar_alu_sequence_item t);
    trans = t; // Assign the trans to trans for covergroup use
    Arithmetic_Logic_Unit.sample(); // Sample the covergroup
  endfunction 



  covergroup Arithmetic_Logic_Unit;
    option.per_instance=1;
    // Define coverpoints for the fields i want to cover
    c_reset: coverpoint trans.rst {
      bins en_reset1={[0:1]};
//       bins disable_reset={0};
    }
         
    c_A: coverpoint trans.A{
      bins low1_rang = {[0:1023]};             // Low range
      bins low2_rang = {[1024:2047]};          // Another low range
      bins low3_rang = {[2048:4095]};          // Another low range
      bins mid1_rang = {[4096:8191]};          // Mid-low range
      bins mid2_rang = {[8192:16383]};         // Mid range
      bins mid3_rang = {[16384:32767]};        // Mid-high range
     
    }
    c_B: coverpoint trans.B {
      bins low1_rang = {[0:1023]};             // Low range
      bins low2_rang = {[1024:2047]};          // Another low range
      bins low3_rang = {[2048:4095]};          // Another low range
      bins mid1_rang = {[4096:8191]};          // Mid-low range
      bins mid2_ang = {[8192:16383]};         // Mid range
      bins mid2_rang = {[16384:32767]};        // Mid-high range
      bins high1_rang = {[32768:65535]};        // High range
      bins high2_rang ={[65536:131071]};       // Higher range
      bins high3_rang = {[131072:262143]};      // Even higher range
      bins high4_rang = {[262144:32'hFFFFFFFF]}; // Very high range
    }
    c_Opcode: coverpoint trans.opcode {
      bins add = {3'b000};             // Addition operation
      bins sub = {3'b001};             // Subtraction operation
      bins and_op = {3'b010};             // and operation
      bins or_op = {3'b011};             // or operation
      bins xor_op = {3'b100};             // or operation
    }
      
    c_Result: coverpoint trans.Result;
      
    c_Error: coverpoint trans.Error{
      bins Error={[0:1]};
    }
  endgroup 



endclass


`endif // End of include guard
