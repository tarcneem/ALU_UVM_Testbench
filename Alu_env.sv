
`ifndef Alu_env
`define Alu_env

class Alu_env extends uvm_env;
    `uvm_component_utils(Alu_env)
    //handles of components inside the env
        alu_agent agent;
        Alu_scoreboard scoreboard;
        subscriber scr;
        function new(string name ="Alu_env",uvm_component parent);
    super.new(name,parent);
        endfunction
    
        //build phase
        function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent=alu_agent::type_id::create("agent",this);
    scoreboard=Alu_scoreboard::type_id::create("scoreboard",this);
    scr=subscriber::type_id::create("scr",this);
        endfunction
    
    
        function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.mon.port.connect(scoreboard.recev);
    agent.mon.port.connect(scr.analysis_export);
    
        endfunction
    endclass
    
    
`endif // End of include guard
