

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {CLK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLK_50[0]}]
derive_pll_clocks
derive_clock_uncertainty


set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 

#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_nios2_oci_break:the_Nios2_nios2_qsys_0_nios2_oci_break|break_readreg*}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_tck:the_Nios2_nios2_qsys_0_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_nios2_oci_debug:the_Nios2_nios2_qsys_0_nios2_oci_debug|*resetlatch}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_tck:the_Nios2_nios2_qsys_0_jtag_debug_module_tck|*sr[33]}]
set_false_path -from [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_nios2_oci_debug:the_Nios2_nios2_qsys_0_nios2_oci_debug|monitor_ready}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_tck:the_Nios2_nios2_qsys_0_jtag_debug_module_tck|*sr[0]}]
set_false_path -from [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_nios2_oci_debug:the_Nios2_nios2_qsys_0_nios2_oci_debug|monitor_error}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_tck:the_Nios2_nios2_qsys_0_jtag_debug_module_tck|*sr[34]}]
set_false_path -from [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_nios2_ocimem:the_Nios2_nios2_qsys_0_nios2_ocimem|*MonDReg*}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_tck:the_Nios2_nios2_qsys_0_jtag_debug_module_tck|*sr*}]
set_false_path -from [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_tck:the_Nios2_nios2_qsys_0_jtag_debug_module_tck|*sr*}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_sysclk:the_Nios2_nios2_qsys_0_jtag_debug_module_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_jtag_debug_module_wrapper:the_Nios2_nios2_qsys_0_jtag_debug_module_wrapper|Nios2_nios2_qsys_0_jtag_debug_module_sysclk:the_Nios2_nios2_qsys_0_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*Nios2_nios2_qsys_0:*|Nios2_nios2_qsys_0_nios2_oci:the_Nios2_nios2_qsys_0_nios2_oci|Nios2_nios2_qsys_0_nios2_oci_debug:the_Nios2_nios2_qsys_0_nios2_oci_debug|monitor_go}]
set_false_path -from [get_ports {BUTTON[0] BUTTON[1] BUTTON[2] LED_GREEN[0] LED_GREEN[1] LED_GREEN[2] LED_GREEN[3] LED_GREEN[4] LED_GREEN[5] LED_GREEN[6] LED_GREEN[7] LED_GREEN[8] LED_GREEN[9] SW[0] SW[1] SW[2] SW[3] SW[4] SW[5] SW[6] SW[7] SW[8] SW[9] altera_reserved_tms altera_reserved_tdi}] 
set_false_path -to [get_ports {LED_GREEN[0] LED_GREEN[1] LED_GREEN[2] LED_GREEN[3] LED_GREEN[4] LED_GREEN[5] LED_GREEN[6] LED_GREEN[7] LED_GREEN[8] LED_GREEN[9] SEVENSEG0[0] SEVENSEG0[1] SEVENSEG0[2] SEVENSEG0[3] SEVENSEG0[4] SEVENSEG0[5] SEVENSEG0[6] SEVENSEG0[7] SEVENSEG1[0] SEVENSEG1[1] SEVENSEG1[2] SEVENSEG1[3] SEVENSEG1[4] SEVENSEG1[5] SEVENSEG1[6] SEVENSEG1[7] SEVENSEG2[0] SEVENSEG2[1] SEVENSEG2[2] SEVENSEG2[3] SEVENSEG2[4] SEVENSEG2[5] SEVENSEG2[6] SEVENSEG2[7] SEVENSEG3[0] SEVENSEG3[1] SEVENSEG3[2] SEVENSEG3[3] SEVENSEG3[4] SEVENSEG3[5] SEVENSEG3[6] SEVENSEG3[7]}]
set_false_path -to [get_ports {altera_reserved_tdo}]

#SDRAM Constraints
create_generated_clock -name sdramclk -source u0|altpll_0|sd1|pll7|clk[0] [get_ports sdram_clk]
set period [expr 1/50000000]
set su 1.5
set hold 0.8
set maxindly [expr $period / 1 - $su]
set minindly [expr $hold - $period / 2]

set_input_delay -clock sdramclk -max $maxindly [get_ports sdram_dq[*]]
set_input_delay -clock sdramclk -min $minindly [get_ports sdram_dq[*]]
set_output_delay -clock sdramclk -max $su [get_ports sdram*]
set_output_delay -clock sdramclk -min $hold [get_ports sdram*]

set_false_path -to [get_ports sdram_clk]