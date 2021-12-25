v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 330 -450 480 -450 { lab=out1}
N 330 -390 480 -390 { lab=GND}
N 700 -450 850 -450 { lab=out2}
N 700 -390 850 -390 { lab=GND}
N 660 -570 660 -420 { lab=out1}
N 480 -520 480 -450 { lab=out1}
N 700 -520 700 -450 { lab=out2}
N 480 -520 660 -520 { lab=out1}
N 520 -320 660 -320 { lab=clk}
N 480 -210 590 -210 { lab=bottomss}
N 590 -210 700 -210 { lab=bottomss}
N 230 -550 440 -550 { lab=topleftgs}
N 700 -280 950 -280 { lab=toprightgs}
N 740 -550 950 -550 { lab=toprightgs}
N 660 -630 660 -590 { lab=out1}
N 490 -90 670 -90 { lab=bottomds}
N 590 -150 590 -90 { lab=bottomds}
N 440 -490 480 -490 { lab=out1}
N 430 -240 440 -240 { lab=Vinp}
N 740 -240 750 -240 { lab=Vinm}
N 550 -300 550 -180 { lab=clk}
N 480 -180 550 -180 { lab=clk}
N 290 -420 290 20 { lab=clkbar}
N 290 20 890 20 { lab=clkbar}
N 890 -420 890 20 { lab=clkbar}
N 450 -60 450 20 { lab=clkbar}
N 260 -110 290 -110 { lab=clkbar}
N 700 -480 740 -480 { lab=out2}
N 700 -600 700 -580 { lab=toprightout1}
N 660 -590 660 -570 { lab=out1}
N 480 -600 480 -580 { lab=topleftout2}
N 700 -290 700 -270 { lab=toprightgs}
N 480 -290 480 -270 { lab=topleftgs}
N 550 -320 550 -300 { lab=clk}
N 950 -550 950 -280 { lab=toprightgs}
N 230 -280 480 -280 { lab=topleftgs}
N 230 -550 230 -280 { lab=topleftgs}
N 810 -420 890 -420 { lab=clkbar}
N 440 -320 520 -320 { lab=clk}
N 440 -630 520 -630 { lab=out2}
N 440 -240 520 -240 { lab=Vinp}
N 520 -630 540 -630 { lab=out2}
N 540 -630 540 -450 { lab=out2}
N 540 -450 700 -450 { lab=out2}
N 440 -550 520 -550 { lab=topleftgs}
N 520 -420 540 -420 { lab=out2}
N 540 -450 540 -420 { lab=out2}
N 440 -420 520 -420 { lab=out2}
C {sky130_fd_pr/pfet3_01v8.sym} 680 -630 0 0 {name=M3
L=0.15
W=1
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
C {sky130_fd_pr/pfet3_01v8.sym} 460 -630 2 1 {name=M4
L=0.15
W=1
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
C {sky130_fd_pr/pfet3_01v8.sym} 500 -550 2 0 {name=M5
L=0.15
W=1
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
L=0.15
W=1
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
L=0.15
W=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 460 -420 2 1 {name=M8
L=0.15
W=1
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
L=0.15
W=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 830 -420 2 1 {name=M10
L=0.15
W=1
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
C {sky130_fd_pr/pfet3_01v8.sym} 680 -320 0 0 {name=M11
L=0.15
W=1
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
C {sky130_fd_pr/pfet3_01v8.sym} 460 -320 2 1 {name=M12
L=0.15
W=1
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
L=0.15
W=1
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
C {sky130_fd_pr/nfet3_01v8.sym} 500 -240 2 0 {name=M14
L=0.15
W=1
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
L=0.15
W=1
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
L=0.15
W=1
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
C {sky130_fd_pr/cap_mim_m3_1.sym} 670 -60 0 0 {name=C2 model=cap_mim_m3_1 W=6 L=6 MF=1 spiceprefix=X}
C {devices/vdd.sym} 480 -660 0 0 {name=l4 lab=VDD}
C {devices/vdd.sym} 700 -660 0 0 {name=l5 lab=VDD}
C {devices/vdd.sym} 480 -350 0 0 {name=l6 lab=VDD}
C {devices/vdd.sym} 700 -350 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 490 -30 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 670 -30 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 400 -390 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 790 -390 0 0 {name=l19 lab=GND}
C {devices/ipin.sym} 260 -110 0 0 {name=p1 lab=clkbar}
C {devices/opin.sym} 440 -490 0 1 {name=p2 lab=out1}
C {devices/ipin.sym} 430 -240 0 0 {name=p3 lab=Vinp}
C {devices/ipin.sym} 750 -240 0 1 {name=p4 lab=Vinm}
C {devices/ipin.sym} 480 -180 0 0 {name=p5 lab=clk}
C {devices/opin.sym} 740 -480 0 0 {name=p6 lab=out2}
C {devices/lab_pin.sym} 950 -510 0 1 {name=l10 sig_type=std_logic lab=toprightgs}
C {devices/lab_pin.sym} 230 -520 0 0 {name=l11 sig_type=std_logic lab=topleftgs}
C {devices/lab_pin.sym} 590 -130 0 1 {name=l12 sig_type=std_logic lab=bottomds}
C {devices/lab_pin.sym} 690 -210 1 1 {name=l13 sig_type=std_logic lab=bottomss}
C {devices/lab_pin.sym} 700 -590 0 1 {name=l1 sig_type=std_logic lab=toprightout1}
C {devices/lab_pin.sym} 480 -590 0 0 {name=l2 sig_type=std_logic lab=topleftout2}
