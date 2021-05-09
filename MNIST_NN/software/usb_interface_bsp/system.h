/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_gen2_0' in SOPC Builder design 'mnist_nn'
 * SOPC Builder design path: ../../mnist_nn.sopcinfo
 *
 * Generated: Thu May 06 17:27:56 CDT 2021
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00001020
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1c
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x08000020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x1c
#define ALT_CPU_NAME "nios2_gen2_0"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x08000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00001020
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x1c
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x08000020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x1c
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x08000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SPI
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2
#define __ALTPLL


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "MAX 10"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x280
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x280
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x280
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "mnist_nn"


/*
 * button configuration
 *
 */

#define ALT_MODULE_CLASS_button altera_avalon_pio
#define BUTTON_BASE 0x1c0
#define BUTTON_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTON_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTON_CAPTURE 0
#define BUTTON_DATA_WIDTH 8
#define BUTTON_DO_TEST_BENCH_WIRING 0
#define BUTTON_DRIVEN_SIM_VALUE 0
#define BUTTON_EDGE_TYPE "NONE"
#define BUTTON_FREQ 50000000
#define BUTTON_HAS_IN 0
#define BUTTON_HAS_OUT 1
#define BUTTON_HAS_TRI 0
#define BUTTON_IRQ -1
#define BUTTON_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BUTTON_IRQ_TYPE "NONE"
#define BUTTON_NAME "/dev/button"
#define BUTTON_RESET_VALUE 0
#define BUTTON_SPAN 16
#define BUTTON_TYPE "altera_avalon_pio"


