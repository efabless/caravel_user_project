v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 130 -210 130 -70 { lab=vin}
N 190 -210 190 -70 { lab=vout}
N 70 -170 160 -170 { lab=clkbar}
N 70 -110 160 -110 { lab=clk}
N 70 -140 130 -140 { lab=vin}
N 190 -140 230 -140 { lab=vout}
C {sky130_fd_pr/nfet3_01v8.sym} 160 -90 1 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 160 -190 3 0 {name=M2
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
C {devices/ipin.sym} 70 -170 0 0 {name=p1 lab=clkbar}
C {devices/opin.sym} 230 -140 0 0 {name=p2 lab=vout}
C {devices/ipin.sym} 70 -140 0 0 {name=p3 lab=vin}
C {devices/ipin.sym} 70 -110 0 0 {name=p4 lab=clk}
