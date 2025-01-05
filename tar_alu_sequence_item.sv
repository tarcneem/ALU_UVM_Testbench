
`ifndef tar_alu_sequence_item
`define tar_alu_sequence_item


import uvm_pkg::*;
`include "uvm_macros.svh"
class tar_alu_sequence_item extends uvm_sequence_item;

  //data members
rand logic rst;
rand logic [31:0]A;//first operand 
rand logic [31:0] B;//second operand 
rand logic[2:0] opcode;// opcode 

logic [31:0] Result; //Result
logic Error; //error

  //constructor
function new (string name="tar_alu_sequence_item");
super.new(name);
endfunction:new

  //register fields to factory
`uvm_object_utils_begin(tar_alu_sequence_item)
`uvm_field_int(rst,UVM_ALL_ON)
`uvm_field_int(A,UVM_ALL_ON)
`uvm_field_int(B,UVM_ALL_ON)
`uvm_field_int(opcode,UVM_ALL_ON)
`uvm_field_int(Result,UVM_ALL_ON)
`uvm_field_int(Error,UVM_ALL_ON)
`uvm_object_utils_end

function string convert2string();
  return $sformatf("A: %0d, B: %0d, Opcode: %0d, Result: %0d, Error: %0b", A, B, opcode, Result, Error);
endfunction


endclass:tar_alu_sequence_item



`endif // End of include guard
