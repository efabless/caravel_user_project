v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 50 0 150 0 { lab=out}
N -180 0 -180 40 { lab=in}
N -180 0 -50 -0 { lab=in}
C {devices/vsource.sym} -180 70 0 0 {name=Vin value="DC 0 SIN(0.6 0.6 1k)"}
C {devices/vsource.sym} -280 0 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -280 -30 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -280 30 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -180 100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -180 40 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 150 0 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/netlist.sym} -240 -150 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 3m
.save all
"}
C {inv/inv.sym} 0 0 0 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
