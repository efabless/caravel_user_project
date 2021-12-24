v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {http://diychip.org/sky130/sky130_fd_sc_lp/cells/dfrbp/} -240 360 0 0 0.2 0.2 {}
T {Divide by 2} -150 230 0 0 0.4 0.4 {}
T {Generate 
threshold
swapping clk} -140 140 2 0 0.4 0.4 {}
T {Generate 
non-overlapping 
phi1/phi2 clks} 70 -290 2 0 0.4 0.4 {}
T {Filter clk for bank} -420 -190 0 0 0.4 0.4 {}
T {To next wavelet (octave)} 130 280 0 0 0.4 0.4 {}
T {5ns prop delay} 20 120 0 0 0.4 0.4 {}
N 310 -230 340 -230 { lab=phi1b}
N 80 -130 80 -110 { lab=Vpb}
N -60 -70 -60 -50 { lab=Vnb}
N 180 -90 220 -90 { lab=ss2}
N 310 -70 340 -70 { lab=phi2b}
N 310 -270 340 -270 { lab=phi1}
N 310 -110 340 -110 { lab=phi2}
N 40 -90 80 -90 { lab=s2}
N 80 -290 80 -270 { lab=Vpb}
N -60 -230 -60 -180 { lab=Vnb}
N 180 -250 220 -250 { lab=ss1}
N 40 -250 80 -250 { lab=s1}
N -140 -180 -100 -180 { lab=#net1}
N -100 -250 -100 -180 { lab=#net1}
N -100 -250 -60 -250 { lab=#net1}
N -140 -140 -100 -140 { lab=#net2}
N -100 -140 -100 -90 { lab=#net2}
N -100 -90 -60 -90 { lab=#net2}
N -210 290 -190 290 { lab=#net3}
N -210 290 -210 350 { lab=#net3}
N -210 350 -10 350 { lab=#net3}
N -10 290 -10 350 { lab=#net3}
N -280 -160 -230 -160 { lab=clk}
N -280 -160 -280 270 { lab=clk}
N -280 270 -190 270 { lab=clk}
N -280 60 -170 60 { lab=clk}
N -400 -160 -280 -160 { lab=clk}
N -400 310 -190 310 { lab=rstb}
N 310 100 340 100 { lab=cclkb}
N 310 60 340 60 { lab=cclk}
N -10 270 340 270 { lab=clkdiv2}
N 80 80 100 80 { lab=#net4}
N 200 80 220 80 { lab=fclkdiv2_delay}
N -170 100 -170 180 { lab=clkdiv2}
N -170 180 20 180 { lab=clkdiv2}
N 20 180 20 270 { lab=clkdiv2}
N -50 80 -20 80 { lab=#net5}
N -20 100 -20 120 { lab=Vnb}
N 100 40 100 60 { lab=Vpb}
C {devices/lab_pin.sym} 60 -90 1 0 {name=l8 sig_type=std_logic lab=s2}
C {devices/lab_pin.sym} 80 -130 1 0 {name=l12 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} -60 -50 3 0 {name=l13 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 200 -90 1 0 {name=l14 sig_type=std_logic lab=ss2}
C {inv/inv_weak_pullup.sym} 130 -250 0 0 {name=X3 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 60 -250 1 0 {name=l18 sig_type=std_logic lab=s1}
C {devices/lab_pin.sym} 80 -290 1 0 {name=l19 sig_type=std_logic lab=Vpb}
C {inv/inv_weak_pulldown.sym} -10 -250 0 0 {name=X2 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} -60 -180 3 0 {name=l20 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 200 -250 1 0 {name=l21 sig_type=std_logic lab=ss1}
C {sky130_stdcells/dfrbp_1.sym} -100 290 0 0 {name=x12 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_0.sym} -110 80 0 0 {name=x8 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 210 80 3 0 {name=l26 sig_type=std_logic lab=fclkdiv2_delay}
C {devices/ipin.sym} -400 -160 0 0 {name=p1 lab=clk}
C {devices/ipin.sym} -400 310 0 0 {name=p2 lab=rstb}
C {devices/opin.sym} 340 -270 0 0 {name=p3 lab=phi1}
C {devices/opin.sym} 340 -230 0 0 {name=p4 lab=phi1b}
C {devices/opin.sym} 340 -110 0 0 {name=p5 lab=phi2}
C {devices/opin.sym} 340 -70 0 0 {name=p6 lab=phi2b}
C {devices/opin.sym} 340 60 0 0 {name=p7 lab=cclk}
C {devices/opin.sym} 340 100 0 0 {name=p8 lab=cclkb}
C {devices/opin.sym} 340 270 0 0 {name=p9 lab=clkdiv2}
C {devices/ipin.sym} -400 -260 0 0 {name=p10 lab=Vpb}
C {devices/ipin.sym} -400 -230 0 0 {name=p11 lab=Vnb}
C {clkgen/comp_clks.sym} -180 -160 0 0 {name=X1 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {clkgen/comp_clks.sym} 270 -250 0 0 {name=X4 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {clkgen/comp_clks.sym} 270 -90 0 0 {name=X7 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {clkgen/comp_clks.sym} 270 80 0 0 {name=X11 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {inv/inv_weak_pulldown.sym} -10 -90 0 0 {name=X5 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {inv/inv_weak_pullup.sym} 130 -90 0 0 {name=X6 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} -20 120 3 0 {name=l1 sig_type=std_logic lab=Vnb}
C {inv/inv_weak_pulldown.sym} 30 80 0 0 {name=X9 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 100 40 1 0 {name=l2 sig_type=std_logic lab=Vpb}
C {inv/inv_weak_pullup.sym} 150 80 0 0 {name=X10 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
