v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -140 -0 -50 0 { lab=in}
N 50 -0 140 -0 { lab=out}
N -100 -120 0 -120 { lab=ctrl_}
N 0 -120 -0 -40 { lab=ctrl_}
N -80 80 0 80 { lab=ctrl}
N 0 40 -0 80 { lab=ctrl}
C {devices/vsource.sym} -140 30 0 0 {name=Vin value="DC 0 PULSE(0 1.2 1u 1u 1u 0.5m 1m)"
*DC 0 SIN(0.6 0.6 1k)}
C {devices/vsource.sym} -250 0 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -250 -30 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -250 30 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -140 60 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -140 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 140 0 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/vsource.sym} -80 110 0 0 {name=Vctrl value="PULSE (0 1.2 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -80 140 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -100 -90 0 0 {name=Vctrl_ 
value="PULSE (1.2 0 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -100 -60 0 0 {name=l7 lab=GND}
C {devices/netlist.sym} -240 -250 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 4m
.save all
"}
C {devices/lab_pin.sym} 0 -120 2 0 {name=l8 sig_type=std_logic lab=ctrl_}
C {devices/lab_pin.sym} 0 80 2 0 {name=l9 sig_type=std_logic lab=ctrl}
C {transmission_gate/transmission_gate.sym} 0 0 0 0 {name=X2 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
