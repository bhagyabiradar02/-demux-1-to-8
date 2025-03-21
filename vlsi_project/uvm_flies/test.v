class demux_1to8_test extends uvm_test;
    `uvm_component_utils(demux_1to8_test)
  
    demux_1to8_env env;
    demux_1to8_seq seq;
  
    function new(string name="demux_1to8_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
        env = demux_1to8_env::type_id::create("env", this);
        seq = demux_1to8_seq::type_id::create("seq",this);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq.start(env.agt.seqr);
        #100;
        phase.drop_objection(this);
    endtask
  
endclass
