v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {This is the cell corresponding to logic "0". Logic "1" is just the horizontal 
flip of this.} 830 10 0 0 0.4 0.4 {}
N 990 300 1140 300 { lab=out}
N 1050 240 1060 240 { lab=out}
N 1060 240 1060 300 { lab=out}
N 980 300 990 300 { lab=out}
N 990 220 990 240 { lab=Vdd}
N 980 380 990 380 { lab=h1}
N 1050 380 1140 380 { lab=h2}
N 960 300 980 300 { lab=out}
N 960 380 980 380 { lab=h1}
N 1020 280 1020 340 { lab=in_bar}
N 960 340 1000 340 { lab=in_bar}
N 960 280 1000 280 { lab=in_bar}
N 1000 340 1010 340 { lab=in_bar}
N 1000 280 1020 280 { lab=in_bar}
N 1010 340 1020 340 { lab=in_bar}
N 1020 380 1020 400 { lab=GND}
N 1020 190 1020 250 { lab=VDD}
N 960 220 1140 220 { lab=Vdd}
N 1100 200 1100 400 { lab=in}
C {devices/iopin.sym} 970 340 2 0 {name=p4 lab=in_bar}
C {devices/iopin.sym} 970 280 2 0 {name=p5 lab=in_bar}
C {devices/iopin.sym} 1130 300 0 0 {name=p10 lab=out}
C {devices/iopin.sym} 1130 380 2 1 {name=p9 lab=h2}
C {devices/iopin.sym} 1130 220 0 0 {name=p11 lab=Vdd}
C {devices/iopin.sym} 970 380 0 1 {name=p1 lab=h1}
C {devices/iopin.sym} 970 300 2 0 {name=p2 lab=out}
C {devices/iopin.sym} 970 220 2 0 {name=p7 lab=Vdd}
C {devices/iopin.sym} 1100 210 3 0 {name=p6 lab=in}
C {devices/iopin.sym} 1100 390 1 0 {name=p3 lab=in}
C {devices/netlist.sym} 1250 190 0 0 {name=s1 value=".ic v(h1)=0 v(h2)=0"}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1020 360 3 1 {name=M3
L=0.18
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1020 260 3 0 {name=M4
L=0.18
W=1
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
C {devices/vdd.sym} 1020 190 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 1020 400 0 0 {name=l2 lab=GND}
