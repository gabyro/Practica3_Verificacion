onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Processors_Control_TB/DUT/clk
add wave -noupdate /Processors_Control_TB/DUT/reset
add wave -noupdate /Processors_Control_TB/DUT/start
add wave -noupdate -radix unsigned /Processors_Control_TB/DUT/N
add wave -noupdate -childformat {{/Processors_Control_TB/DUT/control.processor_number -radix unsigned}} -expand -subitemconfig {/Processors_Control_TB/DUT/control.processor_number {-height 15 -radix unsigned}} /Processors_Control_TB/DUT/control
add wave -noupdate -radix unsigned /Processors_Control_TB/DUT/counter_value
add wave -noupdate /Processors_Control_TB/DUT/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {58 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 236
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
WaveRestoreZoom {16 ps} {74 ps}
