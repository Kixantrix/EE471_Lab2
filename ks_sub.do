onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ks_sub_testbench/P1
add wave -noupdate /ks_sub_testbench/G1
add wave -noupdate /ks_sub_testbench/P0
add wave -noupdate /ks_sub_testbench/G0
add wave -noupdate /ks_sub_testbench/P
add wave -noupdate /ks_sub_testbench/G
add wave -noupdate /ks_sub_testbench/i
add wave -noupdate /ks_sub_testbench/j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {735 ns}
