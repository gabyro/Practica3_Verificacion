onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/clk_low
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/clk_high
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/reset
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/Rx_in
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/pop
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/output_fifo_value
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/Tx_out
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/v
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/fifos_out
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/start
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/fifo_out_pop
add wave -noupdate -group IN/OUT /UART_MODULE_TB/DUT/n
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/clk
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/rst
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/Rx_in
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/RECEPTION/synch_RX
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/Tx_in
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/send
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/Rx_out
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/Tx_out
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/new_Rx
add wave -noupdate -group UART -color Magenta /UART_MODULE_TB/DUT/FIRST_PART_UART/RECEPTION/Rx_error
add wave -noupdate -group UART /UART_MODULE_TB/DUT/FIRST_PART_UART/Tx_ready
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/clk
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/reset
add wave -noupdate -expand -group Control -color Salmon /UART_MODULE_TB/DUT/CONTROL/Tx_ready
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/Rx_interrupt
add wave -noupdate -expand -group Control -radix hexadecimal /UART_MODULE_TB/DUT/CONTROL/Rx_value
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/N
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/output_fifo_value
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/state
add wave -noupdate -expand -group Control /UART_MODULE_TB/DUT/CONTROL/control
add wave -noupdate -expand -group Control -radix unsigned /UART_MODULE_TB/DUT/CONTROL/count
add wave -noupdate -group {registro N} /UART_MODULE_TB/DUT/REGISTER_N/Data_Input
add wave -noupdate -group {registro N} /UART_MODULE_TB/DUT/REGISTER_N/enable
add wave -noupdate -group {registro N} /UART_MODULE_TB/DUT/REGISTER_N/sync_reset
add wave -noupdate -group {registro N} -radix unsigned /UART_MODULE_TB/DUT/REGISTER_N/Data_Output
add wave -noupdate -group {registro L} /UART_MODULE_TB/DUT/REGISTER_L/Data_Input
add wave -noupdate -group {registro L} /UART_MODULE_TB/DUT/REGISTER_L/enable
add wave -noupdate -group {registro L} /UART_MODULE_TB/DUT/REGISTER_L/sync_reset
add wave -noupdate -group {registro L} -radix unsigned /UART_MODULE_TB/DUT/REGISTER_L/Data_Output
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/data_input
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/push
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/pop
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/synch_rst
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/data_out
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/full_out
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/empty_out
add wave -noupdate -group ROW1 -radix unsigned -childformat {{{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[15]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[14]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[13]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[12]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[11]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[10]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[9]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[8]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[7]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[6]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[5]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[4]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[3]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[2]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[1]} -radix unsigned} {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[0]} -radix unsigned}} -expand -subitemconfig {{/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[15]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[14]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[13]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[12]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[11]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[10]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[9]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[8]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[7]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[6]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[5]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[4]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[3]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[2]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[1]} {-height 15 -radix unsigned} {/UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram[0]} {-height 15 -radix unsigned}} /UART_MODULE_TB/DUT/FIFO_ROW_1/MEMORY/ram
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/POP_counter_out_wire
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/PUSH_counter_out_wire
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/DATA_counter_wire
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/PUSH_module/reset
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/PUSH_module/enable
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/PUSH_module/SyncReset
add wave -noupdate -group ROW1 /UART_MODULE_TB/DUT/FIFO_ROW_1/PUSH_module/Flag
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/data_input
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/push
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/pop
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/synch_rst
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/data_out
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/full_out
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/empty_out
add wave -noupdate -group ROW2 /UART_MODULE_TB/DUT/FIFO_ROW_2/MEMORY/ram
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/data_input
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/push
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/pop
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/synch_rst
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/data_out
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/full_out
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/empty_out
add wave -noupdate -group ROW3 /UART_MODULE_TB/DUT/FIFO_ROW_3/MEMORY/ram
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/data_input
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/push
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/pop
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/synch_rst
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/data_out
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/full_out
add wave -noupdate -group ROW4 /UART_MODULE_TB/DUT/FIFO_ROW_4/empty_out
add wave -noupdate -group ROW4 -expand /UART_MODULE_TB/DUT/FIFO_ROW_4/MEMORY/ram
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/data_input
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/push
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/pop
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/synch_rst
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/data_out
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/full_out
add wave -noupdate -group VECTOR /UART_MODULE_TB/DUT/FIFO_VECTOR/empty_out
add wave -noupdate -group VECTOR -expand /UART_MODULE_TB/DUT/FIFO_VECTOR/MEMORY/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4586 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 387
configure wave -valuecolwidth 114
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
WaveRestoreZoom {3889 ps} {5649 ps}
