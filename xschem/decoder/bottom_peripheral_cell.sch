v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 90 -60 140 -60 { lab=out_inv}
N 90 -160 90 -60 { lab=out_inv}
N 140 40 140 60 { lab=in}
N 90 -190 90 -160 { lab=out_inv}
N 140 -80 140 -70 { lab=out_inv}
N 140 40 140 60 { lab=in}
N 140 -70 140 -60 { lab=out_inv}
N 140 -210 140 -180 { lab=out}
C {devices/opin.sym} 140 -200 3 0 {name=p2 lab=out}
C {devices/opin.sym} 90 -180 3 0 {name=p3 lab=out_inv}
C {devices/ipin.sym} 140 50 3 0 {name=p1 lab=in}
C {devices/lab_pin.sym} 140 -80 2 0 {name=l1 sig_type=std_logic lab=out_inv}
C {devices/netlist.sym} 240 -70 0 0 {name=s1 value=".ic v(out_inv)=1.2"}
C {inv/inv.sym} 140 -130 3 0 {name=X2 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {inv/inv.sym} 140 -10 3 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
