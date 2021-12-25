v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 300 -440 300 -290 { lab=Vref1}
N 360 -440 360 -290 { lab=outp}
N 300 -210 300 -60 { lab=Vref2}
N 360 -210 360 -60 { lab=outp}
N 70 -250 330 -250 { lab=clk}
N 330 -20 610 -20 { lab=#net1}
N 610 -480 610 -20 { lab=#net1}
N 330 -480 610 -480 { lab=#net1}
N 360 -290 360 -210 { lab=outp}
N 360 -250 430 -250 { lab=outp}
N 160 -480 330 -480 { lab=#net1}
N 120 -510 120 -450 { lab=clk}
N 70 -480 120 -480 { lab=clk}
N 70 -480 70 -250 { lab=clk}
N 20 -250 70 -250 { lab=clk}
N 270 -360 300 -360 { lab=Vref1}
N 270 -120 300 -120 { lab=Vref2}
C {sky130_fd_pr/nfet3_01v8.sym} 330 -270 3 0 {name=M1
L=0.15
W=0.4
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
C {sky130_fd_pr/pfet3_01v8.sym} 330 -460 1 0 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 330 -40 3 0 {name=M3
L=0.15
W=0.4
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
C {sky130_fd_pr/pfet3_01v8.sym} 330 -230 1 0 {name=M4
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
C {sky130_fd_pr/pfet3_01v8.sym} 140 -510 0 0 {name=M5
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
C {sky130_fd_pr/nfet3_01v8.sym} 140 -450 0 0 {name=M6
L=0.15
W=0.4
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
C {devices/vdd.sym} 160 -540 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 160 -420 0 0 {name=l4 lab=GND}
C {devices/ipin.sym} 270 -120 0 0 {name=p1 lab=Vref2}
C {devices/opin.sym} 430 -250 0 0 {name=p2 lab=outp}
C {devices/ipin.sym} 20 -250 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 270 -360 0 0 {name=p4 lab=Vref1}
