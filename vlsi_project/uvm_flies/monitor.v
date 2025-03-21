
class demux_1to8_monitor extends uvm_monitor;
    `uvm_component_utils(demux_1to8_monitor)
  
    virtual demux_1to8_if vif;
    uvm_analysis_port #(demux_1to8_item) mon_ap;
    demux_1to8_item item;
  
    function new(string name="demux_1to8_monitor", uvm_component parent=null);
        super.new(name, parent); 
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual demux_1to8_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal("MONITOR", "Failed to get interface from config DB")
        end
        item = demux_1to8_item::type_id::create("item");
        mon_ap = new("mon_ap", this);
    endfunction

    task run_phase(uvm_phase phase);
        forever 
          begin
            #10;
            item.i_data = vif.i_data;
            item.sel = vif.sel;
            item.expected_outputs[item.sel] = item.i_data;
            mon_ap.write(item);
        end
    endtask
  
endclass
