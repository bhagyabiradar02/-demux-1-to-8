
class demux_1to8_env extends uvm_env;
  `uvm_component_utils(demux_1to8_env)
  
    demux_1to8_agent agt;
    demux_1to8_scoreboard scb;
  
    function new(string name="demux_1to8_env", uvm_component parent=null);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      //super.build_pahse(phase);
        agt = demux_1to8_agent::type_id::create("agt", this);
        scb = demux_1to8_scoreboard::type_id::create("scb", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        agt.mon.mon_ap.connect(scb.mon_ap);
    endfunction
  
endclass