/*
 * fixedpoint_0 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_0 altera_avalon_pio
#define FIXEDPOINT_0_BASE 0x80
#define FIXEDPOINT_0_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_0_CAPTURE 0
#define FIXEDPOINT_0_DATA_WIDTH 16
#define FIXEDPOINT_0_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_0_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_0_EDGE_TYPE "NONE"
#define FIXEDPOINT_0_FREQ 50000000
#define FIXEDPOINT_0_HAS_IN 1
#define FIXEDPOINT_0_HAS_OUT 0
#define FIXEDPOINT_0_HAS_TRI 0
#define FIXEDPOINT_0_IRQ -1
#define FIXEDPOINT_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_0_IRQ_TYPE "NONE"
#define FIXEDPOINT_0_NAME "/dev/fixedpoint_0"
#define FIXEDPOINT_0_RESET_VALUE 0
#define FIXEDPOINT_0_SPAN 16
#define FIXEDPOINT_0_TYPE "altera_avalon_pio"


/*
 * fixedpoint_1 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_1 altera_avalon_pio
#define FIXEDPOINT_1_BASE 0x90
#define FIXEDPOINT_1_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_1_CAPTURE 0
#define FIXEDPOINT_1_DATA_WIDTH 16
#define FIXEDPOINT_1_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_1_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_1_EDGE_TYPE "NONE"
#define FIXEDPOINT_1_FREQ 50000000
#define FIXEDPOINT_1_HAS_IN 1
#define FIXEDPOINT_1_HAS_OUT 0
#define FIXEDPOINT_1_HAS_TRI 0
#define FIXEDPOINT_1_IRQ -1
#define FIXEDPOINT_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_1_IRQ_TYPE "NONE"
#define FIXEDPOINT_1_NAME "/dev/fixedpoint_1"
#define FIXEDPOINT_1_RESET_VALUE 0
#define FIXEDPOINT_1_SPAN 16
#define FIXEDPOINT_1_TYPE "altera_avalon_pio"


/*
 * fixedpoint_2 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_2 altera_avalon_pio
#define FIXEDPOINT_2_BASE 0xa0
#define FIXEDPOINT_2_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_2_CAPTURE 0
#define FIXEDPOINT_2_DATA_WIDTH 16
#define FIXEDPOINT_2_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_2_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_2_EDGE_TYPE "NONE"
#define FIXEDPOINT_2_FREQ 50000000
#define FIXEDPOINT_2_HAS_IN 1
#define FIXEDPOINT_2_HAS_OUT 0
#define FIXEDPOINT_2_HAS_TRI 0
#define FIXEDPOINT_2_IRQ -1
#define FIXEDPOINT_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_2_IRQ_TYPE "NONE"
#define FIXEDPOINT_2_NAME "/dev/fixedpoint_2"
#define FIXEDPOINT_2_RESET_VALUE 0
#define FIXEDPOINT_2_SPAN 16
#define FIXEDPOINT_2_TYPE "altera_avalon_pio"


/*
 * fixedpoint_3 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_3 altera_avalon_pio
#define FIXEDPOINT_3_BASE 0xb0
#define FIXEDPOINT_3_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_3_CAPTURE 0
#define FIXEDPOINT_3_DATA_WIDTH 16
#define FIXEDPOINT_3_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_3_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_3_EDGE_TYPE "NONE"
#define FIXEDPOINT_3_FREQ 50000000
#define FIXEDPOINT_3_HAS_IN 1
#define FIXEDPOINT_3_HAS_OUT 0
#define FIXEDPOINT_3_HAS_TRI 0
#define FIXEDPOINT_3_IRQ -1
#define FIXEDPOINT_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_3_IRQ_TYPE "NONE"
#define FIXEDPOINT_3_NAME "/dev/fixedpoint_3"
#define FIXEDPOINT_3_RESET_VALUE 0
#define FIXEDPOINT_3_SPAN 16
#define FIXEDPOINT_3_TYPE "altera_avalon_pio"


/*
 * fixedpoint_4 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_4 altera_avalon_pio
#define FIXEDPOINT_4_BASE 0xc0
#define FIXEDPOINT_4_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_4_CAPTURE 0
#define FIXEDPOINT_4_DATA_WIDTH 16
#define FIXEDPOINT_4_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_4_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_4_EDGE_TYPE "NONE"
#define FIXEDPOINT_4_FREQ 50000000
#define FIXEDPOINT_4_HAS_IN 1
#define FIXEDPOINT_4_HAS_OUT 0
#define FIXEDPOINT_4_HAS_TRI 0
#define FIXEDPOINT_4_IRQ -1
#define FIXEDPOINT_4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_4_IRQ_TYPE "NONE"
#define FIXEDPOINT_4_NAME "/dev/fixedpoint_4"
#define FIXEDPOINT_4_RESET_VALUE 0
#define FIXEDPOINT_4_SPAN 16
#define FIXEDPOINT_4_TYPE "altera_avalon_pio"


/*
 * fixedpoint_5 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_5 altera_avalon_pio
#define FIXEDPOINT_5_BASE 0xd0
#define FIXEDPOINT_5_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_5_CAPTURE 0
#define FIXEDPOINT_5_DATA_WIDTH 16
#define FIXEDPOINT_5_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_5_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_5_EDGE_TYPE "NONE"
#define FIXEDPOINT_5_FREQ 50000000
#define FIXEDPOINT_5_HAS_IN 1
#define FIXEDPOINT_5_HAS_OUT 0
#define FIXEDPOINT_5_HAS_TRI 0
#define FIXEDPOINT_5_IRQ -1
#define FIXEDPOINT_5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_5_IRQ_TYPE "NONE"
#define FIXEDPOINT_5_NAME "/dev/fixedpoint_5"
#define FIXEDPOINT_5_RESET_VALUE 0
#define FIXEDPOINT_5_SPAN 16
#define FIXEDPOINT_5_TYPE "altera_avalon_pio"


/*
 * fixedpoint_6 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_6 altera_avalon_pio
#define FIXEDPOINT_6_BASE 0xe0
#define FIXEDPOINT_6_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_6_CAPTURE 0
#define FIXEDPOINT_6_DATA_WIDTH 16
#define FIXEDPOINT_6_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_6_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_6_EDGE_TYPE "NONE"
#define FIXEDPOINT_6_FREQ 50000000
#define FIXEDPOINT_6_HAS_IN 1
#define FIXEDPOINT_6_HAS_OUT 0
#define FIXEDPOINT_6_HAS_TRI 0
#define FIXEDPOINT_6_IRQ -1
#define FIXEDPOINT_6_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_6_IRQ_TYPE "NONE"
#define FIXEDPOINT_6_NAME "/dev/fixedpoint_6"
#define FIXEDPOINT_6_RESET_VALUE 0
#define FIXEDPOINT_6_SPAN 16
#define FIXEDPOINT_6_TYPE "altera_avalon_pio"


/*
 * fixedpoint_7 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_7 altera_avalon_pio
#define FIXEDPOINT_7_BASE 0xf0
#define FIXEDPOINT_7_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_7_CAPTURE 0
#define FIXEDPOINT_7_DATA_WIDTH 16
#define FIXEDPOINT_7_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_7_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_7_EDGE_TYPE "NONE"
#define FIXEDPOINT_7_FREQ 50000000
#define FIXEDPOINT_7_HAS_IN 1
#define FIXEDPOINT_7_HAS_OUT 0
#define FIXEDPOINT_7_HAS_TRI 0
#define FIXEDPOINT_7_IRQ -1
#define FIXEDPOINT_7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_7_IRQ_TYPE "NONE"
#define FIXEDPOINT_7_NAME "/dev/fixedpoint_7"
#define FIXEDPOINT_7_RESET_VALUE 0
#define FIXEDPOINT_7_SPAN 16
#define FIXEDPOINT_7_TYPE "altera_avalon_pio"


/*
 * fixedpoint_8 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_8 altera_avalon_pio
#define FIXEDPOINT_8_BASE 0x100
#define FIXEDPOINT_8_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_8_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_8_CAPTURE 0
#define FIXEDPOINT_8_DATA_WIDTH 16
#define FIXEDPOINT_8_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_8_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_8_EDGE_TYPE "NONE"
#define FIXEDPOINT_8_FREQ 50000000
#define FIXEDPOINT_8_HAS_IN 1
#define FIXEDPOINT_8_HAS_OUT 0
#define FIXEDPOINT_8_HAS_TRI 0
#define FIXEDPOINT_8_IRQ -1
#define FIXEDPOINT_8_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_8_IRQ_TYPE "NONE"
#define FIXEDPOINT_8_NAME "/dev/fixedpoint_8"
#define FIXEDPOINT_8_RESET_VALUE 0
#define FIXEDPOINT_8_SPAN 16
#define FIXEDPOINT_8_TYPE "altera_avalon_pio"


/*
 * fixedpoint_9 configuration
 *
 */

