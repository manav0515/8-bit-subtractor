source -echo -verbose ./rm_setup/dc_setup.tcl

set RTL_SOURCE_FILES ./../rtl/8_bit_subtractor.v
set DESIGN_NAME subtractor_8bit

set RESULTS_DIR ./results
#set DCRM_FINAL_VERILOG_OUTPUT_FILE subtractor_8bit_synth.v

#set_option -seed 12345

define_design_lib WORK -path ./WORK

#set_dont_use [get_lib_cells */FADD*]
#set_dont_use [get_lib_cells */HADD*]
#set_dont_use [get_lib_cells */NAND*]
#set_dont_use [get_lib_cells */XNOR*]
#set_dont_use [get_lib_cells */MUX*]
set_dont_use [get_lib_cells */AO*]
set_dont_use [get_lib_cells */OA*]
set_dont_use [get_lib_cells */XOR*]
set_dont_use [get_lib_cells */NOR*]

analyze -format verilog ${RTL_SOURCE_FILES}
elaborate ${DESIGN_NAME}
link
current_design ${DESIGN_NAME}

read_sdc ./../CONSTRAINTS/8_bit_sub.sdc

compile_ultra 

report_timing > timing.rpt
report_area > area.rpt
report_power > power.rpt

write -format verilog -hierarchy -output ${RESULTS_DIR}/${DCRM_FINAL_VERILOG_OUTPUT_FILE}

report_timing -path_type full -delay_type max -max_paths 5 -nworst 5

