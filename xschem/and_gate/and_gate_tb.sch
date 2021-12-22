v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 10 -440 40 -440 { lab=A}
N 10 -470 10 -440 { lab=A}
N 10 -410 40 -410 { lab=B}
N 10 -410 10 -390 { lab=B}
C {and_gate/and_gate.sym} -460 60 0 0 {name=X1}
C {devices/vsource.sym} 10 -500 2 0 {name=V1 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle1/f\} \{1/f\} 0)"}
C {devices/vsource.sym} 10 -360 0 1 {name=V2 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle2/f\} \{1/f\} 0)"
}
C {devices/gnd.sym} 10 -330 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 10 -530 2 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 180 -430 2 0 {name=l3 sig_type=std_logic lab=out}
C {devices/netlist.sym} 110 -640 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle1=0.5
.param duty_cycle2=0.5
.tran \{(1/100)*(1/f)\} \{100/f\}
.save all
"}
C {devices/lab_pin.sym} 10 -470 0 0 {name=l4 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 10 -390 0 0 {name=l5 sig_type=std_logic lab=B}
C {devices/vsource.sym} -100 -610 0 1 {name=V3 value=1.2}
C {devices/gnd.sym} -100 -580 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -100 -640 0 0 {name=l7 lab=VDD}
