v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -40 -0 -0 0 { lab=Vin}
N 100 -0 140 -0 { lab=Vout}
N -40 60 100 60 { lab=GND}
C {inv/inv.sym} 50 0 0 0 {name=X1}
C {devices/gnd.sym} -260 60 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -260 30 0 0 {name=V1 value= "PULSE 0 1.2 0 1u 1u 1m 2m 0"}
C {devices/lab_pin.sym} -40 0 0 0 {name=l2 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 140 0 2 0 {name=l3 sig_type=std_logic lab=Vout}
C {devices/code.sym} 230 -40 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.tran 50u 50m
.save all
"
}
C {devices/res.sym} 100 30 0 0 {name=R1
value=1T
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} -50 -120 0 0 {name=V2 value= 1.2}
C {devices/gnd.sym} -50 -90 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} -50 -150 0 0 {name=l5 lab=VDD}
C {devices/vsource_arith.sym} -260 -70 0 0 {name=E1 VOL="'cos(1000 * 2 * 3.14159 * time)'"}
C {devices/gnd.sym} -260 -40 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -260 -100 0 0 {name=l7 sig_type=std_logic lab=Vin}
C {devices/gnd.sym} -40 60 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} -260 0 0 0 {name=l9 sig_type=std_logic lab=Vin_p}
