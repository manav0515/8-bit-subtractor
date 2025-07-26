set report_default_significant_digits 6 ;

# Set the technology libraries
set link_path "./../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db"
set target_library "./../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db"

# Read routed netlist from ICC2
read_verilog "./../ICCII/results/8_bit_s.routed.v"

# Replace 'subtractor_8bit' with your actual top-level module name in the above .v file
link_design subtractor_8bit
current_design subtractor_8bit

# Read design constraints
read_sdc "./../CONSTRAINTS/8_bit_sub.sdc"

# Read parasitic data from ICC2
read_parasitics "./../ICCII/results/8_sub_func::nom.spef.p2_125.spef"

# Update timing with full analysis
update_timing -full

# Quick reports to terminal
report_timing
report_design

# Save detailed reports
check_timing -verbose > ./reports/check_timing/check_timing.p2_report
report_global_timing > ./reports/timing/report_global_timing.p2_report
report_clock -skew -attribute > ./reports/clock/report_clock.p2_report
report_analysis_coverage > ./reports/analysis_coverage/report_analysis_coverage.p2_report
report_timing -slack_lesser_than 0.0 -delay min_max -nosplit -input -net > ./reports/timing/report_timing.p2_report

