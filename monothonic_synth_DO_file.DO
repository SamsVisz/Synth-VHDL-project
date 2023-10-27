restart -f

force clk 0 0, 1 10 -r 20ns
force speed_up 1
force sequence_enab 01
run 20ns

force speed_up 0
run 20ns

force speed_up 1
run 20ns

force speed_up 0
run 20ns
force speed_up 1
run 20ns

force speed_up 0
run 20ns
force speed_up 1
run 20ns

force speed_up 0
run 20ns
force speed_up 1
run 20ns


force en 10
force C 1
force D 1
force E 1
force F 1
force G 1
force A 0
run 1000000000ns

force sequence_enab 00
force en 01
force C 0
force D 1
force E 1
force F 1
force G 1
force A 1
run 50000000ns
force en 11
force C 0
force D 1
force E 1
force F 1
force G 1
force A 1
run 50000000ns
force en 10
force C 0
force D 1
force E 1
force F 1
force G 1
force A 1
run 50000000ns
force en 00
force C 0
force D 1
force E 1
force F 1
force G 1
force A 1
run 50000000ns
force speed_up 0
run 20ns
force speed_up 1
run 50000000ns

