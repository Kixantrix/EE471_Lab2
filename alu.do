onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /ALUStimulus/BussA
add wave -noupdate -radix hexadecimal /ALUStimulus/BussB
add wave -noupdate /ALUStimulus/ALUControl
add wave -noupdate -radix hexadecimal /ALUStimulus/Output
add wave -noupdate /ALUStimulus/zero
add wave -noupdate /ALUStimulus/overflow
add wave -noupdate /ALUStimulus/CarryOut
add wave -noupdate /ALUStimulus/negative
add wave -noupdate -radix hexadecimal /ALUStimulus/alu1/adder_mod/A
add wave -noupdate -radix hexadecimal /ALUStimulus/alu1/adder_mod/B
add wave -noupdate -radix hexadecimal /ALUStimulus/alu1/sub_select/out
add wave -noupdate -radix hexadecimal /ALUStimulus/alu1/sub_select/in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40511 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
configure wave -valuecolwidth 144
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
WaveRestoreZoom {0 ps} {1355915 ps}
