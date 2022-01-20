v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {http://diychip.org/sky130/sky130_fd_sc_lp/cells/dfrbp/} 120 -40 0 0 0.2 0.2 {}
T {Divide by 2} 230 -180 0 0 0.4 0.4 {}
T {Generate 
threshold
swapping clk} 460 -330 2 0 0.4 0.4 {}
T {Generate 
non-overlapping 
phi1/phi2 clks} 490 -670 2 0 0.4 0.4 {}
T {Filter clk for bank} 30 -600 0 0 0.4 0.4 {}
T {To next wavelet (octave)} 580 -130 0 0 0.4 0.4 {}
T {Comparator
sampling clk} 840 -750 0 0 0.4 0.4 {}
T {Last cap
thresh clk} 910 -470 0 0 0.4 0.4 {}
T {Phi1/Phi2 gated by rstb} 150 -530 0 0 0.4 0.4 {}
N 910 -640 940 -640 { lab=phi2b}
N 680 -540 680 -520 { lab=Vpb}
N 540 -480 540 -460 { lab=Vnb}
N 780 -500 820 -500 { lab=phi1dd}
N 910 -480 940 -480 { lab=phi1b}
N 910 -680 940 -680 { lab=phi2}
N 910 -520 940 -520 { lab=phi1}
N 640 -500 680 -500 { lab=phi1d}
N 680 -700 680 -680 { lab=Vpb}
N 540 -640 540 -590 { lab=Vnb}
N 780 -660 820 -660 { lab=phi2dd}
N 640 -660 680 -660 { lab=phi2d}
N 460 -590 500 -590 { lab=gclk1}
N 500 -660 500 -590 { lab=gclk1}
N 500 -660 540 -660 { lab=gclk1}
N 460 -550 500 -550 { lab=gclk2}
N 500 -550 500 -500 { lab=gclk2}
N 500 -500 540 -500 { lab=gclk2}
N 170 -120 190 -120 { lab=#net1}
N 170 -120 170 -60 { lab=#net1}
N 170 -60 370 -60 { lab=#net1}
N 370 -120 370 -60 { lab=#net1}
N 110 -570 110 -140 { lab=clk}
N 110 -140 190 -140 { lab=clk}
N 50 -570 110 -570 { lab=clk}
N 50 -100 190 -100 { lab=rst_b}
N 880 -260 910 -260 { lab=cclkb}
N 880 -300 910 -300 { lab=cclk}
N 370 -140 790 -140 { lab=clkdiv2}
N 400 -280 540 -280 { lab=#net2}
N 540 -260 540 -240 { lab=Vnb}
N 660 -260 660 -240 { lab=Vnb}
N 640 -280 660 -280 { lab=div2d}
N 760 -280 790 -280 { lab=div2dd}
N 110 -570 160 -570 { lab=clk}
N 340 -570 400 -570 { lab=gclk}
N 130 -550 160 -550 { lab=rst_b}
N 130 -550 130 -100 { lab=rst_b}
N 390 -210 390 -140 { lab=clkdiv2}
N 250 -210 390 -210 { lab=clkdiv2}
N 250 -260 250 -210 { lab=clkdiv2}
N 250 -260 280 -260 { lab=clkdiv2}
N 110 -300 280 -300 { lab=clk}
C {devices/vsource.sym} 1080 -420 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} 1080 -390 0 0 {name=l2 lab=GND}
C {devices/netlist.sym} 1020 -295 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
*.tran \{(1/100)*(1/f)\} \{256/f\}
.tran 1n 10u
.save all
"}
C {devices/vdd.sym} 1080 -450 0 0 {name=l5 lab=VDD}
C {devices/vsource.sym} 1140 -420 0 0 {name=V3 value=PULSE(0,1.2,0,1n,1n,200n,400n)}
C {devices/gnd.sym} 1140 -390 0 0 {name=l31 lab=GND}
C {devices/lab_pin.sym} 1140 -450 0 0 {name=l3 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 660 -500 1 0 {name=l8 sig_type=std_logic lab=phi1d}
C {devices/lab_pin.sym} 680 -540 1 0 {name=l12 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 540 -460 3 0 {name=l13 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 800 -500 1 0 {name=l14 sig_type=std_logic lab=phi1dd}
C {devices/lab_pin.sym} 660 -660 1 0 {name=l18 sig_type=std_logic lab=phi2d}
C {devices/lab_pin.sym} 680 -700 1 0 {name=l19 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 540 -590 3 0 {name=l20 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 800 -660 1 0 {name=l21 sig_type=std_logic lab=phi2dd}
C {sky130_stdcells/dfrbp_1.sym} 280 -120 0 0 {name=x11 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 650 -280 1 0 {name=l26 sig_type=std_logic lab=div2d}
C {clkgen/comp_clks.sym} 870 -660 0 0 {name=X4 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {clkgen/comp_clks.sym} 870 -500 0 0 {name=X7 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {clkgen/comp_clks.sym} 840 -280 0 0 {name=X10 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 540 -240 3 0 {name=l6 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 660 -240 3 0 {name=l7 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 770 -280 1 0 {name=l9 sig_type=std_logic lab=div2dd}
C {sky130_stdcells/dlclkp_1.sym} 250 -560 0 0 {name=x12 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 360 -570 1 0 {name=l10 sig_type=std_logic lab=gclk}
C {clkgen/comp_clks_1stage.sym} 450 -570 0 0 {name=X1 Wpmos=1.26 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {sky130_stdcells/and2_0.sym} 340 -280 0 0 {name=x2 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {inv/inv_weak_pulldown.sym} 590 -660 0 0 {name=X2 Wpmos=1.26 Lmin=0.18 Wmin=0.42 Lnmos=0.54}
C {inv/inv_weak_pulldown.sym} 590 -500 0 0 {name=X5 Wpmos=1.26 Lmin=0.18 Wmin=0.42 Lnmos=0.54}
C {inv/inv_weak_pulldown.sym} 590 -280 0 0 {name=X8 Wpmos=1.26 Lmin=0.18 Wmin=0.42 Lnmos=0.54}
C {inv/inv_weak_pulldown.sym} 710 -280 0 0 {name=X9 Wpmos=1.26 Lmin=0.18 Wmin=0.42 Lnmos=0.54}
C {inv/inv_weak_pullup.sym} 730 -660 0 0 {name=X3 Wpmos=1.26 Lpmos=0.54 Wmin=0.42 Lmin=0.18}
C {inv/inv_weak_pullup.sym} 730 -500 0 0 {name=X6 Wpmos=1.26 Lpmos=0.54 Wmin=0.42 Lmin=0.18}
C {devices/lab_pin.sym} 50 -570 0 0 {name=l11 sig_type=std_logic lab=clk}
C {devices/vsource.sym} 1540 -410 0 0 {name=V2 value=PULSE(0,1.2,50n,1n,1n,1,2)}
C {devices/gnd.sym} 1540 -380 0 0 {name=l15 lab=GND}
C {devices/lab_pin.sym} 1540 -440 0 0 {name=l16 sig_type=std_logic lab=rst_b}
C {devices/lab_pin.sym} 50 -100 0 0 {name=l17 sig_type=std_logic lab=rst_b}
C {devices/lab_pin.sym} 940 -680 2 0 {name=l22 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 940 -640 2 0 {name=l23 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 940 -520 2 0 {name=l24 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 940 -480 2 0 {name=l25 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 910 -300 2 0 {name=l27 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 910 -260 2 0 {name=l28 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 790 -140 2 0 {name=l29 sig_type=std_logic lab=clkdiv2}
C {devices/vsource.sym} 1350 -410 0 0 {name=V4 value=1.2}
C {devices/gnd.sym} 1350 -380 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 1420 -410 0 0 {name=V5 value=0}
C {devices/gnd.sym} 1420 -380 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 1420 -440 2 0 {name=l30 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 1350 -440 2 0 {name=l32 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 500 -630 0 0 {name=l33 sig_type=std_logic lab=gclk1}
C {devices/lab_pin.sym} 500 -520 0 0 {name=l34 sig_type=std_logic lab=gclk2}
