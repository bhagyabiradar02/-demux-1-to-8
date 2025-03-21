// Code your testbench here
// or browse Examples

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "package.sv"

module top;
  
    demux_1to8_if vif();
  
    demux_1to8 dut (
        .i_data(vif.i_data),
        .sel(vif.sel),
        .o_data0(vif.o_data0),
        .o_data1(vif.o_data1),
        .o_data2(vif.o_data2),
        .o_data3(vif.o_data3),
        .o_data4(vif.o_data4),
        .o_data5(vif.o_data5),
        .o_data6(vif.o_data6),
        .o_data7(vif.o_data7)
    );
  
    initial 
      begin
        uvm_config_db#(virtual demux_1to8_if)::set(null, "*", "vif", vif);
        run_test("demux_1to8_test");
      end
  initial
begin
$dumpfile("dump.vcd");
$dumpvars();
end

endmodule
