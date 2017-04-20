onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP /TOP_TB/DUT/clk_low
add wave -noupdate -expand -group TOP /TOP_TB/DUT/clk_high
add wave -noupdate -expand -group TOP /TOP_TB/DUT/reset
add wave -noupdate -expand -group TOP /TOP_TB/DUT/synch_rst
add wave -noupdate -expand -group TOP /TOP_TB/DUT/Rx_in
add wave -noupdate -expand -group TOP /TOP_TB/DUT/Tx_out
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/clk_low
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/clk_high
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/reset
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/Rx_in
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/pop
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/reset_fifos
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/output_fifo_value
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/Tx_out
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/v
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/fifos_out
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/start
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/fifo_out_pop
add wave -noupdate -group UART_MODULE /TOP_TB/DUT/UART_MOD/n
add wave -noupdate -radix unsigned -childformat {{{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[7]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[6]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[5]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[4]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[3]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[2]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[1]} -radix unsigned} {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[0]} -radix unsigned}} -expand -subitemconfig {{/TOP_TB/DUT/FIFO_P3/MEMORY/ram[7]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[6]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[5]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[4]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[3]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[2]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[1]} {-height 15 -radix unsigned} {/TOP_TB/DUT/FIFO_P3/MEMORY/ram[0]} {-height 15 -radix unsigned}} /TOP_TB/DUT/FIFO_P3/MEMORY/ram
add wave -noupdate -expand -group CONTROL_PROCESADORES /TOP_TB/DUT/CONTROL_PROCESSORS/reset
add wave -noupdate -expand -group CONTROL_PROCESADORES /TOP_TB/DUT/CONTROL_PROCESSORS/start
add wave -noupdate -expand -group CONTROL_PROCESADORES /TOP_TB/DUT/CONTROL_PROCESSORS/N
add wave -noupdate -expand -group CONTROL_PROCESADORES /TOP_TB/DUT/CONTROL_PROCESSORS/control
add wave -noupdate -expand -group CONTROL_PROCESADORES /TOP_TB/DUT/CONTROL_PROCESSORS/state
add wave -noupdate -expand -group CONTROL_PROCESADORES /TOP_TB/DUT/CONTROL_PROCESSORS/COUNTER/Counting
add wave -noupdate -expand -group Procesadores /TOP_TB/DUT/PROCESSORS/start
add wave -noupdate -expand -group Procesadores -radix unsigned /TOP_TB/DUT/PROCESSORS/v
add wave -noupdate -expand -group Procesadores -radix unsigned /TOP_TB/DUT/PROCESSORS/Row
add wave -noupdate -expand -group Procesadores -radix unsigned /TOP_TB/DUT/PROCESSORS/result
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/push
add wave -noupdate -group FIFO_VECTOR -color Magenta /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/pop
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/clk_pop
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/clk_push
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/reset
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/synch_rst
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/data_out
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/full_out
add wave -noupdate -group FIFO_VECTOR /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/empty_out
add wave -noupdate -group FIFO_VECTOR -radix unsigned -childformat {{{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[15]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[14]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[13]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[12]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[11]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[10]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[9]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[8]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[7]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[6]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[5]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[4]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[3]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[2]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[1]} -radix unsigned} {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[0]} -radix unsigned}} -subitemconfig {{/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[15]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[14]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[13]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[12]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[11]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[10]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[9]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[8]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[7]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[6]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[5]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[4]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[3]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[2]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[1]} {-height 15 -radix unsigned} {/TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram[0]} {-height 15 -radix unsigned}} /TOP_TB/DUT/UART_MOD/FIFO_VECTOR/MEMORY/ram
add wave -noupdate -group ONESHOT_PUSH /TOP_TB/DUT/oneshot/in
add wave -noupdate -group ONESHOT_PUSH /TOP_TB/DUT/oneshot/clk
add wave -noupdate -group ONESHOT_PUSH /TOP_TB/DUT/oneshot/reset
add wave -noupdate -group ONESHOT_PUSH /TOP_TB/DUT/oneshot/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14284 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 350
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
WaveRestoreZoom {14250 ps} {14426 ps}