#define ALT_MODULE_CLASS_fixedpoint_9 altera_avalon_pio
#define FIXEDPOINT_9_BASE 0x110
#define FIXEDPOINT_9_BIT_CLEARING_EDGE_REGISTER 0
#define FIXEDPOINT_9_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIXEDPOINT_9_CAPTURE 0
#define FIXEDPOINT_9_DATA_WIDTH 16
#define FIXEDPOINT_9_DO_TEST_BENCH_WIRING 0
#define FIXEDPOINT_9_DRIVEN_SIM_VALUE 0
#define FIXEDPOINT_9_EDGE_TYPE "NONE"
#define FIXEDPOINT_9_FREQ 50000000
#define FIXEDPOINT_9_HAS_IN 1
#define FIXEDPOINT_9_HAS_OUT 0
#define FIXEDPOINT_9_HAS_TRI 0
#define FIXEDPOINT_9_IRQ -1
#define FIXEDPOINT_9_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIXEDPOINT_9_IRQ_TYPE "NONE"
#define FIXEDPOINT_9_NAME "/dev/fixedpoint_9"
#define FIXEDPOINT_9_RESET_VALUE 0
#define FIXEDPOINT_9_SPAN 16
#define FIXEDPOINT_9_TYPE "altera_avalon_pio"


