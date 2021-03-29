onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clk /testbench/Clk
add wave -noupdate -label KEY /testbench/KEY
add wave -noupdate -label SW -radix hexadecimal /testbench/SW
add wave -noupdate -label state /testbench/top/nn/s0/curr_state
add wave -noupdate -label tick -radix decimal /testbench/top/nn/tick
add wave -noupdate -label address_r0 -radix hexadecimal /testbench/top/nn/address_r0
add wave -noupdate -label address_r1 -radix hexadecimal /testbench/top/nn/address_r1
add wave -noupdate -label x -radix decimal /testbench/top/nn/x
add wave -noupdate -label w -radix decimal -childformat {{{/testbench/top/nn/w[19]} -radix decimal} {{/testbench/top/nn/w[18]} -radix decimal} {{/testbench/top/nn/w[17]} -radix decimal} {{/testbench/top/nn/w[16]} -radix decimal} {{/testbench/top/nn/w[15]} -radix decimal} {{/testbench/top/nn/w[14]} -radix decimal} {{/testbench/top/nn/w[13]} -radix decimal} {{/testbench/top/nn/w[12]} -radix decimal} {{/testbench/top/nn/w[11]} -radix decimal} {{/testbench/top/nn/w[10]} -radix decimal} {{/testbench/top/nn/w[9]} -radix decimal} {{/testbench/top/nn/w[8]} -radix decimal} {{/testbench/top/nn/w[7]} -radix decimal} {{/testbench/top/nn/w[6]} -radix decimal} {{/testbench/top/nn/w[5]} -radix decimal} {{/testbench/top/nn/w[4]} -radix decimal} {{/testbench/top/nn/w[3]} -radix decimal} {{/testbench/top/nn/w[2]} -radix decimal} {{/testbench/top/nn/w[1]} -radix decimal} {{/testbench/top/nn/w[0]} -radix decimal}} -subitemconfig {{/testbench/top/nn/w[19]} {-radix decimal} {/testbench/top/nn/w[18]} {-radix decimal} {/testbench/top/nn/w[17]} {-radix decimal} {/testbench/top/nn/w[16]} {-radix decimal} {/testbench/top/nn/w[15]} {-radix decimal} {/testbench/top/nn/w[14]} {-radix decimal} {/testbench/top/nn/w[13]} {-radix decimal} {/testbench/top/nn/w[12]} {-radix decimal} {/testbench/top/nn/w[11]} {-radix decimal} {/testbench/top/nn/w[10]} {-radix decimal} {/testbench/top/nn/w[9]} {-radix decimal} {/testbench/top/nn/w[8]} {-radix decimal} {/testbench/top/nn/w[7]} {-radix decimal} {/testbench/top/nn/w[6]} {-radix decimal} {/testbench/top/nn/w[5]} {-radix decimal} {/testbench/top/nn/w[4]} {-radix decimal} {/testbench/top/nn/w[3]} {-radix decimal} {/testbench/top/nn/w[2]} {-radix decimal} {/testbench/top/nn/w[1]} {-radix decimal} {/testbench/top/nn/w[0]} {-radix decimal}} /testbench/top/nn/w
add wave -noupdate -label z_1 -radix decimal -childformat {{{/testbench/top/nn/z_1[19]} -radix decimal} {{/testbench/top/nn/z_1[18]} -radix decimal} {{/testbench/top/nn/z_1[17]} -radix decimal} {{/testbench/top/nn/z_1[16]} -radix decimal} {{/testbench/top/nn/z_1[15]} -radix decimal} {{/testbench/top/nn/z_1[14]} -radix decimal} {{/testbench/top/nn/z_1[13]} -radix decimal} {{/testbench/top/nn/z_1[12]} -radix decimal} {{/testbench/top/nn/z_1[11]} -radix decimal} {{/testbench/top/nn/z_1[10]} -radix decimal} {{/testbench/top/nn/z_1[9]} -radix decimal} {{/testbench/top/nn/z_1[8]} -radix decimal} {{/testbench/top/nn/z_1[7]} -radix decimal} {{/testbench/top/nn/z_1[6]} -radix decimal} {{/testbench/top/nn/z_1[5]} -radix decimal} {{/testbench/top/nn/z_1[4]} -radix decimal} {{/testbench/top/nn/z_1[3]} -radix decimal} {{/testbench/top/nn/z_1[2]} -radix decimal} {{/testbench/top/nn/z_1[1]} -radix decimal} {{/testbench/top/nn/z_1[0]} -radix decimal}} -subitemconfig {{/testbench/top/nn/z_1[19]} {-radix decimal} {/testbench/top/nn/z_1[18]} {-radix decimal} {/testbench/top/nn/z_1[17]} {-radix decimal} {/testbench/top/nn/z_1[16]} {-radix decimal} {/testbench/top/nn/z_1[15]} {-radix decimal} {/testbench/top/nn/z_1[14]} {-radix decimal} {/testbench/top/nn/z_1[13]} {-radix decimal} {/testbench/top/nn/z_1[12]} {-radix decimal} {/testbench/top/nn/z_1[11]} {-radix decimal} {/testbench/top/nn/z_1[10]} {-radix decimal} {/testbench/top/nn/z_1[9]} {-radix decimal} {/testbench/top/nn/z_1[8]} {-radix decimal} {/testbench/top/nn/z_1[7]} {-radix decimal} {/testbench/top/nn/z_1[6]} {-radix decimal} {/testbench/top/nn/z_1[5]} {-radix decimal} {/testbench/top/nn/z_1[4]} {-radix decimal} {/testbench/top/nn/z_1[3]} {-radix decimal} {/testbench/top/nn/z_1[2]} {-radix decimal} {/testbench/top/nn/z_1[1]} {-radix decimal} {/testbench/top/nn/z_1[0]} {-radix decimal}} /testbench/top/nn/z_1
add wave -noupdate -label z_2 -radix decimal /testbench/top/nn/z_2
add wave -noupdate -label z_3 -radix decimal /testbench/top/nn/z_3
add wave -noupdate -radix decimal {/testbench/top/nn/n1[19]/accumulator}
add wave -noupdate {/testbench/top/nn/n1[19]/Active}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {16141650 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {15917767 ps} {16246843 ps}
