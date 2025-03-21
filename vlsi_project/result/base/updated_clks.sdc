###############################################################################
# Created by write_sdc
###############################################################################
current_design demux_1_to_8
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name core_clock -period 1.2579 
set_input_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {d}]
set_input_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {s0}]
set_input_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {s1}]
set_input_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {s2}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y0}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y1}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y2}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y3}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y4}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y5}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y6}]
set_output_delay 0.3000 -clock [get_clocks {core_clock}] -add_delay [get_ports {y7}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
