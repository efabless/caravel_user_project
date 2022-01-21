v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2695 -820 2695 -790 { lab=out}
N 2630 -790 2630 -770 { lab=out}
N 2695 -890 2695 -880 { lab=VDD}
N 2630 -920 2630 -890 { lab=VDD}
N 2565 -820 2565 -790 { lab=out}
N 2565 -890 2565 -880 { lab=VDD}
N 2565 -790 2695 -790 { lab=out}
N 2565 -890 2695 -890 { lab=VDD}
N 2570 -740 2590 -740 { lab=clk}
N 2570 -680 2590 -680 { lab=clk_2}
N 2630 -770 2685 -770 { lab=out}
N 2785 -770 2800 -770 { lab=out}
N 2685 -770 2785 -770 { lab=out}
C {sky130_fd_pr/pfet3_01v8.sym} 2675 -850 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 2610 -740 0 0 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 2610 -680 0 0 {name=M3
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
C {sky130_fd_pr/pfet3_01v8.sym} 2545 -850 0 0 {name=M14
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
C {devices/vdd.sym} 2630 -920 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 2630 -650 0 0 {name=l10 lab=GND}
C {devices/ipin.sym} 2575 -740 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 2575 -680 0 0 {name=p4 lab=clk_2}
C {devices/opin.sym} 2795 -770 0 0 {name=p5 lab=out}
C {devices/lab_pin.sym} 2525 -850 0 0 {name=l2 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2655 -850 0 0 {name=l3 sig_type=std_logic lab=clk_2}
