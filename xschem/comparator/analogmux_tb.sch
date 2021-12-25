v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 260 170 410 170 { lab=o2}
N 340 150 340 170 { lab=o2}
N 190 90 340 90 { lab=o1}
N 340 30 440 30 { lab=out}
N 440 30 440 90 { lab=out}
N 440 90 530 90 { lab=out}
C {devices/code_shown.sym} 10 -230 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 1m
.save all
"}
C {devices/vsource.sym} 460 -40 0 0 {name=V10 value=1}
C {devices/vdd.sym} 460 -70 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 460 -10 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 240 -30 0 0 {name=V1 value=0.7}
C {devices/gnd.sym} 240 0 0 0 {name=l24 lab=GND}
C {devices/lab_pin.sym} 240 -60 0 0 {name=l25 sig_type=std_logic lab=Vref1}
C {devices/vsource.sym} 330 -30 0 0 {name=V2 value=0.65}
C {devices/gnd.sym} 330 0 0 0 {name=l26 lab=GND}
C {devices/lab_pin.sym} 330 -60 0 0 {name=l27 sig_type=std_logic lab=Vref2}
C {devices/vsource.sym} 170 -120 0 0 {name=V3 value=PULSE(0,1,0,1n,1n,40u,80u)}
C {devices/lab_pin.sym} 170 -150 0 0 {name=l32 sig_type=std_logic lab=c}
C {devices/vsource.sym} 380 -120 0 0 {name=V4 value=PULSE(1,0,0,1n,1n,40u,80u)}
C {devices/lab_pin.sym} 380 -150 0 0 {name=l33 sig_type=std_logic lab=cbar}
C {devices/gnd.sym} 170 -90 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} 380 -90 0 0 {name=l39 lab=GND}
C {devices/lab_pin.sym} 220 200 0 0 {name=l3 sig_type=std_logic lab=c}
C {devices/lab_pin.sym} 450 200 0 1 {name=l4 sig_type=std_logic lab=cbar}
C {devices/lab_pin.sym} 190 30 0 0 {name=l5 sig_type=std_logic lab=Vref1}
C {devices/lab_pin.sym} 260 230 0 0 {name=l6 sig_type=std_logic lab=Vref2}
C {devices/capa.sym} 340 120 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 440 120 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {sky130_fd_pr/nfet3_01v8.sym} 240 200 0 0 {name=M1
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
C {sky130_fd_pr/nfet3_01v8.sym} 430 200 0 1 {name=M3
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
C {devices/lab_pin.sym} 150 60 0 0 {name=l9 sig_type=std_logic lab=c}
C {devices/lab_pin.sym} 380 60 0 1 {name=l10 sig_type=std_logic lab=cbar}
C {sky130_fd_pr/nfet3_01v8.sym} 170 60 0 0 {name=M4
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
C {sky130_fd_pr/nfet3_01v8.sym} 360 60 0 1 {name=M5
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
C {devices/gnd.sym} 440 150 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 410 230 0 0 {name=l13 lab=GND}
C {devices/lab_pin.sym} 530 90 0 1 {name=l8 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} 340 90 0 1 {name=l7 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 340 150 0 1 {name=l14 sig_type=std_logic lab=o2}