/*
 * floatingpoint_0 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_0 altera_avalon_pio
#define FLOATINGPOINT_0_BASE 0x120
#define FLOATINGPOINT_0_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_0_CAPTURE 0
#define FLOATINGPOINT_0_DATA_WIDTH 16
#define FLOATINGPOINT_0_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_0_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_0_EDGE_TYPE "NONE"
#define FLOATINGPOINT_0_FREQ 50000000
#define FLOATINGPOINT_0_HAS_IN 0
#define FLOATINGPOINT_0_HAS_OUT 1
#define FLOATINGPOINT_0_HAS_TRI 0
#define FLOATINGPOINT_0_IRQ -1
#define FLOATINGPOINT_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_0_IRQ_TYPE "NONE"
#define FLOATINGPOINT_0_NAME "/dev/floatingpoint_0"
#define FLOATINGPOINT_0_RESET_VALUE 0
#define FLOATINGPOINT_0_SPAN 16
#define FLOATINGPOINT_0_TYPE "altera_avalon_pio"


/*
 * floatingpoint_1 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_1 altera_avalon_pio
#define FLOATINGPOINT_1_BASE 0x130
#define FLOATINGPOINT_1_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_1_CAPTURE 0
#define FLOATINGPOINT_1_DATA_WIDTH 16
#define FLOATINGPOINT_1_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_1_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_1_EDGE_TYPE "NONE"
#define FLOATINGPOINT_1_FREQ 50000000
#define FLOATINGPOINT_1_HAS_IN 0
#define FLOATINGPOINT_1_HAS_OUT 1
#define FLOATINGPOINT_1_HAS_TRI 0
#define FLOATINGPOINT_1_IRQ -1
#define FLOATINGPOINT_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_1_IRQ_TYPE "NONE"
#define FLOATINGPOINT_1_NAME "/dev/floatingpoint_1"
#define FLOATINGPOINT_1_RESET_VALUE 0
#define FLOATINGPOINT_1_SPAN 16
#define FLOATINGPOINT_1_TYPE "altera_avalon_pio"


/*
 * floatingpoint_2 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_2 altera_avalon_pio
#define FLOATINGPOINT_2_BASE 0x140
#define FLOATINGPOINT_2_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_2_CAPTURE 0
#define FLOATINGPOINT_2_DATA_WIDTH 16
#define FLOATINGPOINT_2_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_2_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_2_EDGE_TYPE "NONE"
#define FLOATINGPOINT_2_FREQ 50000000
#define FLOATINGPOINT_2_HAS_IN 0
#define FLOATINGPOINT_2_HAS_OUT 1
#define FLOATINGPOINT_2_HAS_TRI 0
#define FLOATINGPOINT_2_IRQ -1
#define FLOATINGPOINT_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_2_IRQ_TYPE "NONE"
#define FLOATINGPOINT_2_NAME "/dev/floatingpoint_2"
#define FLOATINGPOINT_2_RESET_VALUE 0
#define FLOATINGPOINT_2_SPAN 16
#define FLOATINGPOINT_2_TYPE "altera_avalon_pio"


/*
 * floatingpoint_3 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_3 altera_avalon_pio
#define FLOATINGPOINT_3_BASE 0x150
#define FLOATINGPOINT_3_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_3_CAPTURE 0
#define FLOATINGPOINT_3_DATA_WIDTH 16
#define FLOATINGPOINT_3_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_3_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_3_EDGE_TYPE "NONE"
#define FLOATINGPOINT_3_FREQ 50000000
#define FLOATINGPOINT_3_HAS_IN 0
#define FLOATINGPOINT_3_HAS_OUT 1
#define FLOATINGPOINT_3_HAS_TRI 0
#define FLOATINGPOINT_3_IRQ -1
#define FLOATINGPOINT_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_3_IRQ_TYPE "NONE"
#define FLOATINGPOINT_3_NAME "/dev/floatingpoint_3"
#define FLOATINGPOINT_3_RESET_VALUE 0
#define FLOATINGPOINT_3_SPAN 16
#define FLOATINGPOINT_3_TYPE "altera_avalon_pio"


/*
 * floatingpoint_4 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_4 altera_avalon_pio
#define FLOATINGPOINT_4_BASE 0x160
#define FLOATINGPOINT_4_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_4_CAPTURE 0
#define FLOATINGPOINT_4_DATA_WIDTH 16
#define FLOATINGPOINT_4_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_4_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_4_EDGE_TYPE "NONE"
#define FLOATINGPOINT_4_FREQ 50000000
#define FLOATINGPOINT_4_HAS_IN 0
#define FLOATINGPOINT_4_HAS_OUT 1
#define FLOATINGPOINT_4_HAS_TRI 0
#define FLOATINGPOINT_4_IRQ -1
#define FLOATINGPOINT_4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_4_IRQ_TYPE "NONE"
#define FLOATINGPOINT_4_NAME "/dev/floatingpoint_4"
#define FLOATINGPOINT_4_RESET_VALUE 0
#define FLOATINGPOINT_4_SPAN 16
#define FLOATINGPOINT_4_TYPE "altera_avalon_pio"


/*
 * floatingpoint_5 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_5 altera_avalon_pio
#define FLOATINGPOINT_5_BASE 0x170
#define FLOATINGPOINT_5_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_5_CAPTURE 0
#define FLOATINGPOINT_5_DATA_WIDTH 16
#define FLOATINGPOINT_5_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_5_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_5_EDGE_TYPE "NONE"
#define FLOATINGPOINT_5_FREQ 50000000
#define FLOATINGPOINT_5_HAS_IN 0
#define FLOATINGPOINT_5_HAS_OUT 1
#define FLOATINGPOINT_5_HAS_TRI 0
#define FLOATINGPOINT_5_IRQ -1
#define FLOATINGPOINT_5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_5_IRQ_TYPE "NONE"
#define FLOATINGPOINT_5_NAME "/dev/floatingpoint_5"
#define FLOATINGPOINT_5_RESET_VALUE 0
#define FLOATINGPOINT_5_SPAN 16
#define FLOATINGPOINT_5_TYPE "altera_avalon_pio"


/*
 * floatingpoint_6 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_6 altera_avalon_pio
#define FLOATINGPOINT_6_BASE 0x180
#define FLOATINGPOINT_6_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_6_CAPTURE 0
#define FLOATINGPOINT_6_DATA_WIDTH 16
#define FLOATINGPOINT_6_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_6_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_6_EDGE_TYPE "NONE"
#define FLOATINGPOINT_6_FREQ 50000000
#define FLOATINGPOINT_6_HAS_IN 0
#define FLOATINGPOINT_6_HAS_OUT 1
#define FLOATINGPOINT_6_HAS_TRI 0
#define FLOATINGPOINT_6_IRQ -1
#define FLOATINGPOINT_6_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_6_IRQ_TYPE "NONE"
#define FLOATINGPOINT_6_NAME "/dev/floatingpoint_6"
#define FLOATINGPOINT_6_RESET_VALUE 0
#define FLOATINGPOINT_6_SPAN 16
#define FLOATINGPOINT_6_TYPE "altera_avalon_pio"


/*
 * floatingpoint_7 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_7 altera_avalon_pio
#define FLOATINGPOINT_7_BASE 0x190
#define FLOATINGPOINT_7_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_7_CAPTURE 0
#define FLOATINGPOINT_7_DATA_WIDTH 16
#define FLOATINGPOINT_7_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_7_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_7_EDGE_TYPE "NONE"
#define FLOATINGPOINT_7_FREQ 50000000
#define FLOATINGPOINT_7_HAS_IN 0
#define FLOATINGPOINT_7_HAS_OUT 1
#define FLOATINGPOINT_7_HAS_TRI 0
#define FLOATINGPOINT_7_IRQ -1
#define FLOATINGPOINT_7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_7_IRQ_TYPE "NONE"
#define FLOATINGPOINT_7_NAME "/dev/floatingpoint_7"
#define FLOATINGPOINT_7_RESET_VALUE 0
#define FLOATINGPOINT_7_SPAN 16
#define FLOATINGPOINT_7_TYPE "altera_avalon_pio"


/*
 * floatingpoint_8 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_8 altera_avalon_pio
#define FLOATINGPOINT_8_BASE 0x1a0
#define FLOATINGPOINT_8_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_8_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_8_CAPTURE 0
#define FLOATINGPOINT_8_DATA_WIDTH 16
#define FLOATINGPOINT_8_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_8_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_8_EDGE_TYPE "NONE"
#define FLOATINGPOINT_8_FREQ 50000000
#define FLOATINGPOINT_8_HAS_IN 0
#define FLOATINGPOINT_8_HAS_OUT 1
#define FLOATINGPOINT_8_HAS_TRI 0
#define FLOATINGPOINT_8_IRQ -1
#define FLOATINGPOINT_8_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_8_IRQ_TYPE "NONE"
#define FLOATINGPOINT_8_NAME "/dev/floatingpoint_8"
#define FLOATINGPOINT_8_RESET_VALUE 0
#define FLOATINGPOINT_8_SPAN 16
#define FLOATINGPOINT_8_TYPE "altera_avalon_pio"


/*
 * floatingpoint_9 configuration
 *
 */

