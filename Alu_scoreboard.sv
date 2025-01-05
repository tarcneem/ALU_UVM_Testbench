`ifndef Alu_scoreboard
`define Alu_scoreboard


class Alu_scoreboard extends uvm_scoreboard;
    // Class registration to the factory
    `uvm_component_utils(Alu_scoreboard)

    uvm_analysis_imp#(tar_alu_sequence_item, Alu_scoreboard) recev;

    // Constructor
    function new(string name = "Alu_scoreboard", uvm_component parent);
        super.new(name, parent);
        recev = new("recev", this);
    endfunction

    tar_alu_sequence_item packetQueue[$];

    function void write(tar_alu_sequence_item req);
        packetQueue.push_back(req);
    endfunction

    virtual task run_phase(uvm_phase phase);
        tar_alu_sequence_item packet;
        tar_alu_sequence_item refPacket;
        refPacket = tar_alu_sequence_item::type_id::create("refPacket");

        forever begin
            wait(packetQueue.size() > 0);
            packet = packetQueue.pop_front();
           refPacket.A=packet.A;
      refPacket.B=packet.B;
      refPacket.opcode=packet.opcode;
                refPacket.rst=packet.rst;

          ALU_RF(packet.A,packet.rst, packet.B, packet.opcode, refPacket.Result, refPacket.Error);

            if (is_equal(packet, refPacket)) begin
                `uvm_info("PASS", $sformatf("----::Match::----\nActual Packet:\n%s\nExpected Packet:\n%s",
                    packet.convert2string(), refPacket.convert2string()), UVM_LOW);
            end else begin
                `uvm_info("FAIL", $sformatf("----::Mismatch::----\nActual Packet:\n%s\nExpected Packet:\n%s",
                    packet.convert2string(), refPacket.convert2string()), UVM_LOW);
            end
        end
    endtask

    function bit is_equal(tar_alu_sequence_item reference, tar_alu_sequence_item packet);
        return (reference.A === packet.A) &&
               (reference.B === packet.B) &&
               (reference.opcode === packet.opcode) &&
               (reference.Result === packet.Result) &&
      (reference.rst === packet.rst)&&
               (reference.Error === packet.Error);
    endfunction

  static task ALU_RF(input logic signed [31:0] A,input logic rst, input logic [31:0] B, input logic [2:0] opcode,
                    
             output logic [31:0] Result, output logic Error);
      if(rst)begin
              Error = 0;
                Result = 0;

      end
    else begin
             Error = 0;
        case (opcode)
            3'b000: begin
                // Addition
                Result = A + B;
                if ((A > 0 && B > 0 && Result < 0) || (A < 0 && B < 0 && Result > 0))
                    Error = 1;
            end
            3'b001: begin
                // Subtraction
                Result = A - B;
                if ((A < 0 && B > 0 && Result > A) || (A > 0 && B < 0 && Result < A))
                    Error = 1;
            end
            3'b010: begin
                // AND
                Result = A & B;
            end
            3'b011: begin
                // OR
                Result = A | B;
            end
            3'b100: begin
                // XOR
                Result = A ^ B;
            end
            default: begin
                Result = 0;
                Error = 1'b1; // Set error flag for invalid opcode
            end
        endcase
    end
    endtask
endclass



`endif // End of include guard
