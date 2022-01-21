v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 3020 -850 3020 -820 { lab=out}
N 2910 -850 2910 -820 { lab=out}
N 2790 -850 2790 -820 { lab=out}
N 2850 -820 2850 -800 { lab=out}
N 2790 -920 2790 -910 { lab=VDD}
N 2910 -920 2910 -910 { lab=VDD}
N 3020 -920 3020 -910 { lab=VDD}
N 2850 -950 2850 -920 { lab=VDD}
N 2660 -850 2660 -820 { lab=out}
N 2660 -920 3020 -920 { lab=VDD}
N 2660 -920 2660 -910 { lab=VDD}
N 2660 -820 3020 -820 { lab=out}
N 2790 -710 2810 -710 { lab=clk_2}
N 2790 -770 2810 -770 { lab=clk}
N 2790 -650 2810 -650 { lab=clk_4}
N 2790 -590 2810 -590 { lab=clk_8}
N 2850 -800 2905 -800 { lab=out}
N 3005 -800 3020 -800 { lab=out}
N 2905 -800 3005 -800 { lab=out}
C {sky130_fd_pr/pfet3_01v8.sym} 2770 -880 0 0 {name=M1
L=0.15
W=0.42
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
C {sky130_fd_pr/nfet3_01v8.sym} 2830 -770 0 0 {name=M2
L=0.15
W=0.42
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
C {sky130_fd_pr/nfet3_01v8.sym} 2830 -710 0 0 {name=M3
L=0.15
W=0.42
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
C {sky130_fd_pr/nfet3_01v8.sym} 2830 -650 0 0 {name=M4
L=0.15
W=0.42
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
C {sky130_fd_pr/nfet3_01v8.sym} 2830 -590 0 0 {name=M5
L=0.15
W=0.42
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
C {sky130_fd_pr/pfet3_01v8.sym} 2890 -880 0 0 {name=M11
L=0.15
W=0.42
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
C {sky130_fd_pr/pfet3_01v8.sym} 3000 -880 0 0 {name=M12
L=0.15
W=0.42
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
C {sky130_fd_pr/pfet3_01v8.sym} 2640 -880 0 0 {name=M14
L=0.15
W=0.42
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
C {devices/vdd.sym} 2850 -950 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 2850 -560 0 0 {name=l10 lab=GND}
C {devices/ipin.sym} 2795 -710 0 0 {name=p4 lab=clk_2}
C {devices/ipin.sym} 2795 -770 0 0 {name=p6 lab=clk}
C {devices/ipin.sym} 2795 -650 0 0 {name=p7 lab=clk_4}
C {devices/ipin.sym} 2795 -590 0 0 {name=p8 lab=clk_8}
C {devices/opin.sym} 3015 -800 0 0 {name=p9 lab=out}
C {devices/lab_pin.sym} 2750 -880 0 0 {name=l3 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2620 -880 0 0 {name=l2 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2870 -880 0 0 {name=l4 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} 2980 -880 0 0 {name=l5 sig_type=std_logic lab=clk_8}
