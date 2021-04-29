transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/mem_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/mem_files/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/mem_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/mem_files/ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/IP_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/IP_files/mult_accum.v}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/VGA_controller.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/pointer.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/canvas_editor.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/color_mapper.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/neurons.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/state_machine.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/CONSTANTS.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/hex_driver.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/testtop_level.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/instantiate_ram.sv}
vlog -sv -work work +incdir+C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files {C:/Users/STP/Desktop/mnist-nn-fpga/MNIST_NN/sv_files/neural_network.sv}
vlib mnist_nn
vmap mnist_nn mnist_nn

