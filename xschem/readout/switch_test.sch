v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -175 -75 -85 -75 { lab=in1}
N 15 -75 105 -75 { lab=out}
N -135 -195 -35 -195 { lab=ctrl_}
N -35 -195 -35 -115 { lab=ctrl_}
N -115 5 -35 5 { lab=ctrl}
N -35 -35 -35 5 { lab=ctrl}
N -175 235 -85 235 { lab=in2}
N 15 235 105 235 { lab=out}
N -135 115 -35 115 { lab=ctrl_1}
N -35 115 -35 195 { lab=ctrl_1}
N -115 315 -35 315 { lab=ctrl1}
N -35 275 -35 315 { lab=ctrl1}
N 105 -75 105 275 { lab=out}
C {devices/vsource.sym} -175 -45 0 0 {name=Vin value="DC 0 PULSE(1.2 0 1u 1u 1u 1m 2m)"
*DC 0 *DC 0 SIN(0.6 0.6 }
C {devices/vsource.sym} -285 -75 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -285 -105 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -285 -45 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -175 -15 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -175 -75 0 0 {name=l4 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 105 275 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/vsource.sym} -115 35 0 0 {name=Vctrl value="DC 0 PULSE (0 1.2 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -115 65 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -135 -165 0 0 {name=Vctrl_ 
value="DC 0 PULSE(1.2 0 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -135 -135 0 0 {name=l7 lab=GND}
C {devices/netlist.sym} -275 -325 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 4m
.save all
"}
C {devices/lab_pin.sym} -35 -195 2 0 {name=l8 sig_type=std_logic lab=ctrl_}
C {devices/lab_pin.sym} -35 5 2 0 {name=l9 sig_type=std_logic lab=ctrl}
C {transmission_gate/transmission_gate.sym} -35 -75 0 0 {name=X2 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/vsource.sym} -175 265 0 0 {name=Vin1 value="DC 0 PULSE(0 1.2 1u 1u 1u 0.5m 1m)"
*DC 0 SIN(0.6 0.6 1k)}
C {devices/gnd.sym} -175 295 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -175 235 0 0 {name=l11 sig_type=std_logic lab=in2}
C {devices/vsource.sym} -115 345 0 0 {name=Vctrl2 value="DC 0 PULSE(1.2 0 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -115 375 0 0 {name=l13 lab=GND}
C {devices/vsource.sym} -135 145 0 0 {name=Vctrl_3 
value="DC 0 PULSE(0 1.2 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} -135 175 0 0 {name=l14 lab=GND}
C {devices/lab_pin.sym} -35 115 2 0 {name=l15 sig_type=std_logic lab=ctrl_1}
C {devices/lab_pin.sym} -35 315 2 0 {name=l16 sig_type=std_logic lab=ctrl1}
C {transmission_gate/transmission_gate.sym} -35 235 0 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
