v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 150 -180 150 -60 { lab=Vref1}
N 210 -180 210 -60 { lab=out}
N 320 -180 320 -60 { lab=out}
N 380 -180 380 -60 { lab=Vref2}
N 210 -120 320 -120 { lab=out}
N 260 -130 260 -120 { lab=out}
N 130 -120 150 -120 { lab=Vref1}
N 380 -120 400 -120 { lab=Vref2}
N 180 -250 180 -220 { lab=Cbar}
N 180 -250 450 -250 { lab=Cbar}
N 450 -250 470 -250 { lab=Cbar}
N 470 -250 470 -20 { lab=Cbar}
N 350 -20 470 -20 { lab=Cbar}
N 350 -280 350 -220 { lab=C}
N 60 -280 350 -280 { lab=C}
N 60 -280 60 -20 { lab=C}
N 60 -20 180 -20 { lab=C}
N 30 -250 60 -250 { lab=C}
N 470 -220 510 -220 { lab=Cbar}
C {sky130_fd_pr/nfet3_01v8.sym} 180 -40 3 0 {name=M1
L=1
W=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 180 -200 1 0 {name=M2
L=1
W=8
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
C {sky130_fd_pr/nfet3_01v8.sym} 350 -40 3 0 {name=M3
L=1
W=4
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
C {sky130_fd_pr/pfet3_01v8.sym} 350 -200 1 0 {name=M4
L=1
W=8
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
C {devices/ipin.sym} 130 -120 0 0 {name=p1 lab=Vref1}
C {devices/opin.sym} 260 -130 3 0 {name=p2 lab=out}
C {devices/ipin.sym} 400 -120 0 1 {name=p3 lab=Vref2}
C {devices/ipin.sym} 30 -250 0 0 {name=p4 lab=C}
C {devices/ipin.sym} 510 -220 0 1 {name=p5 lab=Cbar}
