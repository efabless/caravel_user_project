v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 440 -480 440 -460 { lab=#net1}
N 440 -460 600 -460 { lab=#net1}
N 600 -480 600 -460 { lab=#net1}
N 520 -460 520 -440 { lab=#net1}
N 520 -380 520 -360 { lab=#net2}
N 440 -560 440 -540 { lab=VDD}
N 440 -560 600 -560 { lab=VDD}
N 600 -560 600 -540 { lab=VDD}
N 400 -510 400 -410 { lab=A}
N 400 -410 480 -410 { lab=A}
N 360 -410 400 -410 { lab=A}
N 640 -510 640 -330 { lab=B}
N 560 -330 640 -330 { lab=B}
N 640 -330 670 -330 { lab=B}
N 520 -450 590 -450 { lab=#net1}
N 520 -580 520 -560 { lab=VDD}
N 590 -450 680 -450 { lab=#net1}
N 780 -450 810 -450 { lab=out}
C {sky130_fd_pr/nfet3_01v8.sym} 500 -410 0 0 {name=M1
L=0.18
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
C {sky130_fd_pr/pfet3_01v8.sym} 420 -510 0 0 {name=M2
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
C {sky130_fd_pr/pfet3_01v8.sym} 620 -510 0 1 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} 540 -330 0 1 {name=M4
L=0.18
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
C {devices/vdd.sym} 520 -580 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 520 -300 0 0 {name=l2 lab=GND}
C {devices/ipin.sym} 370 -410 0 0 {name=p1 lab=A}
C {devices/ipin.sym} 660 -330 2 0 {name=p2 lab=B}
C {devices/opin.sym} 800 -450 0 0 {name=p3 lab=out}
C {inv/inv.sym} 730 -450 0 0 {name=X1}
