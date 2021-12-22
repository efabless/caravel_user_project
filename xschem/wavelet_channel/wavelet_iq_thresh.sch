v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO is 
50% duty cycle} -340 50 1 0 0.4 0.4 {}
T {Phi clks are 
25% duty cycle} -340 240 1 0 0.4 0.4 {}
N 510 -240 680 -240 { lab=op_i}
N -90 320 -50 320 { lab=phi2_clkb}
N -230 320 -190 320 { lab=phi2_clk}
N 510 -120 680 -120 { lab=om_i}
N 510 0 680 0 { lab=op_q}
N 510 120 680 120 { lab=om_q}
N -170 -240 -170 0 { lab=inp}
N -170 0 -50 0 { lab=inp}
N -200 80 -50 80 { lab=inm}
N -200 -160 -200 80 { lab=inm}
N -90 240 -50 240 { lab=phi1_clkb}
N -230 240 -190 240 { lab=phi1_clk}
N 0 -140 0 -100 { lab=lo_i}
N 0 100 0 180 { lab=lo_q}
N -230 180 0 180 { lab=lo_q}
N -200 -160 -50 -160 { lab=inm}
N -220 -160 -200 -160 { lab=inm}
N -170 -240 -50 -240 { lab=inp}
N -220 -240 -170 -240 { lab=inp}
N 50 -240 210 -240 { lab=ipi}
N 50 -160 80 -160 { lab=imi}
N 80 -160 80 -120 { lab=imi}
N 80 -120 210 -120 { lab=imi}
N 50 0 210 0 { lab=ipq}
N 50 80 80 80 { lab=imq}
N 80 80 80 120 { lab=imq}
N 80 120 210 120 { lab=imq}
N 640 -220 640 140 { lab=phi3_clkb}
N -230 470 620 470 { lab=thresh}
N 160 180 330 180 { lab=phi1_clk}
N 160 -180 160 180 { lab=phi1_clk}
N 160 -180 330 -180 { lab=phi1_clk}
N 160 60 330 60 { lab=phi1_clk}
N 160 -60 330 -60 { lab=phi1_clk}
N 170 -280 330 -280 { lab=phi1_clkb}
N 170 -280 170 80 { lab=phi1_clkb}
N 170 80 330 80 { lab=phi1_clkb}
N 170 -40 330 -40 { lab=phi1_clkb}
N 170 -160 330 -160 { lab=phi1_clkb}
N 370 -280 570 -280 { lab=phi2_clkb}
N 570 -280 570 80 { lab=phi2_clkb}
N 370 80 570 80 { lab=phi2_clkb}
N 370 -40 570 -40 { lab=phi2_clkb}
N 370 -160 570 -160 { lab=phi2_clkb}
N 370 180 560 180 { lab=phi2_clk}
N 560 -180 560 180 { lab=phi2_clk}
N 370 -180 560 -180 { lab=phi2_clk}
N 370 -60 560 -60 { lab=phi2_clk}
N 370 60 560 60 { lab=phi2_clk}
N 510 -220 640 -220 { lab=phi3_clkb}
N 510 -100 640 -100 { lab=phi3_clkb}
N 510 20 640 20 { lab=phi3_clkb}
N 510 140 640 140 { lab=phi3_clkb}
N 640 -280 640 -220 { lab=phi3_clkb}
N 510 -200 620 -200 { lab=thresh}
N 620 -200 620 470 { lab=thresh}
N 510 -80 620 -80 { lab=thresh}
N 510 40 620 40 { lab=thresh}
N 510 160 620 160 { lab=thresh}
N 510 -210 630 -210 { lab=phi3_clk}
N 630 -210 630 180 { lab=phi3_clk}
N 510 150 630 150 { lab=phi3_clk}
N 510 30 630 30 { lab=phi3_clk}
N 510 -90 630 -90 { lab=phi3_clk}
N -90 400 -50 400 { lab=phi3_clkb}
N -230 400 -190 400 { lab=phi3_clk}
C {inv/inv.sym} -140 320 0 0 {name=X8}
C {devices/lab_pin.sym} 170 -280 1 0 {name=l13 sig_type=std_logic lab=phi1_clkb}
C {mux/multiplier_differential.sym} 0 -200 0 0 {name=X1}
C {mux/multiplier_differential.sym} 0 40 0 0 {name=X2}
C {devices/lab_pin.sym} 570 -280 1 0 {name=l18 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 160 180 3 0 {name=l27 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 560 180 3 0 {name=l29 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} -50 320 2 0 {name=l35 sig_type=std_logic lab=phi2_clkb}
C {inv/inv.sym} -140 240 0 0 {name=X7}
C {devices/lab_pin.sym} -50 240 2 0 {name=l37 sig_type=std_logic lab=phi1_clkb}
C {devices/lab_pin.sym} 80 80 1 0 {name=l41 sig_type=std_logic lab=imq}
C {devices/lab_pin.sym} 80 0 1 0 {name=l42 sig_type=std_logic lab=ipq}
C {devices/lab_pin.sym} 80 -160 1 0 {name=l43 sig_type=std_logic lab=imi}
C {devices/lab_pin.sym} 80 -240 1 0 {name=l44 sig_type=std_logic lab=ipi}
C {devices/ipin.sym} -220 -240 0 0 {name=p1 lab=inp}
C {devices/ipin.sym} -220 -160 0 0 {name=p2 lab=inm}
C {devices/ipin.sym} -230 240 0 0 {name=p3 lab=phi1_clk}
C {devices/ipin.sym} -230 320 0 0 {name=p4 lab=phi2_clk}
C {devices/ipin.sym} -230 180 0 0 {name=p5 lab=lo_q}
C {devices/ipin.sym} -230 120 0 0 {name=p6 lab=lo_i}
C {devices/opin.sym} 680 -240 0 0 {name=p7 lab=op_i}
C {devices/opin.sym} 680 -120 0 0 {name=p8 lab=om_i}
C {devices/opin.sym} 680 0 0 0 {name=p9 lab=op_q}
C {devices/opin.sym} 680 120 0 0 {name=p10 lab=om_q}
C {devices/ipin.sym} -230 470 0 0 {name=p11 lab=thresh}
C {devices/lab_pin.sym} 0 -100 3 0 {name=l1 sig_type=std_logic lab=lo_i}
C {devices/lab_pin.sym} 640 -280 1 0 {name=l2 sig_type=std_logic lab=phi3_clkb}
C {devices/lab_pin.sym} 630 180 3 0 {name=l3 sig_type=std_logic lab=phi3_clk}
C {inv/inv.sym} -140 400 0 0 {name=X9}
C {devices/lab_pin.sym} -50 400 2 0 {name=l4 sig_type=std_logic lab=phi3_clkb}
C {devices/ipin.sym} -230 400 0 0 {name=p12 lab=phi3_clk}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 350 -230 0 0 {name=X3 W=20 L=20}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 350 -110 0 0 {name=X4 W=20 L=20}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 350 10 0 0 {name=X5 W=20 L=20}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} 350 130 0 0 {name=X6 W=20 L=20}
