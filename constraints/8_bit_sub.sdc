create_clock -period 6.8 -name Clock -waveform {0 0.55} [get_ports Clock]

set_input_delay -max 1.5 -clock Clock [all_inputs]
set_output_delay -max 0.8 -clock Clock [all_outputs]

set_input_transition 0.5 [all_inputs]

set_clock_uncertainty -setup 1.6 [get_clocks Clock]
set_clock_uncertainty -hold 0.100 [get_clocks Clock]

set_max_transition 0.25 [current_design]
set_max_transition -clock_path 0.15 [get_clocks Clock]
