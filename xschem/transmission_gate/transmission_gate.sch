v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {ctrl_ is the inverse of ctrl} -360 -100 0 0 0.4 0.4 {}
N -140 40 0 40 { lab=ctrl}
N 0 80 0 100 { lab=GND}
N -80 -80 -30 -80 { lab=in}
N -80 -80 -80 80 { lab=in}
N -80 80 -30 80 { lab=in}
N 30 -80 80 -80 { lab=out}
N 80 -80 80 80 { lab=out}
N 30 80 80 80 { lab=out}
N -140 -40 0 -40 { lab=ctrl_}
N -140 0 -80 0 { lab=in}
N 80 0 140 0 { lab=out}
N -0 -130 0 -80 { lab=VDD}
C {devices/iopin.sym} -140 0 2 0 {name=p1 lab=in}
C {devices/iopin.sym} 140 0 0 0 {name=p2 lab=out}
C {devices/ipin.sym} -140 -40 0 0 {name=p3 lab=ctrl_}
C {devices/ipin.sym} -140 40 0 0 {name=p4 lab=ctrl}
C {sky130_fd_pr/nfet_01v8.sym} 0 60 3 1 {name=M1
L=Lnmos
W=Wnmos
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
C {devices/gnd.sym} 0 100 0 0 {name=l10 lab=GND}
C {devices/vdd.sym} 0 -130 0 0 {name=l11 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 0 -60 3 0 {name=M2
L=Lpmos
W=Wpmos
>>>>>>> e82309aa2b1d17d2bdbb6dccc1c31ec6c77d2342
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
