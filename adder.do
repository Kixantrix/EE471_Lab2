onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /adder_testbench/Output
add wave -noupdate -radix unsigned /adder_testbench/BussB
add wave -noupdate -radix unsigned /adder_testbench/BussA
add wave -noupdate /adder_testbench/add/P
add wave -noupdate /adder_testbench/add/G
add wave -noupdate /adder_testbench/add/Pi1
add wave -noupdate /adder_testbench/add/Pi2
add wave -noupdate /adder_testbench/add/Gi1
add wave -noupdate /adder_testbench/add/Gi2
add wave -noupdate /adder_testbench/add/Cn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 188
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {300902 ps} {931532 ps}
