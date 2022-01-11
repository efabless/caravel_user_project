v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 7430 18530 7430 18550 { lab=#net1}
N 7430 18470 7430 18487.5 { lab=#net2}
N 7390 18510 7430 18510 { lab=#net3}
N 7467.5 18450 7467.5 18465 { lab=VDD}
N 7487.5 18450 7487.5 18465 { lab=GND}
C {Sinusoid_generator/sinusoid_generator.sym} 3575 9472.5 0 0 {name=X1}
C {devices/netlist.sym} 7542.5 18243.75 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {devices/vsource.sym} 7147.5 18361.25 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 7147.5 18391.25 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 7147.5 18331.25 0 0 {name=l15 lab=VDD}
C {devices/vsource.sym} 7430 18441.25 2 0 {name=V8 value=1.2}
C {devices/gnd.sym} 7430 18411.25 2 0 {name=l85 lab=GND}
C {devices/vsource.sym} 7390 18540 0 1 {name=V9 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {devices/gnd.sym} 7390 18570 0 0 {name=l88 lab=GND}
C {devices/gnd.sym} 7430 18610 0 0 {name=l89 lab=GND}
C {devices/vsource.sym} 7430 18580 0 0 {name=V10 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 7520 18497.5 2 0 {name=l1 sig_type=std_logic lab=sin_out}
C {devices/lab_pin.sym} 7520 18527.5 2 0 {name=l2 sig_type=std_logic lab=cos_out}
C {devices/vdd.sym} 7467.5 18451.25 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 7487.5 18451.25 2 1 {name=l4 lab=GND}
