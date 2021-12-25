v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 110 -210 110 -150 { lab=clk}
N 150 -180 230 -180 { lab=#net1}
N 30 -30 260 -30 { lab=clk}
N 110 -150 110 -30 { lab=clk}
N 230 -180 260 -180 { lab=#net1}
N 260 -180 260 -90 { lab=#net1}
N 260 -180 390 -180 { lab=#net1}
N 390 -180 390 80 { lab=#net1}
N 260 80 390 80 { lab=#net1}
N 260 30 260 80 { lab=#net1}
N 320 -60 320 0 { lab=outp}
N 180 -60 200 -60 { lab=in1}
N 180 -0 200 -0 { lab=in2}
N 320 -30 350 -30 { lab=outp}
C {sky130_fd_pr/nfet3_01v8.sym} 130 -150 0 0 {name=M1
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
C {sky130_fd_pr/pfet3_01v8.sym} 130 -210 0 0 {name=M2
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
C {devices/gnd.sym} 150 -120 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 150 -240 0 0 {name=l2 lab=VDD}
C {/home/sky/fossi_cochlea/xschem/comparator/TG_ank.sym} 220 -40 0 0 {}
C {/home/sky/fossi_cochlea/xschem/comparator/TG_ank.sym} 220 20 0 0 {}
C {devices/ipin.sym} 180 -60 0 0 {name=p1 lab=in1}
C {devices/ipin.sym} 180 0 0 0 {name=p2 lab=in2}
C {devices/ipin.sym} 30 -30 0 0 {name=p3 lab=clk}
C {devices/opin.sym} 350 -30 0 0 {name=p4 lab=outp}
