# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
#vlog "./mux2_1.sv"
#vlog "./nor_testbench.sv"
#vlog "./nor.sv"
vlog "./sltu.sv"
vlog "./sltu_testbench.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
#vsim -voptargs="+acc" -t 1ps -lib work mux2_1_testbench
#vsim -voptargs="+acc" -t 1ps -lib work nor_testbench
vsim -voptargs="+acc" -t 1ps -lib work sltu_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
#do mux2_1_wave.do
#do nor_wave.do
do sltu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
