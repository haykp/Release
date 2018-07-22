onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib topBlock_opt

do {wave.do}

view wave
view structure
view signals

do {topBlock.udo}

run -all

quit -force
