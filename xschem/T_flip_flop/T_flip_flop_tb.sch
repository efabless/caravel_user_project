v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {T-flip Flop retains the same output state for T=0, 
It toggles the output state on every positive Clk edge for T=1 } 60 -460 0 0 0.3 0.3 {}
N 450 -120 450 -100 { lab=Clk}
N 310 -290 340 -290 { lab=T}
C {T_flip_flop/T_flip_flop.sym} 360 10 0 0 {name=X1}
C {devices/vsource.sym} 190 -160 0 0 {name=V1 value=1.2}
C {devices/vdd.sym} 190 -190 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 190 -130 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 310 -230 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 450 -40 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 560 -290 2 0 {name=l5 sig_type=std_logic lab=Q}
C {devices/netlist.sym} 620 -360 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{10/f\}
.save all
"}
C {devices/vsource.sym} 450 -70 0 0 {name=V3 value="DC 0 PULSE(1.2 0 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 340 -290 2 0 {name=l7 sig_type=std_logic lab=T}
C {devices/lab_pin.sym} 450 -120 2 1 {name=l8 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} 560 -190 2 0 {name=l6 sig_type=std_logic lab=Q_inv}
C {devices/vsource.sym} 310 -260 0 0 {name=V2 value=1.2}
