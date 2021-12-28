v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 330 -450 480 -450 { lab=o1}
N 330 -390 480 -390 { lab=GND}
N 700 -450 850 -450 { lab=o2}
N 700 -390 850 -390 { lab=GND}
N 660 -570 660 -420 { lab=o1}
N 520 -610 520 -420 { lab=o2}
N 480 -520 480 -450 { lab=o1}
N 700 -520 700 -450 { lab=o2}
N 480 -520 660 -520 { lab=o1}
N 520 -450 700 -450 { lab=o2}
N 520 -300 660 -300 { lab=clk}
N 480 -210 590 -210 { lab=#net1}
N 590 -210 700 -210 { lab=#net1}
N 230 -270 480 -270 { lab=#net2}
N 230 -550 440 -550 { lab=#net2}
N 230 -550 230 -270 { lab=#net2}
N 700 -270 950 -270 { lab=#net3}
N 950 -550 950 -270 { lab=#net3}
N 740 -550 950 -550 { lab=#net3}
N 660 -610 660 -570 { lab=o1}
N 490 -90 670 -90 { lab=#net4}
N 590 -150 590 -90 { lab=#net4}
N 440 -490 480 -490 { lab=o1}
N 700 -490 740 -490 { lab=o2}
C {devices/vsource.sym} 260 -210 0 0 {name=V1 value=sin(0.6,0.01,5000)}
C {devices/code_shown.sym} 770 -170 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 1m
.save all
"}
C {sky130_fd_pr/pfet3_01v8.sym} 680 -610 0 0 {name=M3
L=1
W=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 500 -610 0 1 {name=M4
L=1
W=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 460 -550 0 0 {name=M5
L=1
W=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 720 -550 0 1 {name=M6
L=1
W=4
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
C {sky130_fd_pr/nfet3_01v8.sym} 310 -420 0 0 {name=M7
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 500 -420 0 1 {name=M8
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 680 -420 0 0 {name=M9
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 870 -420 0 1 {name=M10
L=1
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
C {sky130_fd_pr/pfet3_01v8.sym} 680 -300 0 0 {name=M11
L=1
W=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 500 -300 0 1 {name=M12
L=1
W=4
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
C {sky130_fd_pr/nfet3_01v8.sym} 720 -240 0 1 {name=M13
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 460 -240 0 0 {name=M14
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 570 -180 0 0 {name=M15
L=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 470 -60 0 0 {name=M16
L=1
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
C {sky130_fd_pr/cap_mim_m3_1.sym} 670 -60 0 0 {name=C2 model=cap_mim_m3_1 W=10 L=10 MF=1 spiceprefix=X}
C {devices/vdd.sym} 480 -640 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 700 -640 0 0 {name=l5 lab=VDD}
C {devices/vdd.sym} 480 -330 0 0 {name=l6 lab=VDD}
C {devices/vdd.sym} 700 -330 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 490 -30 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 670 -30 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 550 -180 0 0 {name=l10 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 450 -60 0 0 {name=l11 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 590 -300 1 0 {name=l12 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 290 -420 0 0 {name=l13 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 890 -420 0 1 {name=l14 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 440 -240 0 0 {name=l15 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 740 -240 0 1 {name=l16 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 440 -490 0 0 {name=l17 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 740 -490 0 1 {name=l18 sig_type=std_logic lab=o2}
C {devices/vsource.sym} 260 -100 0 0 {name=V2 value=0.6}
C {devices/vsource.sym} 350 -150 0 0 {name=V3 value=PULSE(0,1,0,1n,1n,10u,20u)}
C {devices/vsource.sym} 350 -30 0 0 {name=V4 value=1}
C {devices/lab_pin.sym} 260 -240 0 0 {name=l20 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 260 -130 0 1 {name=l21 sig_type=std_logic lab=inm}
C {devices/gnd.sym} 260 -180 0 0 {name=l22 lab=GND}
C {devices/gnd.sym} 260 -70 0 0 {name=l23 lab=GND}
C {devices/lab_pin.sym} 350 -180 0 0 {name=l24 sig_type=std_logic lab=clk}
C {devices/vdd.sym} 350 -60 0 0 {name=l25 lab=VDD}
C {devices/gnd.sym} 350 -120 0 0 {name=l26 lab=GND}
C {devices/gnd.sym} 350 0 0 0 {name=l27 lab=GND}
C {devices/vsource.sym} 1020 -240 0 0 {name=V5 value=PULSE(1,0,0,1n,1n,10u,20u)}
C {devices/lab_pin.sym} 1020 -270 0 0 {name=l1 sig_type=std_logic lab=clkbar}
C {devices/gnd.sym} 1020 -210 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 400 -390 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 790 -390 0 0 {name=l19 lab=GND}
