v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2655 -920 2655 -890 { lab=out}
N 2535 -920 2535 -890 { lab=out}
N 2535 -890 2535 -870 { lab=out}
N 2535 -990 2535 -980 { lab=VDD}
N 2655 -990 2655 -980 { lab=VDD}
N 2535 -1020 2535 -990 { lab=VDD}
N 2405 -920 2405 -890 { lab=out}
N 2405 -990 2405 -980 { lab=VDD}
N 2405 -990 2655 -990 { lab=VDD}
N 2405 -890 2655 -890 { lab=out}
N 2475 -780 2495 -780 { lab=clk_2}
N 2475 -840 2495 -840 { lab=clk}
N 2475 -720 2495 -720 { lab=clk_4}
N 2535 -870 2590 -870 { lab=out}
N 2690 -870 2705 -870 { lab=out}
N 2590 -870 2690 -870 { lab=out}
C {sky130_fd_pr/pfet3_01v8.sym} 2515 -950 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 2515 -840 0 0 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2515 -780 0 0 {name=M3
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
C {sky130_fd_pr/nfet3_01v8.sym} 2515 -720 0 0 {name=M4
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
C {sky130_fd_pr/pfet3_01v8.sym} 2635 -950 0 0 {name=M11
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
C {sky130_fd_pr/pfet3_01v8.sym} 2385 -950 0 0 {name=M14
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
C {devices/vdd.sym} 2535 -1020 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 2535 -690 0 0 {name=l10 lab=GND}
C {devices/ipin.sym} 2480 -780 0 0 {name=p3 lab=clk_2}
C {devices/ipin.sym} 2480 -840 0 0 {name=p4 lab=clk}
C {devices/ipin.sym} 2480 -720 0 0 {name=p6 lab=clk_4}
C {devices/opin.sym} 2700 -870 0 0 {name=p7 lab=out}
C {devices/lab_pin.sym} 2365 -950 0 0 {name=l2 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2495 -950 0 0 {name=l3 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2615 -950 0 0 {name=l4 sig_type=std_logic lab=clk_4}
