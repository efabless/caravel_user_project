v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Testing propagation delay test to characterize the T-hold and T-Setup
Prop delay=2ps} 70 -280 0 0 0.4 0.4 {}
N 180 -90 200 -90 { lab=in}
C {inv/inv.sym} 250 -90 0 0 {name=X1}
C {devices/vsource.sym} 180 -60 0 1 {name=V1 value="PWL(0 0 1u 0 1u 1.2 3u 1.2 10u 1.2)"}
C {devices/gnd.sym} 180 -30 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 180 -90 0 0 {name=l2 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 300 -90 2 0 {name=l3 sig_type=std_logic lab=out}
C {devices/vsource.sym} 50 -130 0 0 {name=Vdd value=1.2}
C {devices/gnd.sym} 50 -100 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 50 -160 0 0 {name=l5 lab=VDD}
C {devices/netlist.sym} 410 -130 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.tran 10n 12u
.save all
"}
