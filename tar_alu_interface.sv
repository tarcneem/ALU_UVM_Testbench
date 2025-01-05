
interface tar_alu_interface(input logic clk);
  logic signed  [31:0] A ;//First operand 
  logic [31:0]B;//second operand
  logic [2:0]opcode; //operation code
  logic [31:0] Result; //result of the operation
  logic Error; //error flag
  logic rst; 

  
clocking DRIVER_CB@(negedge clk);
  default input #1 output #0;
  //the outputs of the testbench that we drive to the DUT
  output rst;
  output A;
  output B;
  output opcode;
endclocking

  clocking MONITOR_CB@(posedge clk);
    default input #0 output #1;
    //all the ports of the DUT are sampled 
    input A;
    input B;
     input rst;

    input opcode;
    input Result;
    input Error;
  endclocking
  
  modport DRIVER_MOD(clocking DRIVER_CB,input clk);
    
  modport MONITOR_MOD(clocking MONITOR_CB,input clk);
      
endinterface
  


    

