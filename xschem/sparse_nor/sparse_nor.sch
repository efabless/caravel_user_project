v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1790 2820 1790 2830 { lab=out}
N 1790 2820 2380 2820 { lab=out}
N 2380 2820 2380 2830 { lab=out}
N 1840 2820 1840 2830 { lab=out}
N 1900 2820 1900 2830 { lab=out}
N 1950 2820 1950 2830 { lab=out}
N 2010 2820 2010 2830 { lab=out}
N 2090 2820 2090 2830 { lab=out}
N 2160 2820 2160 2830 { lab=out}
N 2210 2820 2210 2830 { lab=out}
N 2270 2820 2270 2830 { lab=out}
N 2320 2820 2320 2830 { lab=out}
N 2090 2800 2090 2820 { lab=out}
N 2030 2770 2050 2770 { lab=GND}
N 2090 2730 2090 2740 { lab=VDD}
N 1750 2860 1750 2920 { lab=A0}
N 1800 2860 1800 2920 { lab=A1}
N 1790 2890 1790 2900 { lab=GND}
N 1770 2900 2380 2900 { lab=GND}
N 2380 2890 2380 2900 { lab=GND}
N 2320 2890 2320 2900 { lab=GND}
N 2270 2890 2270 2900 { lab=GND}
N 2210 2890 2210 2900 { lab=GND}
N 2160 2890 2160 2900 { lab=GND}
N 2090 2890 2090 2900 { lab=GND}
N 2010 2890 2010 2900 { lab=GND}
N 1950 2890 1950 2900 { lab=GND}
N 1900 2890 1900 2900 { lab=GND}
N 1840 2890 1840 2900 { lab=GND}
N 1720 2900 1770 2900 { lab=GND}
N 1860 2860 1860 2920 { lab=A2}
N 1910 2860 1910 2920 { lab=A3}
N 1970 2860 1970 2920 { lab=A4}
N 2050 2860 2050 2920 { lab=A5}
N 2120 2860 2120 2920 { lab=A6}
N 2170 2860 2170 2920 { lab=A7}
N 2230 2860 2230 2920 { lab=A8}
N 2280 2860 2280 2920 { lab=A9}
N 2340 2860 2340 2920 { lab=A10}
N 2090 2810 2190 2810 { lab=out}
C {sky130_fd_pr/pfet3_01v8.sym} 2070 2770 0 0 {name=M2
L=0.15
W=0.5
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
C {sky130_fd_pr/nfet3_01v8.sym} 2070 2860 0 0 {name=M3
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 1990 2860 0 0 {name=M4
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 1930 2860 0 0 {name=M5
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 1880 2860 0 0 {name=M6
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 1820 2860 0 0 {name=M7
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 1770 2860 0 0 {name=M8
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2360 2860 0 0 {name=M9
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2300 2860 0 0 {name=M10
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2250 2860 0 0 {name=M11
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2190 2860 0 0 {name=M12
L=0.15
W=2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2140 2860 0 0 {name=M13
L=0.15
W=2
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
C {devices/vdd.sym} 2090 2730 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 1720 2900 0 1 {name=l2 lab=GND}
C {devices/gnd.sym} 2030 2770 0 0 {name=l3 lab=GND}
C {devices/opin.sym} 2180 2810 0 0 {name=p1 lab=out}
C {devices/ipin.sym} 1750 2910 3 0 {name=p2 lab=A0}
C {devices/ipin.sym} 1800 2910 3 0 {name=p3 lab=A1}
C {devices/ipin.sym} 1860 2910 3 0 {name=p4 lab=A2}
C {devices/ipin.sym} 1910 2910 3 0 {name=p5 lab=A3}
C {devices/ipin.sym} 1970 2910 3 0 {name=p6 lab=A4}
C {devices/ipin.sym} 2050 2910 3 0 {name=p7 lab=A5}
C {devices/ipin.sym} 2120 2910 3 0 {name=p8 lab=A6}
C {devices/ipin.sym} 2170 2910 3 0 {name=p9 lab=A7}
C {devices/ipin.sym} 2230 2910 3 0 {name=p10 lab=A8}
C {devices/ipin.sym} 2280 2910 3 0 {name=p11 lab=A9}
C {devices/ipin.sym} 2340 2910 3 0 {name=p12 lab=A10}
