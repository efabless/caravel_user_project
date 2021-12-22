v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO is 50% duty cycle} -280 140 0 0 0.4 0.4 {}
N 430 -240 460 -240 { lab=opi}
N 430 -120 460 -120 { lab=omi}
N 430 0 460 0 { lab=opq}
N 430 120 460 120 { lab=omq}
N -170 -240 -170 0 { lab=inp}
N -170 0 -50 0 { lab=inp}
N -200 80 -50 80 { lab=inm}
N -200 -160 -200 80 { lab=inm}
N 0 -140 0 -80 { lab=lo_i}
N 0 100 0 180 { lab=lo_q}
N -230 180 0 180 { lab=lo_q}
N -200 -160 -50 -160 { lab=inm}
N -220 -160 -200 -160 { lab=inm}
N -170 -240 -50 -240 { lab=inp}
N -220 -240 -170 -240 { lab=inp}
N -230 120 -90 120 { lab=lo_i}
N -90 -80 -90 120 { lab=lo_i}
N -90 -80 0 -80 { lab=lo_i}
N 50 -240 150 -240 { lab=ipi}
N 50 -160 100 -160 { lab=imi}
N 100 -160 100 -120 { lab=imi}
N 100 -120 150 -120 { lab=imi}
N 50 0 150 0 { lab=ipq}
N 50 80 100 80 { lab=imq}
N 100 80 100 120 { lab=imq}
N 100 120 150 120 { lab=imq}
C {devices/lab_pin.sym} 260 -190 0 0 {name=l12 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 -290 0 0 {name=l13 sig_type=std_logic lab=phi1_clkb}
C {mux/multiplier_differential.sym} 0 -200 0 0 {name=X1}
C {mux/multiplier_differential.sym} 0 40 0 0 {name=X2}
C {Switched_Caps/16switchcaps_2phi.sym} 280 -240 0 0 {name=X3 W=20 L=20}
C {devices/lab_pin.sym} 300 -190 2 0 {name=l6 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 -290 2 0 {name=l18 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 -70 0 0 {name=l19 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 -170 0 0 {name=l20 sig_type=std_logic lab=phi1_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 280 -120 0 0 {name=X4 W=20 L=20}
C {devices/lab_pin.sym} 300 -70 2 0 {name=l21 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 -170 2 0 {name=l22 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 50 0 0 {name=l23 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 -50 0 0 {name=l24 sig_type=std_logic lab=phi1_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 280 0 0 0 {name=X5 W=20 L=20}
C {devices/lab_pin.sym} 300 50 2 0 {name=l25 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 -50 2 0 {name=l26 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 170 0 0 {name=l27 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 70 0 0 {name=l28 sig_type=std_logic lab=phi1_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 280 120 0 0 {name=X6 W=20 L=20}
C {devices/lab_pin.sym} 300 170 2 0 {name=l29 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 70 2 0 {name=l30 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 100 80 1 0 {name=l41 sig_type=std_logic lab=imq}
C {devices/lab_pin.sym} 90 0 1 0 {name=l42 sig_type=std_logic lab=ipq}
C {devices/lab_pin.sym} 100 -160 1 0 {name=l43 sig_type=std_logic lab=imi}
C {devices/lab_pin.sym} 100 -240 1 0 {name=l44 sig_type=std_logic lab=ipi}
C {devices/ipin.sym} -220 -240 0 0 {name=p1 lab=inp}
C {devices/ipin.sym} -220 -160 0 0 {name=p2 lab=inm}
C {devices/ipin.sym} -230 240 0 0 {name=p3 lab=phi1_clk}
C {devices/ipin.sym} -230 320 0 0 {name=p4 lab=phi2_clk}
C {devices/ipin.sym} -230 180 0 0 {name=p5 lab=lo_q}
C {devices/ipin.sym} -230 120 0 0 {name=p6 lab=lo_i}
C {devices/opin.sym} 460 -240 0 0 {name=p7 lab=opi}
C {devices/opin.sym} 460 -120 0 0 {name=p8 lab=omi}
C {devices/opin.sym} 460 0 0 0 {name=p9 lab=opq}
C {devices/opin.sym} 460 120 0 0 {name=p10 lab=omq}
C {devices/ipin.sym} -230 280 0 0 {name=p11 lab=phi1_clkb}
C {devices/ipin.sym} -230 360 0 0 {name=p12 lab=phi2_clkb}
