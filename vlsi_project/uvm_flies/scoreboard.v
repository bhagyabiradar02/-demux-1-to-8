

class demux_1to8_scoreboard extends uvm_scoreboard;
   `uvm_component_utils(demux_1to8_scoreboard)
  
    uvm_analysis_imp #(demux_1to8_item, demux_1to8_scoreboard) mon_ap;
  
  function new(string name="demux_1to8_scoreboard", uvm_component parent=null);
        super.new(name, parent);
        mon_ap = new("mon_ap", this);
    endfunction

    function void write(demux_1to8_item item);
        if (item.expected_outputs[item.sel] !== item.i_data) begin
            `uvm_error("SCOREBOARD", $sformatf("Mismatch! sel=%0d, expected=%0h, got=%0h", item.sel, item.expected_outputs[item.sel], item.i_data))
        end else begin
            //`uvm_info("SCOREBOARD", "Data matched!", UVM_MEDIUM)
          `uvm_info("SCOREBOARD", $sformatf("Match! sel=%0d, expected=%0h, got=%0h", item.sel, item.expected_outputs[item.sel], item.i_data),UVM_LOW)
        end
    endfunction
  
endclass
