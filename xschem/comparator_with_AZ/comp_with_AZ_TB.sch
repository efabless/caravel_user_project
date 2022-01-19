v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 40 -80 180 -80 { lab=inp}
N 570 -740 720 -740 { lab=high}
N 570 -680 720 -680 { lab=GND}
N 940 -740 1090 -740 { lab=low}
N 940 -680 1090 -680 { lab=GND}
N 900 -860 900 -710 { lab=high}
N 760 -900 760 -710 { lab=low}
N 720 -810 720 -740 { lab=high}
N 940 -810 940 -740 { lab=low}
N 720 -810 900 -810 { lab=high}
N 760 -740 940 -740 { lab=low}
N 1160 -890 1300 -890 { lab=phi1}
N 1120 -800 1230 -800 { lab=#net1}
N 1230 -800 1340 -800 { lab=#net1}
N 900 -900 900 -860 { lab=high}
N 700 -780 720 -780 { lab=high}
N 940 -780 970 -780 { lab=low}
N 1020 -80 1160 -80 { lab=inm}
N 460 -80 530 -80 { lab=o2int}
N 590 -80 750 -80 { lab=o2}
N 750 -80 880 -80 { lab=o2}
N 1570 -80 1730 -80 { lab=o2q}
N 1730 -80 1860 -80 { lab=o2q}
N 1440 -80 1510 -80 { lab=o2qint}
N 1550 -880 1690 -880 { lab=inptest}
N 1550 -1150 1690 -1150 { lab=inmtest}
N 1130 -710 1190 -710 { lab=phi1b}
C {devices/lab_pin.sym} 370 0 3 0 {name=l208 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 410 0 3 0 {name=l209 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 370 -140 1 0 {name=l210 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 410 -140 1 0 {name=l211 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 230 0 3 0 {name=l212 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 270 0 3 0 {name=l213 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 230 -140 1 0 {name=l214 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 270 -140 1 0 {name=l215 sig_type=std_logic lab=phi2b}
C {comparator_with_AZ/2switchcaps.sym} 250 -80 0 0 {name=X36 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 40 -80 0 0 {name=l220 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 320 -80 1 0 {name=l3 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 880 -80 2 0 {name=l5 sig_type=std_logic lab=o2}
C {comparator_with_AZ/2switchcaps.sym} 390 -80 0 0 {name=X1 Wcap=capw Lcap=capl}
C {devices/netlist.sym} 550 -1210 0 0 {name=SPICE2 only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.include /home/sky/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_01v8_lvt__tt_discrete.corner.spice
.include /home/sky/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_20v0__tt_discrete.corner.spice
.include /home/sky/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_20v0__tt_discrete.corner.spice
.options abstol=1e-14 reltol=1e-4
.param capw=20
.param capl=5
.tran 1n 0.5m
.save all
"}
C {devices/vsource.sym} 350 -830 0 0 {name=VDD1 value="DC 1.2"}
C {devices/gnd.sym} 350 -800 0 0 {name=l93 lab=GND}
C {devices/vdd.sym} 350 -860 0 0 {name=l94 lab=VDD}
C {devices/vsource.sym} 820 -990 0 0 {name=Vfclk5 value=PULSE(0,1.2,0,1n,1n,180n,400n)}
C {devices/gnd.sym} 820 -960 0 0 {name=l95 lab=GND}
C {sky130_fd_pr/pfet3_01v8.sym} 920 -900 0 0 {name=M1
L=0.15
W=0.42
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 740 -900 0 1 {name=M2
L=0.15
W=0.42
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 700 -840 0 0 {name=M16
L=0.15
W=5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 960 -840 0 1 {name=M17
L=0.15
W=5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 550 -710 0 0 {name=M18
L=0.15
W=0.42
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 740 -710 0 1 {name=M19
L=0.15
W=0.42
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 920 -710 0 0 {name=M20
L=0.15
W=0.42
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 1110 -710 0 1 {name=M21
L=0.15
W=0.42
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 1210 -770 0 0 {name=M26
L=0.15
W=5
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/vdd.sym} 720 -930 0 0 {name=l97 lab=VDD}
C {devices/vdd.sym} 940 -930 0 0 {name=l98 lab=VDD}
C {devices/vdd.sym} 1120 -920 0 0 {name=l99 lab=VDD}
C {devices/vdd.sym} 1340 -920 0 0 {name=l100 lab=VDD}
C {devices/gnd.sym} 1230 -680 0 0 {name=l101 lab=GND}
C {devices/gnd.sym} 640 -680 0 0 {name=l102 lab=GND}
C {devices/gnd.sym} 1030 -680 0 0 {name=l103 lab=GND}
C {devices/lab_pin.sym} 980 -840 0 1 {name=l104 sig_type=std_logic lab=FN}
C {devices/lab_pin.sym} 680 -840 0 0 {name=l105 sig_type=std_logic lab=FP}
C {devices/lab_pin.sym} 1190 -770 0 0 {name=l106 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 700 -780 0 0 {name=l107 sig_type=std_logic lab=high}
C {devices/lab_pin.sym} 970 -780 2 0 {name=l108 sig_type=std_logic lab=low}
C {devices/lab_pin.sym} 1230 -890 1 0 {name=l109 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1130 -710 3 0 {name=l110 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 530 -710 0 0 {name=l111 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 820 -1020 0 0 {name=l114 sig_type=std_logic lab=phi1}
C {devices/vsource.sym} 450 -1000 0 0 {name=Vfclk1 value=PULSE(0,1.2,0,1n,1n,180n,400n,180)}
C {devices/gnd.sym} 450 -970 0 0 {name=l115 lab=GND}
C {devices/lab_pin.sym} 450 -1030 0 0 {name=l116 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} 300 -1190 0 0 {name=Vfclk2 value=PULSE(1.2,0,0,1n,1n,180n,400n)}
C {devices/gnd.sym} 300 -1160 0 0 {name=l117 lab=GND}
C {devices/lab_pin.sym} 300 -1220 0 0 {name=l118 sig_type=std_logic lab=phi1b}
C {devices/vsource.sym} 300 -1090 0 0 {name=Vfclk3 value=PULSE(1.2,0,0,1n,1n,180n,400n,180)}
C {devices/gnd.sym} 300 -1060 0 0 {name=l119 lab=GND}
C {devices/lab_pin.sym} 300 -1120 0 0 {name=l120 sig_type=std_logic lab=phi2b}
C {sky130_fd_pr/pfet3_01v8.sym} 1320 -890 0 0 {name=M3
L=0.15
W=0.42
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 1140 -890 0 1 {name=M5
L=0.15
W=0.42
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1120 -860 0 0 {name=l124 sig_type=std_logic lab=FP}
C {devices/lab_pin.sym} 1340 -860 0 1 {name=l125 sig_type=std_logic lab=FN}
C {devices/vsource.sym} 40 -50 0 0 {name=Vinp2 value="DC 0 SIN(0 0.2 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 40 40 0 0 {name=l22 lab=GND}
C {devices/vsource.sym} 40 10 0 0 {name=Vinp3 value="DC 0 SIN(0.7 0.2 12k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} 1350 0 3 0 {name=l1 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1390 0 3 0 {name=l2 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1350 -140 1 0 {name=l4 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1390 -140 1 0 {name=l6 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 1210 0 3 0 {name=l7 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1250 0 3 0 {name=l8 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1210 -140 1 0 {name=l9 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1250 -140 1 0 {name=l10 sig_type=std_logic lab=phi2b}
C {comparator_with_AZ/2switchcaps.sym} 1230 -80 0 0 {name=X2 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 1020 -80 0 0 {name=l11 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 1300 -80 1 0 {name=l12 sig_type=std_logic lab=o1q}
C {devices/lab_pin.sym} 1860 -80 2 0 {name=l13 sig_type=std_logic lab=o2q}
C {comparator_with_AZ/2switchcaps.sym} 1370 -80 0 0 {name=X3 Wcap=capw Lcap=capl}
C {devices/vsource.sym} 1020 -50 0 0 {name=Vinp1 value="DC 0 SIN(0 -0.2 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 1020 40 0 0 {name=l14 lab=GND}
C {devices/vsource.sym} 1020 10 0 0 {name=Vinp4 value="DC 0 SIN(0.7 -0.2 12k)"
*SIN (0.6 0.6 1k)"}
C {sky130_fd_pr/cap_mim_m3_1.sym} 560 -80 3 0 {name=C1 model=cap_mim_m3_1 W=10 L=10 MF=1 spiceprefix=X}
C {comparator_with_AZ/2switchcaps.sym} 750 -150 3 0 {name=X4 Wcap=capw Lcap=capl}
C {comparator_with_AZ/2switchcaps.sym} 750 -290 3 0 {name=X5 Wcap=capw Lcap=capl}
C {comparator_with_AZ/2switchcaps.sym} 750 -10 1 0 {name=X6 Wcap=capw Lcap=capl}
C {comparator_with_AZ/2switchcaps.sym} 750 130 1 0 {name=X7 Wcap=capw Lcap=capl}
C {devices/gnd.sym} 750 340 0 0 {name=l16 lab=GND}
C {devices/vdd.sym} 750 -500 0 0 {name=l17 lab=VDD}
C {sky130_stdcells/and2_0.sym} 150 -970 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 140 -660 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 90 -990 0 0 {name=l18 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 90 -950 2 1 {name=l19 sig_type=std_logic lab=low}
C {sky130_stdcells/and2_0.sym} 150 -890 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 90 -910 0 0 {name=l20 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 90 -870 2 1 {name=l21 sig_type=std_logic lab=high}
C {sky130_stdcells/and2_0.sym} 150 -810 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 90 -830 0 0 {name=l23 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 90 -790 2 1 {name=l24 sig_type=std_logic lab=low}
C {sky130_stdcells/and2_0.sym} 150 -730 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 90 -750 0 0 {name=l25 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 90 -710 2 1 {name=l26 sig_type=std_logic lab=high}
C {devices/lab_pin.sym} 210 -970 2 0 {name=l27 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 210 -890 2 0 {name=l28 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 210 -810 2 0 {name=l29 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 210 -730 2 0 {name=l30 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 100 -660 2 1 {name=l31 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 100 -610 2 1 {name=l32 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 100 -560 2 1 {name=l33 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 100 -510 2 1 {name=l34 sig_type=std_logic lab=phi2xhigh}
C {sky130_stdcells/inv_1.sym} 140 -610 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 140 -560 0 0 {name=x7 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 140 -510 0 0 {name=x8 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 180 -660 2 0 {name=l35 sig_type=std_logic lab=phi1xlowb}
C {devices/lab_pin.sym} 180 -610 2 0 {name=l36 sig_type=std_logic lab=phi1xhighb}
C {devices/lab_pin.sym} 180 -560 2 0 {name=l37 sig_type=std_logic lab=phi2xlowb}
C {devices/lab_pin.sym} 180 -510 2 0 {name=l38 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 830 -130 2 0 {name=l39 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 830 -170 2 0 {name=l40 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 830 -310 2 0 {name=l41 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 830 -270 2 0 {name=l42 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 690 -270 2 1 {name=l43 sig_type=std_logic lab=phi1xlowb}
C {devices/lab_pin.sym} 690 -170 2 1 {name=l44 sig_type=std_logic lab=phi2xlowb}
C {devices/lab_pin.sym} 690 -310 2 1 {name=l45 sig_type=std_logic lab=phi2xlowb}
C {devices/lab_pin.sym} 690 -130 2 1 {name=l46 sig_type=std_logic lab=phi1xlowb}
C {devices/lab_pin.sym} 670 -30 2 1 {name=l47 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 670 110 2 1 {name=l48 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 670 10 2 1 {name=l49 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 670 150 2 1 {name=l50 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 810 150 2 0 {name=l51 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 810 10 2 0 {name=l52 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 810 -30 2 0 {name=l53 sig_type=std_logic lab=phi1xhighb}
C {devices/lab_pin.sym} 810 110 2 0 {name=l54 sig_type=std_logic lab=phi1xhighb}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1540 -80 3 0 {name=C2 model=cap_mim_m3_1 W=10 L=10 MF=1 spiceprefix=X}
C {comparator_with_AZ/2switchcaps.sym} 1730 -290 3 0 {name=X8 Wcap=capw Lcap=capl}
C {comparator_with_AZ/2switchcaps.sym} 1730 -430 3 0 {name=X9 Wcap=capw Lcap=capl}
C {comparator_with_AZ/2switchcaps.sym} 1730 -10 1 0 {name=X10 Wcap=capw Lcap=capl}
C {comparator_with_AZ/2switchcaps.sym} 1730 130 1 0 {name=X11 Wcap=capw Lcap=capl}
C {devices/gnd.sym} 1730 -500 2 0 {name=l56 lab=GND}
C {devices/vdd.sym} 1730 340 2 0 {name=l57 lab=VDD}
C {devices/lab_pin.sym} 1810 -270 2 0 {name=l58 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 1810 -310 2 0 {name=l59 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 1810 -450 2 0 {name=l60 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 1810 -410 2 0 {name=l61 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 1670 -410 2 1 {name=l62 sig_type=std_logic lab=phi1xlowb}
C {devices/lab_pin.sym} 1670 -310 2 1 {name=l63 sig_type=std_logic lab=phi2xlowb}
C {devices/lab_pin.sym} 1670 -450 2 1 {name=l64 sig_type=std_logic lab=phi2xlowb}
C {devices/lab_pin.sym} 1670 -270 2 1 {name=l65 sig_type=std_logic lab=phi1xlowb}
C {devices/lab_pin.sym} 1650 -30 2 1 {name=l66 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 1650 110 2 1 {name=l67 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 1650 10 2 1 {name=l68 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 1650 150 2 1 {name=l69 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 1790 150 2 0 {name=l70 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 1790 10 2 0 {name=l71 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 1790 -30 2 0 {name=l72 sig_type=std_logic lab=phi1xhighb}
C {devices/lab_pin.sym} 1790 110 2 0 {name=l73 sig_type=std_logic lab=phi1xhighb}
C {devices/lab_pin.sym} 1880 -800 3 0 {name=l55 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1920 -800 3 0 {name=l74 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1880 -940 1 0 {name=l75 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1920 -940 1 0 {name=l76 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 1740 -800 3 0 {name=l77 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1780 -800 3 0 {name=l78 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1740 -940 1 0 {name=l79 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1780 -940 1 0 {name=l80 sig_type=std_logic lab=phi2b}
C {comparator_with_AZ/2switchcaps.sym} 1760 -880 0 0 {name=X12 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 1550 -880 0 0 {name=l81 sig_type=std_logic lab=inptest}
C {devices/lab_pin.sym} 1830 -880 1 0 {name=l82 sig_type=std_logic lab=o11}
C {comparator_with_AZ/2switchcaps.sym} 1900 -880 0 0 {name=X13 Wcap=capw Lcap=capl}
C {devices/vsource.sym} 1550 -850 0 0 {name=Vinp5 value="DC 0 SIN(0 0.2 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 1550 -760 0 0 {name=l83 lab=GND}
C {devices/vsource.sym} 1550 -790 0 0 {name=Vinp6 value="DC 0 SIN(0.7 0.2 12k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} 1880 -1070 3 0 {name=l84 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1920 -1070 3 0 {name=l85 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1880 -1210 1 0 {name=l86 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1920 -1210 1 0 {name=l87 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 1740 -1070 3 0 {name=l88 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1780 -1070 3 0 {name=l89 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1740 -1210 1 0 {name=l90 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1780 -1210 1 0 {name=l91 sig_type=std_logic lab=phi2b}
C {comparator_with_AZ/2switchcaps.sym} 1760 -1150 0 0 {name=X14 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 1550 -1150 0 0 {name=l92 sig_type=std_logic lab=inmtest}
C {devices/lab_pin.sym} 1830 -1150 1 0 {name=l96 sig_type=std_logic lab=o11q}
C {comparator_with_AZ/2switchcaps.sym} 1900 -1150 0 0 {name=X15 Wcap=capw Lcap=capl}
C {devices/vsource.sym} 1550 -1120 0 0 {name=Vinp7 value="DC 0 SIN(0 -0.2 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 1550 -1030 0 0 {name=l112 lab=GND}
C {devices/vsource.sym} 1550 -1060 0 0 {name=Vinp8 value="DC 0 SIN(0.7 -0.2 12k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} 1970 -1150 2 0 {name=l113 sig_type=std_logic lab=o22q}
C {devices/lab_pin.sym} 1970 -880 2 0 {name=l122 sig_type=std_logic lab=o22}
C {devices/lab_pin.sym} 460 -80 1 0 {name=l126 sig_type=std_logic lab=o2int}
C {devices/lab_pin.sym} 1080 -830 0 0 {name=l15 sig_type=std_logic lab=o2}
C {devices/lab_pin.sym} 1380 -830 0 1 {name=l121 sig_type=std_logic lab=o2q}
C {sky130_fd_pr/nfet3_01v8.sym} 1100 -830 0 0 {name=M4
L=0.15
W=2
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 1360 -830 0 1 {name=M6
L=0.15
W=2
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 1210 -710 0 0 {name=M7
L=0.15
W=5
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {comparator_with_AZ/2switchcaps.sym} 750 -430 3 0 {name=X16 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 830 -450 2 0 {name=l123 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 830 -410 2 0 {name=l127 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 690 -410 2 1 {name=l128 sig_type=std_logic lab=phi1xlowb}
C {devices/lab_pin.sym} 690 -450 2 1 {name=l129 sig_type=std_logic lab=phi2xlowb}
C {comparator_with_AZ/2switchcaps.sym} 750 270 1 0 {name=X17 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 670 250 2 1 {name=l130 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 670 290 2 1 {name=l131 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 810 290 2 0 {name=l132 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 810 250 2 0 {name=l133 sig_type=std_logic lab=phi1xhighb}
C {comparator_with_AZ/2switchcaps.sym} 1730 -150 3 0 {name=X18 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 1810 -130 2 0 {name=l134 sig_type=std_logic lab=phi1xlow}
C {devices/lab_pin.sym} 1810 -170 2 0 {name=l135 sig_type=std_logic lab=phi2xlow}
C {devices/lab_pin.sym} 1670 -170 2 1 {name=l136 sig_type=std_logic lab=phi2xlowb}
C {devices/lab_pin.sym} 1670 -130 2 1 {name=l137 sig_type=std_logic lab=phi1xlowb}
C {comparator_with_AZ/2switchcaps.sym} 1730 270 1 0 {name=X19 Wcap=capw Lcap=capl}
C {devices/lab_pin.sym} 1650 250 2 1 {name=l138 sig_type=std_logic lab=phi1xhigh}
C {devices/lab_pin.sym} 1650 290 2 1 {name=l139 sig_type=std_logic lab=phi2xhigh}
C {devices/lab_pin.sym} 1790 290 2 0 {name=l140 sig_type=std_logic lab=phi2xhighb}
C {devices/lab_pin.sym} 1790 250 2 0 {name=l141 sig_type=std_logic lab=phi1xhighb}
C {devices/lab_pin.sym} 1470 -80 1 0 {name=l142 sig_type=std_logic lab=o2qint}
