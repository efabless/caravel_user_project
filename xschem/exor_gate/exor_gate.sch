v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {A} 150 -100 0 0 0.4 0.4 {}
T {A_inv} 110 -210 0 0 0.4 0.4 {}
T {B} 160 30 0 0 0.4 0.4 {}
T {B} 150 -250 0 0 0.4 0.4 {}
T {B_inv} 410 -250 0 0 0.4 0.4 {}
T {A_inv} 420 -60 0 0 0.4 0.4 {}
T {B_inv} 420 -10 0 0 0.4 0.4 {}
T {A} 410 -210 0 0 0.4 0.4 {}
T {A} -100 -160 0 0 0.4 0.4 {}
T {B} -100 30 0 0 0.4 0.4 {}
N 200 -150 380 -150 { lab=out}
N 200 -100 380 -100 { lab=out}
N 290 -150 290 -100 { lab=out}
N 200 -40 200 -10 { lab=#net1}
N 380 -40 380 -10 { lab=#net2}
N 290 -130 450 -130 { lab=out}
N 200 -310 200 -290 { lab=VDD}
N 200 -310 380 -310 { lab=VDD}
N 380 -310 380 -290 { lab=VDD}
N 290 -320 290 -310 { lab=VDD}
N 200 -230 200 -210 { lab=#net3}
N 380 -230 380 -210 { lab=#net4}
N 120 -70 160 -70 { lab=A}
N 120 -180 160 -180 { lab=#net5}
N 420 -180 440 -180 { lab=A}
N 420 -70 440 -70 { lab=#net5}
N 450 -130 560 -130 { lab=out}
N -100 20 -60 20 { lab=B}
N 420 -260 440 -260 { lab=#net6}
N 420 20 450 20 { lab=#net6}
N -90 -120 -40 -120 { lab=A}
N -100 -120 -90 -120 { lab=A}
N 560 -130 580 -130 { lab=out}
N 100 -180 120 -180 { lab=#net5}
N -60 20 160 20 { lab=B}
N -0 20 -0 110 { lab=B}
N 100 110 460 110 { lab=#net6}
N 460 -260 460 110 { lab=#net6}
N 440 -260 460 -260 { lab=#net6}
N 450 20 460 20 { lab=#net6}
N -0 -260 160 -260 { lab=B}
N -0 -260 -0 20 { lab=B}
N -40 -120 440 -120 { lab=A}
N 440 -180 440 -120 { lab=A}
N 120 -120 120 -70 { lab=A}
N -40 -380 -40 -220 { lab=#net5}
N -40 -380 500 -380 { lab=#net5}
N 500 -380 500 -70 { lab=#net5}
N 440 -70 500 -70 { lab=#net5}
N 100 -380 100 -180 { lab=#net5}
C {sky130_fd_pr/nfet3_01v8.sym} 180 -70 0 0 {name=M4
L=0.18
W=0.5
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
C {sky130_fd_pr/pfet3_01v8.sym} 180 -260 0 0 {name=M5
L=0.18
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
C {devices/vdd.sym} 290 -320 0 0 {name=l2 lab=VDD}
C {sky130_fd_pr/nfet3_01v8.sym} 180 20 0 0 {name=M1
L=0.18
W=0.5
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
C {sky130_fd_pr/pfet3_01v8.sym} 180 -180 0 0 {name=M2
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 400 -260 0 1 {name=M3
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 400 -180 0 1 {name=M6
L=0.18
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
C {sky130_fd_pr/nfet3_01v8.sym} 400 -70 0 1 {name=M7
L=0.18
W=0.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 400 20 0 1 {name=M8
L=0.18
W=0.5
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
C {devices/gnd.sym} 200 50 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 380 50 0 0 {name=l3 lab=GND}
C {inv/inv.sym} 50 110 0 0 {name=X3}
C {devices/ipin.sym} -90 -120 0 0 {name=p1 lab=A}
C {devices/ipin.sym} -90 20 0 0 {name=p2 lab=B}
C {devices/opin.sym} 570 -130 0 0 {name=p3 lab=out}
C {inv/inv.sym} -40 -170 3 0 {name=X2}
