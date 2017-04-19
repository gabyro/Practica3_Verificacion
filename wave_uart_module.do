onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /UART_MODULE_TB/DUT/clk_low
add wave -noupdate /UART_MODULE_TB/DUT/clk_high
add wave -noupdate /UART_MODULE_TB/DUT/reset
add wave -noupdate /UART_MODULE_TB/DUT/Rx_in
add wave -noupdate /UART_MODULE_TB/DUT/pop
add wave -noupdate /UART_MODULE_TB/DUT/output_fifo_value
add wave -noupdate /UART_MODULE_TB/DUT/Tx_out
add wave -noupdate /UART_MODULE_TB/DUT/v
add wave -noupdate /UART_MODULE_TB/DUT/fifos_out
add wave -noupdate /UART_MODULE_TB/DUT/start
add wave -noupdate /UART_MODULE_TB/DUT/fifo_out_pop
add wave -noupdate /UART_MODULE_TB/DUT/n
add wave -noupdate -divider UART
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/clk
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/rst
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/Rx_in
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/RECEPTION/synch_RX
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/Tx_in
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/send
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/Rx_out
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/Tx_out
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/new_Rx
add wave -noupdate -color Magenta /UART_MODULE_TB/DUT/FIRST_PART_UART/RECEPTION/Rx_error
add wave -noupdate /UART_MODULE_TB/DUT/FIRST_PART_UART/Tx_ready
add wave -noupdate -divider Control
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/clk
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/reset
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/Tx_ready
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/Rx_interrupt
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/Rx_value
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/N
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/output_fifo_value
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/control
add wave -noupdate /UART_MODULE_TB/DUT/CONTROL/state
add wave -noupdate -divider {registro N}
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_N/Data_Input
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_N/enable
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_N/sync_reset
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_N/Data_Output
add wave -noupdate -divider {registro L}
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_L/Data_Input
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_L/enable
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_L/sync_reset
add wave -noupdate /UART_MODULE_TB/DUT/REGISTER_L/Data_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {394 ps} 0}
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
WaveRestoreZoom {171 ps} {413 ps}
