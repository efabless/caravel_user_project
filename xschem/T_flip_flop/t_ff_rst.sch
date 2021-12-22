v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -2410 -820 -2410 -750 { lab=Q}
N -2430 -720 -2410 -720 { lab=T}
N -2180 -570 -2180 -550 { lab=Clk}
N -2080 -740 -2040 -740 { lab=Q}
N -2410 -820 -2080 -820 { lab=Q}
N -2080 -820 -2080 -740 { lab=Q}
N -2320 -640 -2280 -640 { lab=RST}
C {exor_gate/exor_gate.sym} -2920 -640 0 0 {name=X2}
C {devices/ipin.sym} -2420 -720 0 0 {name=p1 lab=T}
C {devices/ipin.sym} -2180 -560 3 0 {name=p2 lab=Clk}
C {devices/opin.sym} -2050 -740 0 0 {name=p3 lab=Q}
C {devices/ipin.sym} -2310 -640 0 0 {name=p4 lab=RST}
C {D_flip_flop/d_ff_rst.sym} -1640 -370 0 0 {name=X3}
