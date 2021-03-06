set projDir "C:/Users/1002336/Documents/mojo/The Color Theory/work/planAhead"
set projName "The Color Theory"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/mojo_top_0.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/reset_conditioner_1.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/button_conditioner_2.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/button_conditioner_2.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/button_conditioner_2.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/button_conditioner_2.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/button_conditioner_2.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/button_conditioner_2.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/edge_detector_8.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/edge_detector_8.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/edge_detector_8.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/edge_detector_8.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/edge_detector_12.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/edge_detector_8.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/multi_seven_seg_14.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/ALU_15.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/decimal3_16.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/pipeline_17.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/pipeline_17.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/pipeline_17.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/pipeline_17.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/pipeline_17.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/pipeline_17.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/counter_23.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/seven_seg_24.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/decoder_25.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/Shifter_26.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/Comparable_27.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/Boolean_28.v" "C:/Users/1002336/Documents/mojo/The Color Theory/work/verilog/AdderOrSubtractor_29.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/1002336/Documents/mojo/The\ Color\ Theory/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
