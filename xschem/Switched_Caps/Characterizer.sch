v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2090 -1020 2140 -1020 { lab=Vout}
N 2060 -920 2120 -920 { lab=GND}
N 2120 -1020 2120 -980 { lab=Vout}
N 1980 -1020 2030 -1020 { lab=#net1}
N 2060 -1070 2060 -1020 { lab=GND}
N 1920 -1070 2060 -1070 { lab=GND}
N 1920 -1070 1920 -960 { lab=GND}
N 1920 -960 1980 -960 { lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 2060 -1000 3 0 {name=M1
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
C {devices/vsource.sym} 2060 -950 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} 2060 -920 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1980 -990 0 0 {name=V3 value=1}
C {devices/gnd.sym} 1980 -960 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 2140 -1020 2 0 {name=l1 sig_type=std_logic lab=Vout}
C {devices/code_shown.sym} 1740 -1210 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.tran 10n 250u
.save all
"}
C {devices/capa.sym} 2120 -950 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
