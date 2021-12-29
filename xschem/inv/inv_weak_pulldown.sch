v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -60 -60 -40 -60 { lab=in}
N -60 -60 -60 120 { lab=in}
N -60 120 -40 120 { lab=in}
N -120 0 -60 -0 { lab=in}
N -0 -0 80 0 { lab=out}
N -0 -60 20 -60 { lab=VDD}
N 20 -90 20 -60 { lab=VDD}
N 0 -90 20 -90 { lab=VDD}
N 0 120 20 120 { lab=GND}
N 20 120 20 150 { lab=GND}
N 0 150 20 150 { lab=GND}
N -0 -30 -0 30 { lab=out}
N 0 60 20 60 { lab=GND}
N 20 60 20 120 { lab=GND}
N -120 60 -40 60 { lab=Vnb}
C {sky130_fd_pr/nfet_01v8.sym} -20 120 0 0 {name=M1
L=Lmin
W=Wmin
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
C {sky130_fd_pr/pfet_01v8.sym} -20 -60 0 0 {name=M2
L=Lmin
W=Wpmos
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
C {devices/vdd.sym} 0 -90 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 0 150 0 0 {name=l2 lab=GND}
C {devices/ipin.sym} -120 0 0 0 {name=p1 lab=in}
C {devices/iopin.sym} 80 0 0 0 {name=p2 lab=out}
C {sky130_fd_pr/nfet_01v8.sym} -20 60 0 0 {name=M3
L=Lnmos
W=Wmin
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
C {devices/ipin.sym} -120 60 0 0 {name=p3 lab=Vnb}
