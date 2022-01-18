v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -50 0 0 0 { lab=c1}
N 0 0 0 20 { lab=c1}
N 150 0 200 0 { lab=out}
N 200 0 200 20 { lab=out}
N 200 0 250 0 { lab=out}
N 0 0 50 0 { lab=c1}
N -240 0 -150 0 { lab=in}
N 100 -120 100 -40 { lab=phi2_clk_p}
N 100 40 100 120 { lab=phi2_clk_n}
N -200 200 -140 200 { lab=thresh1}
N 200 80 200 220 { lab=c2b}
N -200 160 -100 160 { lab=cclk}
N -200 240 -140 240 { lab=thresh2}
N -200 -120 100 -120 { lab=phi2_clk_p}
N -100 -60 -100 -40 { lab=phi1_clk_p}
N -200 -60 -100 -60 { lab=phi1_clk_p}
N -200 60 -100 60 { lab=phi1_clk_n}
N -100 40 -100 60 { lab=phi1_clk_n}
N -200 120 100 120 { lab=phi2_clk_n}
N -80 220 200 220 { lab=c2b}
N -100 160 -100 170 { lab=cclk}
N -200 280 -100 280 { lab=cclkb}
N -100 270 -100 280 { lab=cclkb}
C {devices/gnd.sym} 0 80 0 0 {name=l2 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 0 50 0 0 {name=C1 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 200 50 0 0 {name=C2 model=cap_mim_m3_1 W=Wcap L=Lcap MF=1 spiceprefix=X}
C {devices/iopin.sym} 250 0 0 0 {name=p1 lab=out}
C {devices/iopin.sym} -240 0 2 0 {name=p2 lab=in}
C {devices/ipin.sym} -200 60 0 0 {name=p3 lab=phi1_clk_n}
C {devices/ipin.sym} -200 -60 0 0 {name=p4 lab=phi1_clk_p}
C {devices/ipin.sym} -200 -120 0 0 {name=p5 lab=phi2_clk_p}
C {devices/ipin.sym} -200 120 0 0 {name=p6 lab=phi2_clk_n}
C {devices/lab_pin.sym} 0 0 1 0 {name=l1 sig_type=std_logic lab=c1}
C {devices/netlist.sym} -220 -240 0 0 {name=s1 value="
*init cap top and bottom plates at 0V:
.ic v(c1)=0 v(out)=0
*c2 will settle at thresh1
*.ic v(xc1.a)=0 v(xc1.b1)=0 v(xc2.a)=0 v(xc2.b1)=0
"
*v(c2b)=0"}
C {devices/ipin.sym} -200 200 0 0 {name=p7 lab=thresh1}
C {devices/ipin.sym} -200 160 0 0 {name=p8 lab=cclk}
C {devices/lab_pin.sym} 200 220 2 0 {name=l3 sig_type=std_logic lab=c2b}
C {devices/ipin.sym} -200 240 0 0 {name=p9 lab=thresh2}
C {transmission_gate/transmission_gate.sym} -100 0 0 0 {name=X1 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {transmission_gate/transmission_gate.sym} 100 0 0 0 {name=X2 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {comparator/analogMux.sym} -140 270 0 0 {name=x3}
C {devices/ipin.sym} -200 280 0 0 {name=p10 lab=cclkb}
