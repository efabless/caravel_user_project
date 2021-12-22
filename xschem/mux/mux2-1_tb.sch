v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -0 50 0 100 { lab=ctrl}
N 30 -0 80 -0 { lab=out}
N -140 -20 -30 -20 { lab=in}
N -140 80 -60 80 { lab=in_}
N -60 20 -60 80 { lab=in_}
N -60 20 -30 20 { lab=in_}
C {devices/vsource.sym} -140 10 0 0 {name=Vin value="DC 0 SIN(0.6 0.6 1k)"}
C {devices/vsource.sym} -270 0 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -270 -30 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -270 30 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -140 40 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -140 -20 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 80 0 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/vsource.sym} 0 130 0 0 {name=Vctrl value="PWL (0 1.2 1m 1.2 1.001m 0 2m 0 2.001m 1.2 3m 1.2)"}
C {devices/gnd.sym} 0 160 0 0 {name=l6 lab=GND}
C {devices/netlist.sym} -250 -160 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 3m
.save all
"}
C {devices/lab_pin.sym} 0 80 2 0 {name=l9 sig_type=std_logic lab=ctrl}
C {mux/mux2-1.sym} 0 0 0 0 {name=X1}
C {devices/vsource.sym} -140 110 0 0 {name=Vin_ value="DC 0 SIN(0.6 -0.6 1k)"}
C {devices/gnd.sym} -140 140 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -140 80 0 0 {name=l8 sig_type=std_logic lab=in_}
