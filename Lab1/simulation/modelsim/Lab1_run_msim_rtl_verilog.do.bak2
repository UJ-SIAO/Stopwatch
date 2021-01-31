transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/QuartusCode/Lab1 {D:/QuartusCode/Lab1/Lab1.v}
vlog -vlog01compat -work work +incdir+D:/QuartusCode/Lab1 {D:/QuartusCode/Lab1/debounce.v}
vlog -vlog01compat -work work +incdir+D:/QuartusCode/Lab1 {D:/QuartusCode/Lab1/stopwatch.v}
vlog -vlog01compat -work work +incdir+D:/QuartusCode/Lab1 {D:/QuartusCode/Lab1/state.v}
vlog -vlog01compat -work work +incdir+D:/QuartusCode/Lab1 {D:/QuartusCode/Lab1/edge_detect.v}
vlog -vlog01compat -work work +incdir+D:/QuartusCode/Lab1 {D:/QuartusCode/Lab1/seg.v}

