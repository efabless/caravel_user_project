v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {dummy source 
for current measurement} -180 -80 0 0 0.2 0.2 {}
N -230 30 -230 50 { lab=GND}
N -290 0 -270 0 { lab=Vgs}
N -230 0 -200 0 { lab=GND}
N -230 -60 -230 -30 { lab=#net1}
N -200 0 -200 50 { lab=GND}
N -230 50 -200 50 { lab=GND}
N -230 -320 -230 -300 { lab=#net2}
N -290 -270 -270 -270 { lab=Vgs}
N -230 -240 -230 -220 { lab=GND}
N -230 -270 -200 -270 { lab=VDD}
N -200 -380 -200 -270 { lab=VDD}
N -230 -380 -200 -380 { lab=VDD}
N 0 30 0 50 { lab=GND}
N -60 0 -40 0 { lab=Vgs}
N 0 0 30 0 { lab=GND}
N 0 -60 0 -30 { lab=#net3}
N 30 0 30 50 { lab=GND}
N 0 50 30 50 { lab=GND}
N 220 30 220 50 { lab=GND}
N 160 0 180 0 { lab=Vgs}
N 220 0 250 0 { lab=GND}
N 220 -60 220 -30 { lab=#net4}
N 250 0 250 50 { lab=GND}
N 220 50 250 50 { lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -250 0 0 0 {name=M1
L=0.15
W=0.42
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
C {devices/vdd.sym} -230 -120 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -230 50 0 0 {name=l2 lab=GND}
C {devices/netlist.sym} -240 -560 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.tran 100u 1
.save all
"}
C {devices/vsource.sym} -420 30 0 0 {name=V1 value="PWL (0 0 1 1.2)"}
C {devices/gnd.sym} -420 60 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -420 -350 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -420 -380 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} -420 -320 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} -420 0 2 0 {name=l6 sig_type=std_logic lab=Vgs}
C {devices/vsource.sym} -230 -90 0 0 {name=Vn value=0}
C {devices/vdd.sym} -230 -380 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -230 -350 0 0 {name=Vtestp value=0}
C {devices/lab_pin.sym} -290 -270 0 0 {name=l8 sig_type=std_logic lab=Vgs}
C {devices/gnd.sym} -230 -220 0 0 {name=l9 lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} -250 -270 0 0 {name=M2
L=0.15
W=3
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
C {devices/lab_pin.sym} -290 0 0 0 {name=l10 sig_type=std_logic lab=Vgs}
C {devices/vdd.sym} 0 -120 0 0 {name=l11 lab=VDD}
C {devices/gnd.sym} 0 50 0 0 {name=l12 lab=GND}
C {devices/vsource.sym} 0 -90 0 0 {name=Vlvt value=0}
C {devices/lab_pin.sym} -60 0 0 0 {name=l13 sig_type=std_logic lab=Vgs}
C {devices/vdd.sym} 220 -120 0 0 {name=l14 lab=VDD}
C {devices/gnd.sym} 220 50 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} 220 -90 0 0 {name=Vnvt value=0}
C {devices/lab_pin.sym} 160 0 0 0 {name=l16 sig_type=std_logic lab=Vgs}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -20 0 0 0 {name=M3
L=0.15
W=0.42
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
C {sky130_fd_pr/nfet_03v3_nvt.sym} 200 0 0 0 {name=M4
L=0.5
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_03v3_nvt
spiceprefix=X
}
