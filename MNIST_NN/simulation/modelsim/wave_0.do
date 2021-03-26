onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clk /testbench/Clk
add wave -noupdate -label KEY /testbench/KEY
add wave -noupdate -label SW -radix hexadecimal /testbench/SW
add wave -noupdate -label State /testbench/top/nn/s0/curr_state
add wave -noupdate -label Tick -radix unsigned /testbench/top/nn/tick
add wave -noupdate -label address_r0 -radix hexadecimal /testbench/top/nn/address_r0
add wave -noupdate -label address_r1 -radix hexadecimal /testbench/top/nn/address_r1
add wave -noupdate -label {w[0]} -radix decimal {/testbench/top/nn/w[0]}
add wave -noupdate -label x -radix decimal /testbench/top/nn/x
add wave -noupdate -label {n1[0]|accumulator} -radix decimal -radixshowbase 0 {/testbench/top/nn/n1[0]/accumulator}
add wave -noupdate -label {n1[0]|Active} {/testbench/top/nn/n1[0]/Active}
add wave -noupdate -label sload {/testbench/top/nn/n1[0]/sload}
add wave -noupdate -label Z -radix decimal {/testbench/top/nn/n1[0]/Z}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16160333 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 138
configure wave -valuecolwidth 79
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
configure wave -timelineunits ns
update
WaveRestoreZoom {15984078 ps} {16229204 ps}
