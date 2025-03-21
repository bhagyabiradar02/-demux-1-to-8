


class demux_1to8_agent extends uvm_agent;
  `uvm_component_utils(demux_1to8_agent)
  
    demux_1to8_driver drv;
    demux_1to8_monitor mon;
    uvm_sequencer #(demux_1to8_item) seqr;
  
    function new(string name="demux_1to8_agent", uvm_component parent=null);
       super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      //super.build_pahse(phase);
        drv = demux_1to8_driver::type_id::create("drv", this);
        mon = demux_1to8_monitor::type_id::create("mon", this);
        seqr = uvm_sequencer#(demux_1to8_item)::type_id::create("seqr", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
  
endclass
