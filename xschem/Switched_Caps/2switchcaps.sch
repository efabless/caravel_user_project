v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -50 0 0 0 { lab=c1}
N 0 0 0 60 { lab=c1}
N 150 0 200 0 { lab=out}
N 200 0 200 60 { lab=out}
N 200 0 250 0 { lab=out}
N 0 0 50 0 { lab=c1}
N -240 0 -150 0 { lab=in}
N -100 40 -100 120 { lab=phi1_clk_n}
N -100 -120 -100 -40 { lab=phi1_clk_p}
N 100 -120 100 -40 { lab=phi2_clk_p}
N 100 40 100 120 { lab=phi2_clk_n}
C {devices/gnd.sym} 0 120 0 0 {name=l2 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 0 90 0 0 {name=C1 model=cap_mim_m3_1 W=Wcap L=Lcap MF=1 spiceprefix=X}
C {devices/gnd.sym} 200 120 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 200 90 0 0 {name=C2 model=cap_mim_m3_1 W=Wcap L=Lcap MF=1 spiceprefix=X}
C {devices/iopin.sym} 250 0 0 0 {name=p1 lab=out}
C {devices/iopin.sym} -240 0 2 0 {name=p2 lab=in}
C {devices/ipin.sym} -100 120 3 0 {name=p3 lab=phi1_clk_n}
C {devices/ipin.sym} -100 -120 1 0 {name=p4 lab=phi1_clk_p}
C {devices/ipin.sym} 100 -120 1 0 {name=p5 lab=phi2_clk_p}
C {devices/ipin.sym} 100 120 3 0 {name=p6 lab=phi2_clk_n}
C {devices/lab_pin.sym} 0 0 1 0 {name=l1 sig_type=std_logic lab=c1}
C {devices/netlist.sym} -40 -280 0 0 {name=s1 value=".ic v(c1)=0 v(out)=0"}
C {transmission_gate/transmission_gate.sym} -100 0 0 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {transmission_gate/transmission_gate.sym} 100 0 0 0 {name=X2 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
