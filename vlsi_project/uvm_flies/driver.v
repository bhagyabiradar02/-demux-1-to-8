

class demux_1to8_driver extends uvm_driver #(demux_1to8_item);
    `uvm_component_utils(demux_1to8_driver)
  
    virtual demux_1to8_if vif;
    //demux_1to8_item req;
  
    function new(string name="demux_1to8_driver", uvm_component parent=null);
       super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual demux_1to8_if)::get(this, "", "vif", vif)) 
          begin
            `uvm_fatal("DRIVER", "Failed to get interface from config DB")
          end
    endfunction

    task run_phase(uvm_phase phase);
        forever 
          begin
            seq_item_port.get_next_item(req);
            #10;
            vif.i_data = req.i_data;
            vif.sel = req.sel;
            seq_item_port.item_done();
        end
    endtask
  
endclass