#define ALT_MODULE_CLASS_floatingpoint_9 altera_avalon_pio
#define FLOATINGPOINT_9_BASE 0x1b0
#define FLOATINGPOINT_9_BIT_CLEARING_EDGE_REGISTER 0
#define FLOATINGPOINT_9_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FLOATINGPOINT_9_CAPTURE 0
#define FLOATINGPOINT_9_DATA_WIDTH 16
#define FLOATINGPOINT_9_DO_TEST_BENCH_WIRING 0
#define FLOATINGPOINT_9_DRIVEN_SIM_VALUE 0
#define FLOATINGPOINT_9_EDGE_TYPE "NONE"
#define FLOATINGPOINT_9_FREQ 50000000
#define FLOATINGPOINT_9_HAS_IN 0
#define FLOATINGPOINT_9_HAS_OUT 1
#define FLOATINGPOINT_9_HAS_TRI 0
#define FLOATINGPOINT_9_IRQ -1
#define FLOATINGPOINT_9_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLOATINGPOINT_9_IRQ_TYPE "NONE"
#define FLOATINGPOINT_9_NAME "/dev/floatingpoint_9"
#define FLOATINGPOINT_9_RESET_VALUE 0
#define FLOATINGPOINT_9_SPAN 16
#define FLOATINGPOINT_9_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_0
#define ALT_TIMESTAMP_CLK none


