v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 900 -450 900 -300 { lab=Vref1}
N 960 -450 960 -300 { lab=j}
N 900 -220 900 -70 { lab=Vref2}
N 960 -220 960 -70 { lab=j}
N 670 -260 930 -260 { lab=c}
N 930 -30 1210 -30 { lab=#net1}
N 1210 -490 1210 -30 { lab=#net1}
N 930 -490 1210 -490 { lab=#net1}
N 960 -300 960 -220 { lab=j}
N 960 -260 1030 -260 { lab=j}
N 760 -490 930 -490 { lab=#net1}
N 720 -520 720 -460 { lab=c}
N 670 -490 720 -490 { lab=c}
N 670 -490 670 -260 { lab=c}
N 620 -260 670 -260 { lab=c}
N 870 -370 900 -370 { lab=Vref1}
N 870 -130 900 -130 { lab=Vref2}
C {devices/vsource.sym} 290 -270 0 0 {name=V1 value=0.6}
C {devices/gnd.sym} 290 -240 0 0 {name=l24 lab=GND}
C {devices/lab_pin.sym} 290 -300 0 0 {name=l25 sig_type=std_logic lab=Vref1}
C {devices/vsource.sym} 380 -270 0 0 {name=V2 value=0.65}
C {devices/gnd.sym} 380 -240 0 0 {name=l26 lab=GND}
C {devices/lab_pin.sym} 380 -300 0 0 {name=l27 sig_type=std_logic lab=Vref2}
C {devices/vsource.sym} 200 -370 0 0 {name=V3 value=PULSE(0,1,0,1n,1n,20u,40u)}
C {devices/lab_pin.sym} 200 -400 0 0 {name=l32 sig_type=std_logic lab=c}
C {devices/gnd.sym} 200 -340 0 0 {name=l12 lab=GND}
C {devices/code_shown.sym} 0 -700 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 1m
.save all
"}
C {devices/vsource.sym} 120 -330 0 0 {name=V4 value=1}
C {devices/gnd.sym} 120 -300 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 120 -360 0 0 {name=l2 lab=VDD}
C {sky130_fd_pr/nfet3_01v8.sym} 930 -280 3 0 {name=M1
L=0.15
W=0.4
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
C {sky130_fd_pr/pfet3_01v8.sym} 930 -470 1 0 {name=M2
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
C {sky130_fd_pr/nfet3_01v8.sym} 930 -50 3 0 {name=M3
L=0.15
W=0.4
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
C {sky130_fd_pr/pfet3_01v8.sym} 930 -240 1 0 {name=M4
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
C {sky130_fd_pr/pfet3_01v8.sym} 740 -520 0 0 {name=M5
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
C {sky130_fd_pr/nfet3_01v8.sym} 740 -460 0 0 {name=M6
L=0.15
W=0.4
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
C {devices/vdd.sym} 760 -550 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 760 -430 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 620 -260 0 0 {name=l5 sig_type=std_logic lab=c}
C {devices/lab_pin.sym} 870 -370 0 0 {name=l6 sig_type=std_logic lab=Vref1}
C {devices/lab_pin.sym} 870 -130 0 0 {name=l7 sig_type=std_logic lab=Vref2}
C {devices/lab_pin.sym} 1030 -260 0 1 {name=l8 sig_type=std_logic lab=j}
C {/home/sky/fossi_cochlea/xschem/comparator/mux_working.sym} 480 -500 0 0 {name=X1}
C {devices/lab_pin.sym} 490 -550 0 0 {name=l9 sig_type=std_logic lab=Vref1}
C {devices/lab_pin.sym} 490 -510 0 0 {name=l10 sig_type=std_logic lab=Vref2}
C {devices/lab_pin.sym} 510 -500 0 0 {name=l11 sig_type=std_logic lab=c}
C {devices/lab_pin.sym} 530 -530 0 1 {name=l13 sig_type=std_logic lab=i}
