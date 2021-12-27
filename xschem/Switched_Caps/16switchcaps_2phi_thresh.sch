v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -580 80 -580 220 { lab=phi1_clk}
N -490 0 -470 0 { lab=c2}
N -330 0 -310 0 { lab=c4}
N -170 0 -150 0 { lab=c6}
N -10 0 10 0 { lab=c8}
N 150 0 170 0 { lab=c10}
N 310 0 330 0 { lab=c12}
N 470 0 490 0 { lab=c14}
N 630 0 700 0 { lab=out}
N -420 80 -420 220 { lab=phi1_clk}
N -260 80 -260 220 { lab=phi1_clk}
N -100 80 -100 220 { lab=phi1_clk}
N 60 80 60 220 { lab=phi1_clk}
N 220 80 220 220 { lab=phi1_clk}
N 380 80 380 220 { lab=phi1_clk}
N 540 80 540 220 { lab=phi1_clk}
N 580 -240 580 -60 { lab=phi2_clkb}
N 420 -240 420 -60 { lab=phi2_clkb}
N 260 -240 260 -60 { lab=phi2_clkb}
N 100 -240 100 -60 { lab=phi2_clkb}
N -60 -240 -60 -60 { lab=phi2_clkb}
N -220 -240 -220 -60 { lab=phi2_clkb}
N -380 -240 -380 -60 { lab=phi2_clkb}
N -540 -240 -540 -60 { lab=phi2_clkb}
N -540 -240 580 -240 { lab=phi2_clkb}
N -650 220 540 220 { lab=phi1_clk}
N -540 80 -540 240 { lab=phi2_clk}
N -380 80 -380 240 { lab=phi2_clk}
N -220 80 -220 240 { lab=phi2_clk}
N -60 80 -60 240 { lab=phi2_clk}
N 100 80 100 240 { lab=phi2_clk}
N 260 80 260 240 { lab=phi2_clk}
N 420 80 420 240 { lab=phi2_clk}
N 580 80 580 240 { lab=phi2_clk}
N -620 240 580 240 { lab=phi2_clk}
N 540 -220 540 -60 { lab=phi1_clkb}
N 380 -220 380 -60 { lab=phi1_clkb}
N 220 -220 220 -60 { lab=phi1_clkb}
N 60 -220 60 -60 { lab=phi1_clkb}
N -100 -220 -100 -60 { lab=phi1_clkb}
N -260 -220 -260 -60 { lab=phi1_clkb}
N -420 -220 -420 -60 { lab=phi1_clkb}
N -580 -220 -580 -60 { lab=phi1_clkb}
N -580 -220 540 -220 { lab=phi1_clkb}
N -620 -240 -540 -240 { lab=phi2_clkb}
N -650 -220 -580 -220 { lab=phi1_clkb}
N -700 0 -630 -0 { lab=in}
N 630 40 680 40 { lab=thresh2}
N 620 80 620 260 { lab=cclk}
N -680 260 620 260 { lab=cclk}
N 630 20 660 20 { lab=thresh1}
N 660 20 660 280 { lab=thresh1}
N -650 280 660 280 { lab=thresh1}
N 680 40 680 300 { lab=thresh2}
N -650 300 680 300 { lab=thresh2}
N 620 -260 620 -60 { lab=cclkb}
N -730 -260 620 -260 { lab=cclkb}
C {Switched_Caps/2switchcaps.sym} -560 0 0 0 {name=X1 Wcap=W Lcap=L }
C {Switched_Caps/2switchcaps.sym} -400 0 0 0 {name=X2 Wcap=W Lcap=L }
C {Switched_Caps/2switchcaps.sym} -240 0 0 0 {name=X3 Wcap=W Lcap=L }
C {Switched_Caps/2switchcaps.sym} -80 0 0 0 {name=X4 Wcap=W Lcap=L }
C {Switched_Caps/2switchcaps.sym} 80 0 0 0 {name=X5 Wcap=W Lcap=L }
C {Switched_Caps/2switchcaps.sym} 240 0 0 0 {name=X6 Wcap=W Lcap=L }
C {Switched_Caps/2switchcaps.sym} 400 0 0 0 {name=X7 Wcap=W Lcap=L }
C {devices/iopin.sym} -700 0 2 0 {name=p1 lab=in}
C {devices/iopin.sym} 700 0 0 0 {name=p2 lab=out}
C {devices/ipin.sym} -620 -240 0 0 {name=p3 lab=phi2_clkb}
C {devices/ipin.sym} -650 -220 0 0 {name=p4 lab=phi1_clkb}
C {devices/lab_pin.sym} -480 0 1 0 {name=l2 sig_type=std_logic lab=c2}
C {devices/lab_pin.sym} -320 0 1 0 {name=l3 sig_type=std_logic lab=c4}
C {devices/lab_pin.sym} -160 0 1 0 {name=l4 sig_type=std_logic lab=c6}
C {devices/lab_pin.sym} 0 0 1 0 {name=l5 sig_type=std_logic lab=c8}
C {devices/lab_pin.sym} 160 0 1 0 {name=l6 sig_type=std_logic lab=c10}
C {devices/lab_pin.sym} 320 0 1 0 {name=l7 sig_type=std_logic lab=c12}
C {devices/lab_pin.sym} 480 0 1 0 {name=l8 sig_type=std_logic lab=c14}
C {devices/ipin.sym} -620 240 0 0 {name=p5 lab=phi2_clk}
C {devices/ipin.sym} -650 220 0 0 {name=p6 lab=phi1_clk}
C {Switched_Caps/2switchcaps_thresh.sym} 560 0 0 0 {name=X8 Wcap=W Lcap=L}
C {devices/ipin.sym} -650 280 0 0 {name=p7 lab=thresh1}
C {devices/ipin.sym} -680 260 0 0 {name=p9 lab=cclk}
C {devices/ipin.sym} -650 300 0 0 {name=p8 lab=thresh2}
C {devices/ipin.sym} -730 -260 0 0 {name=p10 lab=cclkb}
