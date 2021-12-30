v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 330 -450 480 -450 { lab=out}
N 330 -390 480 -390 { lab=GND}
N 700 -450 850 -450 { lab=out2}
N 700 -390 850 -390 { lab=GND}
N 660 -570 660 -420 { lab=out}
N 530 -610 530 -420 { lab=out2}
N 480 -520 480 -450 { lab=out}
N 700 -520 700 -450 { lab=out2}
N 480 -520 660 -520 { lab=out}
N 520 -300 660 -300 { lab=clk}
N 480 -210 590 -210 { lab=rem}
N 590 -210 700 -210 { lab=rem}
N 230 -270 480 -270 { lab=leftGD}
N 230 -550 440 -550 { lab=leftGD}
N 230 -550 230 -270 { lab=leftGD}
N 700 -270 950 -270 { lab=rightGSD}
N 950 -550 950 -270 { lab=rightGSD}
N 740 -550 950 -550 { lab=rightGSD}
N 660 -610 660 -570 { lab=out}
N 590 -150 590 -90 { lab=GND}
N 440 -490 480 -490 { lab=out}
N 430 -240 440 -240 { lab=Vinp}
N 740 -240 750 -240 { lab=Vinm}
N 550 -300 550 -180 { lab=clk}
N 480 -180 550 -180 { lab=clk}
N 290 -420 290 20 { lab=clkbar}
N 290 20 890 20 { lab=clkbar}
N 890 -420 890 20 { lab=clkbar}
N 260 -110 290 -110 { lab=clkbar}
N 440 -610 530 -610 { lab=out2}
N 530 -450 700 -450 { lab=out2}
N 440 -420 530 -420 { lab=out2}
N 440 -550 520 -550 { lab=leftGD}
N 810 -420 890 -420 { lab=clkbar}
N 660 -300 740 -300 { lab=clk}
N 660 -240 740 -240 { lab=Vinm}
C {devices/vdd.sym} 480 -640 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 700 -640 0 0 {name=l5 lab=VDD}
C {devices/vdd.sym} 480 -330 0 0 {name=l6 lab=VDD}
C {devices/vdd.sym} 700 -330 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 400 -390 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 790 -390 0 0 {name=l19 lab=GND}
C {devices/ipin.sym} 260 -110 0 0 {name=p1 lab=clkbar}
C {devices/opin.sym} 440 -490 0 1 {name=p2 lab=out}
C {devices/ipin.sym} 430 -240 0 0 {name=p3 lab=Vinp}
C {devices/ipin.sym} 750 -240 0 1 {name=p4 lab=Vinm}
C {devices/ipin.sym} 480 -180 0 0 {name=p5 lab=clk}
C {devices/gnd.sym} 590 -90 0 0 {name=l8 lab=GND}
C {sky130_fd_pr/pfet3_01v8.sym} 680 -610 0 0 {name=M3
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 720 -550 0 1 {name=M4
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 460 -610 2 1 {name=M5
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 500 -550 2 0 {name=M6
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 720 -300 2 0 {name=M11
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 500 -300 0 1 {name=M12
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 310 -420 0 0 {name=M7
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 680 -420 0 0 {name=M8
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 830 -420 2 1 {name=M9
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 460 -420 2 1 {name=M10
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 460 -240 0 0 {name=M13
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 680 -240 2 1 {name=M14
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 570 -180 0 0 {name=M15
L=0.18
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
C {devices/lab_pin.sym} 230 -520 0 0 {name=l1 sig_type=std_logic lab=leftGD}
C {devices/lab_pin.sym} 480 -580 0 0 {name=l2 sig_type=std_logic lab=leftSD}
C {devices/lab_pin.sym} 700 -480 0 1 {name=l9 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 950 -530 0 1 {name=l10 sig_type=std_logic lab=rightGSD}
C {devices/lab_pin.sym} 700 -580 0 1 {name=l11 sig_type=std_logic lab=rightSD}
C {devices/lab_pin.sym} 690 -210 1 1 {name=l12 sig_type=std_logic lab=rem}
