set PDK_PATH ./../ref

create_lib -ref_lib $PDK_PATH/lib/ndm/saed32rvt_c.ndm 8_BIT__SUB_LIB5
read_verilog {./../DC/results/subtractor_8bit.mapped.v} -library 8_BIT__SUB_LIB5 -design 8_bits -top 8_bits

#open the lib and block after saving
open_lib 8_BIT__SUB_LIB1
open_block 8_bits

#scenario: -
initialize_floorplan -core_utilization 0.6 -shape T -orientation S -core_offset 2 -flip_first_row true
set_individual_pin_constraints -offset {1 20} -sides 8 -ports [get_ports]
place_pins -self
create_placement -floorplan
save_block
save_lib
