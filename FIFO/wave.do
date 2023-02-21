onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fifo/clk
add wave -noupdate /tb_fifo/wr
add wave -noupdate /tb_fifo/rd
add wave -noupdate /tb_fifo/reset
add wave -noupdate /tb_fifo/data_in
add wave -noupdate /tb_fifo/data_out
add wave -noupdate /tb_fifo/fifo_full
add wave -noupdate /tb_fifo/fifo_empty
add wave -noupdate /tb_fifo/fifo_thresh
add wave -noupdate /tb_fifo/fifo_overflow
add wave -noupdate /tb_fifo/fifo_underflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {1 ns}
