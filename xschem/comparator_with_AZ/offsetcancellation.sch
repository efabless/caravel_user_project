v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 640 -600 820 -600 { lab=GND}
N 820 -600 1000 -600 { lab=GND}
N 1000 -600 1180 -600 { lab=GND}
N 1000 -660 1180 -660 { lab=outm}
N 640 -660 820 -660 { lab=outp}
N 820 -830 1000 -830 { lab=com2}
N 820 -710 820 -660 { lab=outp}
N 1000 -710 1000 -660 { lab=outm}
N 960 -740 960 -630 { lab=outp}
N 860 -740 860 -630 { lab=outm}
N 860 -690 1000 -690 { lab=outm}
N 820 -670 960 -670 { lab=outp}
N 780 -690 820 -690 { lab=outp}
N 1000 -690 1040 -690 { lab=outm}
N 180 -800 350 -800 { lab=VDD}
N 180 -680 350 -680 { lab=#net1}
N 190 -680 190 -650 { lab=#net1}
N 350 -680 350 -610 { lab=#net1}
N 190 -530 350 -530 { lab=GND}
N 350 -550 350 -530 { lab=GND}
N 80 -740 180 -740 { lab=dom}
N 350 -740 440 -740 { lab=dop}
N 980 -350 980 -340 { lab=sw}
N 980 -340 990 -340 { lab=sw}
N 300 -350 300 -340 { lab=sw}
N 300 -340 310 -340 { lab=sw}
N 220 -770 310 -770 { lab=clk}
N 180 -710 350 -710 { lab=GND}
C {devices/netlist.sym} 20 -200 0 0 {name=SPICE1 only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.include /home/sky/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__nfet_20v0__tt_discrete.corner.spice
.include /home/sky/sky130A/libs.ref/sky130_fd_pr/spice/sky130_fd_pr__pfet_20v0__tt_discrete.corner.spice
.options abstol=1e-14 reltol=1e-4
.param capl=10
.param capw=20
.tran 0.1u 10u
.save all
"}
C {devices/vsource.sym} 920 -210 0 0 {name=VDD4 value="DC 1.2"}
C {devices/gnd.sym} 920 -180 0 0 {name=l57 lab=GND}
C {devices/vdd.sym} 920 -240 0 0 {name=l58 lab=VDD}
C {devices/vsource.sym} 600 -340 0 0 {name=Vinp11 value=PULSE(0,1.2,80n,1n,1n,100n,430n)}
C {devices/gnd.sym} 600 -310 0 0 {name=l155 lab=GND}
C {devices/lab_pin.sym} 600 -370 0 0 {name=l156 sig_type=std_logic lab=clk1}
C {devices/vsource.sym} 600 -250 0 0 {name=Vinp12 value=PULSE(0,1.2,0,1n,1n,200n,430n,180)}
C {devices/gnd.sym} 600 -220 0 0 {name=l157 lab=GND}
C {devices/lab_pin.sym} 600 -280 0 0 {name=l158 sig_type=std_logic lab=clk2}
C {sky130_fd_pr/pfet3_01v8.sym} 890 -860 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 370 -580 0 1 {name=M2
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
C {sky130_fd_pr/pfet3_01v8.sym} 800 -800 0 0 {name=M4
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
C {sky130_fd_pr/pfet3_01v8.sym} 1020 -800 0 1 {name=M5
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
C {sky130_fd_pr/pfet3_01v8.sym} 840 -740 0 1 {name=M6
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
C {sky130_fd_pr/pfet3_01v8.sym} 980 -740 0 0 {name=M7
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
C {sky130_fd_pr/nfet3_01v8.sym} 620 -630 0 0 {name=M8
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
C {sky130_fd_pr/nfet3_01v8.sym} 840 -630 0 1 {name=M9
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
C {sky130_fd_pr/nfet3_01v8.sym} 980 -630 0 0 {name=M10
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
C {sky130_fd_pr/nfet3_01v8.sym} 1200 -630 0 1 {name=M11
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
C {devices/vdd.sym} 910 -890 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 910 -600 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 870 -860 0 0 {name=l3 sig_type=std_logic lab=clk2b}
C {devices/lab_pin.sym} 600 -630 0 0 {name=l4 sig_type=std_logic lab=clk2b}
C {devices/lab_pin.sym} 1220 -630 0 1 {name=l5 sig_type=std_logic lab=clk2b}
C {devices/lab_pin.sym} 1040 -690 0 1 {name=l6 sig_type=std_logic lab=outm}
C {devices/lab_pin.sym} 780 -690 0 0 {name=l7 sig_type=std_logic lab=outp}
C {sky130_fd_pr/pfet3_01v8.sym} 200 -770 0 1 {name=M12
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
C {sky130_fd_pr/pfet3_01v8.sym} 330 -770 0 0 {name=M13
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
C {devices/vdd.sym} 260 -800 0 0 {name=l8 lab=VDD}
C {sky130_fd_pr/nfet_20v0_zvt.sym} 160 -710 0 0 {name=M14
L=4
W=20
mult=1
model=nfet_20v0_zvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_20v0_zvt.sym} 370 -710 0 1 {name=M15
L=4
W=20
mult=1
model=nfet_20v0_zvt
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8.sym} 170 -620 0 0 {name=M16
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
C {sky130_fd_pr/nfet3_01v8.sym} 170 -560 0 0 {name=M17
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
C {devices/gnd.sym} 270 -530 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 150 -620 0 0 {name=l10 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 150 -560 0 0 {name=l11 sig_type=std_logic lab=vb}
C {devices/lab_pin.sym} 390 -580 0 1 {name=l12 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 910 -830 3 0 {name=l13 sig_type=std_logic lab=com2}
C {devices/lab_pin.sym} 440 -740 0 1 {name=l14 sig_type=std_logic lab=dop}
C {devices/lab_pin.sym} 80 -740 0 0 {name=l15 sig_type=std_logic lab=dom}
C {devices/lab_pin.sym} 1040 -800 0 1 {name=l16 sig_type=std_logic lab=dop}
C {devices/lab_pin.sym} 780 -800 0 0 {name=l17 sig_type=std_logic lab=dom}
C {devices/lab_pin.sym} 390 -710 0 1 {name=l18 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 140 -710 0 0 {name=l19 sig_type=std_logic lab=inp}
C {devices/capa.sym} 1060 -390 3 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {transmission_gate/transmission_gate.sym} 1270 -130 0 0 {name=X1 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 1320 -130 0 1 {name=l20 sig_type=std_logic lab=dom}
C {devices/lab_pin.sym} 1220 -130 0 0 {name=l21 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 1270 -170 0 0 {name=l22 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1270 -90 0 0 {name=l23 sig_type=std_logic lab=rst}
C {transmission_gate/transmission_gate.sym} 1080 -130 0 0 {name=X2 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 1130 -130 0 1 {name=l24 sig_type=std_logic lab=dop}
C {devices/lab_pin.sym} 1030 -130 0 0 {name=l25 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 1080 -170 0 0 {name=l26 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1080 -90 0 0 {name=l27 sig_type=std_logic lab=rst}
C {devices/lab_pin.sym} 1090 -390 2 0 {name=l28 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 1030 -390 1 0 {name=l29 sig_type=std_logic lab=pp}
C {transmission_gate/transmission_gate.sym} 1030 -340 1 0 {name=X3 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {transmission_gate/transmission_gate.sym} 980 -390 2 0 {name=X4 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 980 -340 0 0 {name=l30 sig_type=std_logic lab=sw}
C {devices/lab_pin.sym} 1070 -340 2 0 {name=l31 sig_type=std_logic lab=swb}
C {devices/lab_pin.sym} 980 -430 1 0 {name=l32 sig_type=std_logic lab=swb}
C {devices/lab_pin.sym} 930 -390 0 0 {name=l33 sig_type=std_logic lab=vinp}
C {devices/lab_pin.sym} 1030 -290 2 0 {name=l40 sig_type=std_logic lab=vrst__vcm}
C {devices/capa.sym} 380 -390 3 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 410 -390 2 0 {name=l42 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 350 -390 1 0 {name=l43 sig_type=std_logic lab=pm}
C {transmission_gate/transmission_gate.sym} 350 -340 1 0 {name=X7 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {transmission_gate/transmission_gate.sym} 300 -390 2 0 {name=X8 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 300 -340 0 0 {name=l44 sig_type=std_logic lab=sw}
C {devices/lab_pin.sym} 390 -340 2 0 {name=l45 sig_type=std_logic lab=swb}
C {devices/lab_pin.sym} 300 -430 1 0 {name=l46 sig_type=std_logic lab=swb}
C {devices/lab_pin.sym} 250 -390 0 0 {name=l47 sig_type=std_logic lab=vinm}
C {devices/lab_pin.sym} 350 -290 2 0 {name=l48 sig_type=std_logic lab=vrst__vcm}
C {devices/lab_pin.sym} 1320 -370 0 1 {name=l35 sig_type=std_logic lab=clk1b}
C {devices/lab_pin.sym} 1320 -280 0 1 {name=l37 sig_type=std_logic lab=clk2b}
C {devices/vsource.sym} 600 -520 0 0 {name=Vinp3 value=PULSE(0,1.2,0,1n,1n,160n,430n)}
C {devices/gnd.sym} 600 -490 0 0 {name=l38 lab=GND}
C {devices/lab_pin.sym} 600 -550 0 0 {name=l39 sig_type=std_logic lab=rst}
C {devices/vsource.sym} 600 -430 0 0 {name=Vinp4 value=PULSE(0,1.2,0,1n,1n,180n,430n)}
C {devices/gnd.sym} 600 -400 0 0 {name=l41 lab=GND}
C {devices/lab_pin.sym} 600 -460 0 0 {name=l49 sig_type=std_logic lab=sw}
C {devices/lab_pin.sym} 1320 -550 0 1 {name=l51 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1320 -460 0 1 {name=l53 sig_type=std_logic lab=swb}
C {devices/lab_pin.sym} 260 -770 1 1 {name=l54 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 260 -710 0 0 {name=l55 lab=GND}
C {devices/vsource.sym} 60 -300 0 0 {name=Vinp7 value=sin(0.6,0.2,500000,180)}
C {devices/gnd.sym} 60 -270 0 0 {name=l56 lab=GND}
C {devices/lab_pin.sym} 60 -330 0 0 {name=l59 sig_type=std_logic lab=vinm}
C {devices/vsource.sym} 1250 -760 0 0 {name=Vinp8 value=sin(0.6,0.2,500000)}
C {devices/gnd.sym} 1250 -730 0 0 {name=l60 lab=GND}
C {devices/lab_pin.sym} 1250 -790 0 0 {name=l61 sig_type=std_logic lab=vinp}
C {sky130_stdcells/or2_0.sym} 570 -820 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 510 -840 0 0 {name=l62 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 510 -800 0 0 {name=l63 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 630 -820 0 1 {name=l64 sig_type=std_logic lab=clk}
C {devices/vsource.sym} 60 -460 0 0 {name=Vinp9 value=0.2}
C {devices/gnd.sym} 60 -430 0 0 {name=l65 lab=GND}
C {devices/lab_pin.sym} 60 -490 0 0 {name=l66 sig_type=std_logic lab=vb}
C {devices/vsource.sym} 200 -460 0 0 {name=Vinp10 value=0.6}
C {devices/gnd.sym} 200 -430 0 0 {name=l67 lab=GND}
C {devices/lab_pin.sym} 200 -490 2 0 {name=l69 sig_type=std_logic lab=vrst__vcm}
C {sky130_stdcells/inv_1.sym} 1280 -550 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 1280 -460 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 1280 -370 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 1280 -280 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 1240 -370 0 0 {name=l34 sig_type=std_logic lab=clk1}
C {devices/lab_pin.sym} 1240 -280 0 0 {name=l36 sig_type=std_logic lab=clk2}
C {devices/lab_pin.sym} 1240 -550 0 0 {name=l50 sig_type=std_logic lab=rst}
C {devices/lab_pin.sym} 1240 -460 0 0 {name=l52 sig_type=std_logic lab=sw}