/*
 * hex_digits_pio configuration
 *
 */

#define ALT_MODULE_CLASS_hex_digits_pio altera_avalon_pio
#define HEX_DIGITS_PIO_BASE 0x230
#define HEX_DIGITS_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define HEX_DIGITS_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define HEX_DIGITS_PIO_CAPTURE 0
#define HEX_DIGITS_PIO_DATA_WIDTH 16
#define HEX_DIGITS_PIO_DO_TEST_BENCH_WIRING 0
#define HEX_DIGITS_PIO_DRIVEN_SIM_VALUE 0
#define HEX_DIGITS_PIO_EDGE_TYPE "NONE"
#define HEX_DIGITS_PIO_FREQ 50000000
#define HEX_DIGITS_PIO_HAS_IN 0
#define HEX_DIGITS_PIO_HAS_OUT 1
#define HEX_DIGITS_PIO_HAS_TRI 0
#define HEX_DIGITS_PIO_IRQ -1
#define HEX_DIGITS_PIO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define HEX_DIGITS_PIO_IRQ_TYPE "NONE"
#define HEX_DIGITS_PIO_NAME "/dev/hex_digits_pio"
#define HEX_DIGITS_PIO_RESET_VALUE 0
#define HEX_DIGITS_PIO_SPAN 16
#define HEX_DIGITS_PIO_TYPE "altera_avalon_pio"


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x280
#define JTAG_UART_0_IRQ 1
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * key configuration
 *
 */

#define ALT_MODULE_CLASS_key altera_avalon_pio
#define KEY_BASE 0x240
#define KEY_BIT_CLEARING_EDGE_REGISTER 0
#define KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEY_CAPTURE 0
#define KEY_DATA_WIDTH 2
#define KEY_DO_TEST_BENCH_WIRING 0
#define KEY_DRIVEN_SIM_VALUE 0
#define KEY_EDGE_TYPE "NONE"
#define KEY_FREQ 50000000
#define KEY_HAS_IN 1
#define KEY_HAS_OUT 0
#define KEY_HAS_TRI 0
#define KEY_IRQ -1
#define KEY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEY_IRQ_TYPE "NONE"
#define KEY_NAME "/dev/key"
#define KEY_RESET_VALUE 0
#define KEY_SPAN 16
#define KEY_TYPE "altera_avalon_pio"


/*
 * keycode configuration
 *
 */

#define ALT_MODULE_CLASS_keycode altera_avalon_pio
#define KEYCODE_BASE 0x220
#define KEYCODE_BIT_CLEARING_EDGE_REGISTER 0
#define KEYCODE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEYCODE_CAPTURE 0
#define KEYCODE_DATA_WIDTH 8
#define KEYCODE_DO_TEST_BENCH_WIRING 0
#define KEYCODE_DRIVEN_SIM_VALUE 0
#define KEYCODE_EDGE_TYPE "NONE"
#define KEYCODE_FREQ 50000000
#define KEYCODE_HAS_IN 0
#define KEYCODE_HAS_OUT 1
#define KEYCODE_HAS_TRI 0
#define KEYCODE_IRQ -1
#define KEYCODE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEYCODE_IRQ_TYPE "NONE"
#define KEYCODE_NAME "/dev/keycode"
#define KEYCODE_RESET_VALUE 0
#define KEYCODE_SPAN 16
#define KEYCODE_TYPE "altera_avalon_pio"


/*
 * leds_pio configuration
 *
 */

