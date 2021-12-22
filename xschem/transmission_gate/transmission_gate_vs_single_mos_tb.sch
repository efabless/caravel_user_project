v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -420 0 -330 0 { lab=in}
N -420 -120 -320 -120 { lab=ctrl_}
N -420 120 -340 120 { lab=ctrl}
N 280 40 420 40 { lab=ctrl}
N 420 80 420 100 { lab=GND}
N 420 -100 420 -80 { lab=VDD}
N 340 -80 390 -80 { lab=in}
N 340 -80 340 80 { lab=in}
N 340 80 390 80 { lab=in}
N 450 -80 500 -80 { lab=out}
N 500 -80 500 80 { lab=out}
N 450 80 500 80 { lab=out}
N 280 -40 420 -40 { lab=ctrl_}
N 280 0 340 0 { lab=in}
N 500 0 560 0 { lab=out}
N 0 -130 0 -110 { lab=VDD}
N -80 -110 -30 -110 { lab=in}
N 30 -110 80 -110 { lab=outp}
N -140 -70 0 -70 { lab=ctrl_}
N -140 -30 -80 -30 { lab=in}
N 80 -30 140 -30 { lab=outp}
N -80 -110 -80 -30 { lab=in}
N 80 -110 80 -30 { lab=outp}
N -140 70 0 70 { lab=ctrl}
N 0 110 0 130 { lab=GND}
N -80 110 -30 110 { lab=in}
N 30 110 80 110 { lab=outn}
N -140 30 -80 30 { lab=in}
N 80 30 140 30 { lab=outn}
N -80 30 -80 110 { lab=in}
N 80 30 80 110 { lab=outn}
C {devices/vsource.sym} -420 30 0 0 {name=Vin value="DC 0 SIN(0.6 0.6 1k)"}
C {devices/vsource.sym} -420 -250 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -420 -280 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -420 -220 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -420 60 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -330 0 2 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 560 0 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/vsource.sym} -420 150 0 0 {name=Vctrl value="PULSE (0 1.2 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -420 180 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -420 -90 0 0 {name=Vctrl_ 
value="PULSE (1.2 0 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -420 -60 0 0 {name=l7 lab=GND}
C {devices/netlist.sym} -240 -350 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 4m
.save all
"}
C {devices/lab_pin.sym} -320 -120 2 0 {name=l8 sig_type=std_logic lab=ctrl_}
C {devices/lab_pin.sym} -340 120 2 0 {name=l9 sig_type=std_logic lab=ctrl}
C {sky130_fd_pr/nfet_01v8.sym} 420 60 3 1 {name=M3
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
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 420 -60 1 1 {name=M4
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
C {devices/gnd.sym} 420 100 0 0 {name=l10 lab=GND}
C {devices/vdd.sym} 420 -100 0 0 {name=l11 lab=VDD}
C {devices/lab_pin.sym} 280 0 0 0 {name=l12 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 280 -40 0 0 {name=l13 sig_type=std_logic lab=ctrl_}
C {devices/lab_pin.sym} 280 40 0 0 {name=l14 sig_type=std_logic lab=ctrl}
C {devices/lab_pin.sym} 140 -30 2 0 {name=l15 sig_type=std_logic lab=outp}
C {sky130_fd_pr/pfet_01v8.sym} 0 -90 1 1 {name=M1
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
C {devices/vdd.sym} 0 -130 0 0 {name=l16 lab=VDD}
C {devices/lab_pin.sym} -140 -30 0 0 {name=l17 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -140 -70 0 0 {name=l18 sig_type=std_logic lab=ctrl_}
C {devices/lab_pin.sym} 140 30 2 0 {name=l19 sig_type=std_logic lab=outn}
C {sky130_fd_pr/nfet_01v8.sym} 0 90 3 1 {name=M2
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
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 0 130 0 0 {name=l20 lab=GND}
C {devices/lab_pin.sym} -140 30 0 0 {name=l21 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -140 70 0 0 {name=l22 sig_type=std_logic lab=ctrl}
