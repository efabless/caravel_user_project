v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO is 50% duty cycle} -280 140 0 0 0.4 0.4 {}
N 440 -370 470 -370 { lab=opi}
N 440 -190 470 -190 { lab=omi}
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
N 50 -160 100 -160 { lab=imi}
N 50 0 150 0 { lab=ipq}
N 50 80 100 80 { lab=imq}
N 100 80 100 120 { lab=imq}
N 50 -240 140 -240 { lab=ipi}
N 140 -370 140 -360 { lab=ipi}
N 140 -360 140 -240 { lab=ipi}
N 100 -160 140 -160 { lab=imi}
N 140 -190 140 -160 { lab=imi}
N 450 0 480 0 { lab=opq}
N 450 180 480 180 { lab=omq}
N 100 120 100 180 { lab=imq}
N 100 180 150 180 { lab=imq}
C {devices/lab_pin.sym} 260 -310 0 0 {name=l12 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 -410 0 0 {name=l13 sig_type=std_logic lab=phi1_clkb}
C {mux/multiplier_differential.sym} 0 -200 0 0 {name=X1}
C {mux/multiplier_differential.sym} 0 40 0 0 {name=X2}
C {devices/lab_pin.sym} 300 -310 2 0 {name=l6 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 -410 2 0 {name=l18 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 -130 0 0 {name=l19 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 -230 0 0 {name=l20 sig_type=std_logic lab=phi1_clkb}
C {devices/lab_pin.sym} 300 -130 2 0 {name=l21 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 -230 2 0 {name=l22 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 100 80 1 0 {name=l41 sig_type=std_logic lab=imq}
C {devices/lab_pin.sym} 90 0 1 0 {name=l42 sig_type=std_logic lab=ipq}
C {devices/lab_pin.sym} 100 -160 1 0 {name=l43 sig_type=std_logic lab=imi}
C {devices/lab_pin.sym} 100 -240 1 0 {name=l44 sig_type=std_logic lab=ipi}
C {devices/ipin.sym} -220 -240 0 0 {name=p1 lab=inp}
C {devices/ipin.sym} -220 -160 0 0 {name=p2 lab=inm}
C {devices/ipin.sym} -80 -540 0 0 {name=p3 lab=phi1_clk}
C {devices/ipin.sym} -80 -460 0 0 {name=p4 lab=phi2_clk}
C {devices/ipin.sym} -230 180 0 0 {name=p5 lab=lo_q}
C {devices/ipin.sym} -230 120 0 0 {name=p6 lab=lo_i}
C {devices/opin.sym} 470 -370 0 0 {name=p7 lab=opi}
C {devices/opin.sym} 470 -190 0 0 {name=p8 lab=omi}
C {devices/ipin.sym} -80 -500 0 0 {name=p11 lab=phi1_clkb}
C {devices/ipin.sym} -80 -420 0 0 {name=p12 lab=phi2_clkb}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 280 -180 0 0 {name=X7 W=20 L=20}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 280 -360 0 0 {name=X3 W=20 L=20}
C {devices/ipin.sym} -80 -380 0 0 {name=p14 lab=cclk}
C {devices/ipin.sym} -80 -350 0 0 {name=p15 lab=cclkb}
C {devices/ipin.sym} -80 -310 0 0 {name=p16 lab=thresh1}
C {devices/ipin.sym} -80 -280 0 0 {name=p13 lab=thresh2}
C {devices/lab_pin.sym} 420 -410 2 0 {name=l1 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 420 -310 2 0 {name=l2 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 440 -350 2 0 {name=l3 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 440 -330 2 0 {name=l4 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 440 -170 2 0 {name=l5 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 440 -150 2 0 {name=l7 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 420 -230 2 0 {name=l8 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 420 -130 2 0 {name=l9 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 270 60 0 0 {name=l10 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 270 -40 0 0 {name=l11 sig_type=std_logic lab=phi1_clkb}
C {devices/lab_pin.sym} 310 60 2 0 {name=l14 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 310 -40 2 0 {name=l15 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 270 240 0 0 {name=l16 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 270 140 0 0 {name=l17 sig_type=std_logic lab=phi1_clkb}
C {devices/lab_pin.sym} 310 240 2 0 {name=l23 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 310 140 2 0 {name=l24 sig_type=std_logic lab=phi2_clkb}
C {devices/opin.sym} 480 0 0 0 {name=p9 lab=opq}
C {devices/opin.sym} 480 180 0 0 {name=p10 lab=omq}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 290 190 0 0 {name=X4 W=20 L=20}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 290 10 0 0 {name=X5 W=20 L=20}
C {devices/lab_pin.sym} 430 -40 2 0 {name=l25 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 430 60 2 0 {name=l26 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 450 20 2 0 {name=l27 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 450 40 2 0 {name=l28 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 450 200 2 0 {name=l29 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 450 220 2 0 {name=l30 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 430 140 2 0 {name=l31 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 430 240 2 0 {name=l32 sig_type=std_logic lab=cclk}
C {inv/inv.sym} 40 -480 0 0 {name=X6 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} -10 -480 0 0 {name=l33 sig_type=std_logic lab=lo_i}
C {devices/lab_pin.sym} 90 -480 2 0 {name=l34 sig_type=std_logic lab=lo_ibar}
C {inv/inv.sym} 40 -400 0 0 {name=X8 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} -10 -400 0 0 {name=l35 sig_type=std_logic lab=lo_q}
C {devices/lab_pin.sym} 90 -400 2 0 {name=l36 sig_type=std_logic lab=lo_qbar}
C {devices/lab_pin.sym} 0 -270 2 0 {name=l37 sig_type=std_logic lab=lo_ibar}
C {devices/lab_pin.sym} 0 -30 2 0 {name=l38 sig_type=std_logic lab=lo_qbar}
