
class demux_1to8_item extends uvm_sequence_item;
  `uvm_object_utils(demux_1to8_item)
    
    rand bit [7:0] i_data;
    rand bit [2:0] sel;
    bit [7:0] expected_outputs[8];
    
    function new(string name = "demux_1to8_item");
        super.new(name);
    endfunction

    constraint valid_sel { sel inside {[0:7]}; }
  
endclass
