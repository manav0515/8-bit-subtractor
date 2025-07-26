set report_default_significant_digits 8

# Load technology library
set link_path "./../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db" 
set target_library "./../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db"

# Read netlist (routed from ICC2)
read_verilog "./../ICCII/results/8_bit_s.routed.v"

# Link design - change this to your correct top-level module
link_design subtractor_8bit
current_design subtractor_8bit

# Apply constraints
read_sdc "./../CONSTRAINTS/8_bit_sub.sdc"

# Read parasitics
read_parasitics "./../ICCII/results/8_sub_func::nom.spef.p1_125.spef"

# Timing update
update_timing -full

# Reports
report_timing
report_design

#check_timing -verbose > ./reports/check_timing/check_timing.p1_report
#report_global_timing > ./reports/timing/report_global_timing.p1_report
#report_clock -skew -attribute > ./reports/clock/report_clock.p1_report
#report_analysis_coverage > ./reports/analysis_coverage/report_analysis_coverage.p1_report
#report_timing -slack_lesser_than 0.0 -delay min_max -nosplit -input -net  > ./reports/timing/report_timing.p1_report
