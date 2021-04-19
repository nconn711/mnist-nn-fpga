onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Clk /testbench/Clk
add wave -noupdate -label KEY /testbench/KEY
add wave -noupdate -label SW -radix hexadecimal /testbench/SW
add wave -noupdate -label state /testbench/top/nn/s0/curr_state
add wave -noupdate -label tick -radix unsigned /testbench/top/nn/tick
add wave -noupdate -label address_r0 -radix hexadecimal /testbench/top/nn/address_r0
add wave -noupdate -label address_r1 -radix hexadecimal /testbench/top/nn/address_r1
add wave -noupdate -label address_r2 -radix hexadecimal /testbench/top/nn/address_r2
add wave -noupdate -label x -radix decimal /testbench/top/nn/x
add wave -noupdate -label w -radix decimal -childformat {{{/testbench/top/nn/w[19]} -radix decimal} {{/testbench/top/nn/w[18]} -radix decimal} {{/testbench/top/nn/w[17]} -radix decimal} {{/testbench/top/nn/w[16]} -radix decimal} {{/testbench/top/nn/w[15]} -radix decimal} {{/testbench/top/nn/w[14]} -radix decimal} {{/testbench/top/nn/w[13]} -radix decimal} {{/testbench/top/nn/w[12]} -radix decimal} {{/testbench/top/nn/w[11]} -radix decimal} {{/testbench/top/nn/w[10]} -radix decimal} {{/testbench/top/nn/w[9]} -radix decimal} {{/testbench/top/nn/w[8]} -radix decimal} {{/testbench/top/nn/w[7]} -radix decimal} {{/testbench/top/nn/w[6]} -radix decimal} {{/testbench/top/nn/w[5]} -radix decimal} {{/testbench/top/nn/w[4]} -radix decimal} {{/testbench/top/nn/w[3]} -radix decimal} {{/testbench/top/nn/w[2]} -radix decimal} {{/testbench/top/nn/w[1]} -radix decimal} {{/testbench/top/nn/w[0]} -radix decimal}} -subitemconfig {{/testbench/top/nn/w[19]} {-height 15 -radix decimal} {/testbench/top/nn/w[18]} {-height 15 -radix decimal} {/testbench/top/nn/w[17]} {-height 15 -radix decimal} {/testbench/top/nn/w[16]} {-height 15 -radix decimal} {/testbench/top/nn/w[15]} {-height 15 -radix decimal} {/testbench/top/nn/w[14]} {-height 15 -radix decimal} {/testbench/top/nn/w[13]} {-height 15 -radix decimal} {/testbench/top/nn/w[12]} {-height 15 -radix decimal} {/testbench/top/nn/w[11]} {-height 15 -radix decimal} {/testbench/top/nn/w[10]} {-height 15 -radix decimal} {/testbench/top/nn/w[9]} {-height 15 -radix decimal} {/testbench/top/nn/w[8]} {-height 15 -radix decimal} {/testbench/top/nn/w[7]} {-height 15 -radix decimal} {/testbench/top/nn/w[6]} {-height 15 -radix decimal} {/testbench/top/nn/w[5]} {-height 15 -radix decimal} {/testbench/top/nn/w[4]} {-height 15 -radix decimal} {/testbench/top/nn/w[3]} {-height 15 -radix decimal} {/testbench/top/nn/w[2]} {-height 15 -radix decimal} {/testbench/top/nn/w[1]} {-height 15 -radix decimal} {/testbench/top/nn/w[0]} {-height 15 -radix decimal}} /testbench/top/nn/w
add wave -noupdate -label layer /testbench/top/nn/layer
add wave -noupdate -label actFuncActive -radix binary /testbench/top/nn/actFuncActive
add wave -noupdate -label sigmoid -radix hexadecimal /testbench/top/nn/sigmoid
add wave -noupdate -label z_1_out -radix hexadecimal -childformat {{{/testbench/top/nn/z_1_out[19]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[18]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[17]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[16]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[15]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[14]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[13]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[12]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[11]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[10]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[9]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[8]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[7]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[6]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[5]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[4]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[3]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[2]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[1]} -radix hexadecimal} {{/testbench/top/nn/z_1_out[0]} -radix hexadecimal}} -subitemconfig {{/testbench/top/nn/z_1_out[19]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[18]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[17]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[16]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[15]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[14]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[13]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[12]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[11]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[10]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[9]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[8]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[7]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[6]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[5]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[4]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[3]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[2]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[1]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_out[0]} {-height 15 -radix hexadecimal}} /testbench/top/nn/z_1_out
add wave -noupdate -label z_1_in -radix hexadecimal -childformat {{{/testbench/top/nn/z_1_in[19]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[18]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[17]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[16]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[15]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[14]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[13]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[12]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[11]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[10]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[9]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[8]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[7]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[6]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[5]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[4]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[3]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[2]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[1]} -radix hexadecimal} {{/testbench/top/nn/z_1_in[0]} -radix hexadecimal}} -subitemconfig {{/testbench/top/nn/z_1_in[19]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[18]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[17]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[16]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[15]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[14]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[13]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[12]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[11]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[10]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[9]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[8]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[7]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[6]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[5]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[4]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[3]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[2]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[1]} {-height 15 -radix hexadecimal} {/testbench/top/nn/z_1_in[0]} {-height 15 -radix hexadecimal}} /testbench/top/nn/z_1_in
add wave -noupdate -label z_3_in -radix hexadecimal /testbench/top/nn/z_3_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {17581434 ps} 0}
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
WaveRestoreZoom {17138322 ps} {17784372 ps}
