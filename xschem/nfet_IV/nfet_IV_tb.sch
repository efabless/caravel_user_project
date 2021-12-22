v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {dummy source 
for current measurement} 40 -110 0 0 0.2 0.2 {}
N -0 30 0 60 { lab=GND}
N -110 -0 -40 0 { lab=Vgs}
N -0 -0 30 -0 { lab=GND}
N -0 -80 -0 -30 { lab=#net1}
N 30 -0 30 60 { lab=GND}
N -0 60 30 60 { lab=GND}
N 210 -80 210 -30 { lab=#net2}
N 140 0 170 -0 { lab=Vgs}
N 210 30 210 60 { lab=GND}
N 210 -0 240 -0 { lab=VDD}
N 240 -140 240 -0 { lab=VDD}
N 210 -140 240 -140 { lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} -20 0 0 0 {name=M1
L=0.15
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
C {devices/vdd.sym} 0 -140 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 0 60 0 0 {name=l2 lab=GND}
C {devices/netlist.sym} -250 -310 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.tran 100u 1
.save all
"}
C {devices/vsource.sym} -110 30 0 0 {name=V1 value="PWL (0 0 1 1.2)"}
C {devices/gnd.sym} -110 60 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -170 -110 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -170 -140 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} -170 -80 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} -110 0 0 0 {name=l6 sig_type=std_logic lab=Vgs}
C {devices/vsource.sym} 0 -110 0 0 {name=Vtestn value=0}
C {devices/vdd.sym} 210 -140 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} 210 -110 0 0 {name=Vtestp value=0}
C {devices/lab_pin.sym} 140 0 0 0 {name=l8 sig_type=std_logic lab=Vgs}
C {devices/gnd.sym} 210 60 0 0 {name=l9 lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 190 0 0 0 {name=M2
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
