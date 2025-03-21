
class demux_1to8_seq extends uvm_sequence #(demux_1to8_item);
   `uvm_object_utils(demux_1to8_seq)
  
    demux_1to8_item req;
  
    function new(string name = "demux_1to8_seq");
        super.new(name);
    endfunction

    task body();
        req = demux_1to8_item::type_id::create("req");
        repeat (10) begin
            start_item(req);
            assert(req.randomize());
            finish_item(req);
        end
    endtask
  
endclass
