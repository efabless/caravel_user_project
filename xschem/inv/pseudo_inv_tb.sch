v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -110 0 -110 40 { lab=in}
N -110 0 -40 -0 { lab=in}
N 40 -0 110 0 { lab=out}
N -110 -110 -0 -110 { lab=ref}
N -0 -110 0 -40 { lab=ref}
C {devices/vsource.sym} -110 70 0 0 {name=Vin value="DC 0 SIN(0.6 0.4 1k)"}
C {devices/vsource.sym} -220 0 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -220 -30 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -220 30 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -110 100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -110 40 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 110 0 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/netlist.sym} -240 -210 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 3m
.save all
"}
C {inv/pseudo_inv.sym} 0 0 0 0 {name=X1}
C {devices/vsource.sym} -110 -80 0 0 {name=Vrefr value=0.8}
C {devices/gnd.sym} -110 -50 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -110 -110 0 0 {name=l7 sig_type=std_logic lab=ref}