#define ALT_MODULE_CLASS_leds_pio altera_avalon_pio
#define LEDS_PIO_BASE 0x250
#define LEDS_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define LEDS_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDS_PIO_CAPTURE 0
#define LEDS_PIO_DATA_WIDTH 14
#define LEDS_PIO_DO_TEST_BENCH_WIRING 0
#define LEDS_PIO_DRIVEN_SIM_VALUE 0
#define LEDS_PIO_EDGE_TYPE "NONE"
#define LEDS_PIO_FREQ 50000000
#define LEDS_PIO_HAS_IN 0
#define LEDS_PIO_HAS_OUT 1
#define LEDS_PIO_HAS_TRI 0
#define LEDS_PIO_IRQ -1
#define LEDS_PIO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDS_PIO_IRQ_TYPE "NONE"
#define LEDS_PIO_NAME "/dev/leds_pio"
#define LEDS_PIO_RESET_VALUE 0
#define LEDS_PIO_SPAN 16
#define LEDS_PIO_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x0
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "mnist_nn_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 16
#define ONCHIP_MEMORY2_0_SPAN 16
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x8000000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 200.0
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x19
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 10
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 13
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 67108864
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.4
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sdram_pll configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_pll altpll
#define SDRAM_PLL_BASE 0x260
#define SDRAM_PLL_IRQ -1
#define SDRAM_PLL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_PLL_NAME "/dev/sdram_pll"
#define SDRAM_PLL_SPAN 16
#define SDRAM_PLL_TYPE "altpll"


/*
 * spi_0 configuration
 *
 */

#define ALT_MODULE_CLASS_spi_0 altera_avalon_spi
#define SPI_0_BASE 0x20
#define SPI_0_CLOCKMULT 1
#define SPI_0_CLOCKPHASE 0
#define SPI_0_CLOCKPOLARITY 0
#define SPI_0_CLOCKUNITS "Hz"
#define SPI_0_DATABITS 8
#define SPI_0_DATAWIDTH 16
#define SPI_0_DELAYMULT "1.0E-9"
#define SPI_0_DELAYUNITS "ns"
#define SPI_0_EXTRADELAY 0
#define SPI_0_INSERT_SYNC 0
#define SPI_0_IRQ 3
#define SPI_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SPI_0_ISMASTER 1
#define SPI_0_LSBFIRST 0
#define SPI_0_NAME "/dev/spi_0"
#define SPI_0_NUMSLAVES 1
#define SPI_0_PREFIX "spi_"
#define SPI_0_SPAN 32
#define SPI_0_SYNC_REG_DEPTH 2
#define SPI_0_TARGETCLOCK 2500000u
#define SPI_0_TARGETSSDELAY "0.0"
#define SPI_0_TYPE "altera_avalon_spi"


/*
 * sysid_qsys_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys_0 altera_avalon_sysid_qsys
#define SYSID_QSYS_0_BASE 0x278
#define SYSID_QSYS_0_ID 0
#define SYSID_QSYS_0_IRQ -1
#define SYSID_QSYS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_0_NAME "/dev/sysid_qsys_0"
#define SYSID_QSYS_0_SPAN 8
#define SYSID_QSYS_0_TIMESTAMP 1620338266
#define SYSID_QSYS_0_TYPE "altera_avalon_sysid_qsys"


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x40
#define TIMER_0_COUNTER_SIZE 64
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 50000000
#define TIMER_0_IRQ 2
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 49999
#define TIMER_0_MULT 0.001
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 64
#define TIMER_0_TICKS_PER_SEC 1000
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"


/*
 * usb_gpx configuration
 *
 */

#define ALT_MODULE_CLASS_usb_gpx altera_avalon_pio
#define USB_GPX_BASE 0x200
#define USB_GPX_BIT_CLEARING_EDGE_REGISTER 0
#define USB_GPX_BIT_MODIFYING_OUTPUT_REGISTER 0
#define USB_GPX_CAPTURE 0
#define USB_GPX_DATA_WIDTH 1
#define USB_GPX_DO_TEST_BENCH_WIRING 0
#define USB_GPX_DRIVEN_SIM_VALUE 0
#define USB_GPX_EDGE_TYPE "NONE"
#define USB_GPX_FREQ 50000000
#define USB_GPX_HAS_IN 1
#define USB_GPX_HAS_OUT 0
#define USB_GPX_HAS_TRI 0
#define USB_GPX_IRQ -1
#define USB_GPX_IRQ_INTERRUPT_CONTROLLER_ID -1
#define USB_GPX_IRQ_TYPE "NONE"
#define USB_GPX_NAME "/dev/usb_gpx"
#define USB_GPX_RESET_VALUE 0
#define USB_GPX_SPAN 16
#define USB_GPX_TYPE "altera_avalon_pio"


/*
 * usb_irq configuration
 *
 */

