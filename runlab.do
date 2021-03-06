# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./adder_pg.sv"
vlog "./ks_sub.sv"
vlog "./adder.sv"
vlog "./adder_testbench.sv"
vlog "./ks_sub_testbench.sv"
vlog "./nor_testbench.sv"
vlog "./nor.sv"
vlog "./sltu.sv"
vlog "./sltu_testbench.sv"
vlog "./Mux2x1.sv"
vlog "./Mux_32_2x1.sv"
vlog "./Mux_32_2x1_testbench.sv"
vlog "./Mux_32_4x1.sv"
vlog "./Mux_32_4x1_testbench.sv"
vlog "./zero_test.sv"
vlog "./zero_test_testbench.sv"
vlog "./negative.sv"
vlog "./alu.sv"
vlog "./ALUStimulus.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.

#vsim -voptargs="+acc" -t 1ps -lib work adder_testbench
#vsim -voptargs="+acc" -t 1ps -lib work ks_sub_testbench
#vsim -voptargs="+acc" -t 1ps -lib work nor_testbench
#vsim -voptargs="+acc" -t 1ps -lib work sltu_testbench
#vsim -voptargs="+acc" -t 1ps -lib work Mux_32_2x1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work Mux_32_4x1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work zero_test_testbench
vsim -voptargs="+acc" -t 1ps -lib work ALUStimulus

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
#do nor_wave.do
#do sltu_wave.do
#do adder.do
#do ks_sub.do
#do Mux_32_2x1.do
#do Mux_32_4x1.do
#do zero_test.do
do alu.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