#define ALT_MODULE_CLASS_usb_irq altera_avalon_pio
#define USB_IRQ_BASE 0x1f0
#define USB_IRQ_BIT_CLEARING_EDGE_REGISTER 0
#define USB_IRQ_BIT_MODIFYING_OUTPUT_REGISTER 0
#define USB_IRQ_CAPTURE 0
#define USB_IRQ_DATA_WIDTH 1
#define USB_IRQ_DO_TEST_BENCH_WIRING 0
#define USB_IRQ_DRIVEN_SIM_VALUE 0
#define USB_IRQ_EDGE_TYPE "NONE"
#define USB_IRQ_FREQ 50000000
#define USB_IRQ_HAS_IN 1
#define USB_IRQ_HAS_OUT 0
#define USB_IRQ_HAS_TRI 0
#define USB_IRQ_IRQ -1
#define USB_IRQ_IRQ_INTERRUPT_CONTROLLER_ID -1
#define USB_IRQ_IRQ_TYPE "NONE"
#define USB_IRQ_NAME "/dev/usb_irq"
#define USB_IRQ_RESET_VALUE 0
#define USB_IRQ_SPAN 16
#define USB_IRQ_TYPE "altera_avalon_pio"


/*
 * usb_rst configuration
 *
 */

#define ALT_MODULE_CLASS_usb_rst altera_avalon_pio
#define USB_RST_BASE 0x210
#define USB_RST_BIT_CLEARING_EDGE_REGISTER 0
#define USB_RST_BIT_MODIFYING_OUTPUT_REGISTER 0
#define USB_RST_CAPTURE 0
#define USB_RST_DATA_WIDTH 1
#define USB_RST_DO_TEST_BENCH_WIRING 0
#define USB_RST_DRIVEN_SIM_VALUE 0
#define USB_RST_EDGE_TYPE "NONE"
#define USB_RST_FREQ 50000000
#define USB_RST_HAS_IN 0
#define USB_RST_HAS_OUT 1
#define USB_RST_HAS_TRI 0
#define USB_RST_IRQ -1
#define USB_RST_IRQ_INTERRUPT_CONTROLLER_ID -1
#define USB_RST_IRQ_TYPE "NONE"
#define USB_RST_NAME "/dev/usb_rst"
#define USB_RST_RESET_VALUE 0
#define USB_RST_SPAN 16
#define USB_RST_TYPE "altera_avalon_pio"


/*
 * x_displ configuration
 *
 */

#define ALT_MODULE_CLASS_x_displ altera_avalon_pio
#define X_DISPL_BASE 0x1e0
#define X_DISPL_BIT_CLEARING_EDGE_REGISTER 0
#define X_DISPL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define X_DISPL_CAPTURE 0
#define X_DISPL_DATA_WIDTH 8
#define X_DISPL_DO_TEST_BENCH_WIRING 0
#define X_DISPL_DRIVEN_SIM_VALUE 0
#define X_DISPL_EDGE_TYPE "NONE"
#define X_DISPL_FREQ 50000000
#define X_DISPL_HAS_IN 0
#define X_DISPL_HAS_OUT 1
#define X_DISPL_HAS_TRI 0
#define X_DISPL_IRQ -1
#define X_DISPL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define X_DISPL_IRQ_TYPE "NONE"
#define X_DISPL_NAME "/dev/x_displ"
#define X_DISPL_RESET_VALUE 0
#define X_DISPL_SPAN 16
#define X_DISPL_TYPE "altera_avalon_pio"


/*
 * y_displ configuration
 *
 */

#define ALT_MODULE_CLASS_y_displ altera_avalon_pio
#define Y_DISPL_BASE 0x1d0
#define Y_DISPL_BIT_CLEARING_EDGE_REGISTER 0
#define Y_DISPL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define Y_DISPL_CAPTURE 0
#define Y_DISPL_DATA_WIDTH 8
#define Y_DISPL_DO_TEST_BENCH_WIRING 0
#define Y_DISPL_DRIVEN_SIM_VALUE 0
#define Y_DISPL_EDGE_TYPE "NONE"
#define Y_DISPL_FREQ 50000000
#define Y_DISPL_HAS_IN 0
#define Y_DISPL_HAS_OUT 1
#define Y_DISPL_HAS_TRI 0
#define Y_DISPL_IRQ -1
#define Y_DISPL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define Y_DISPL_IRQ_TYPE "NONE"
#define Y_DISPL_NAME "/dev/y_displ"
#define Y_DISPL_RESET_VALUE 0
#define Y_DISPL_SPAN 16
#define Y_DISPL_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
