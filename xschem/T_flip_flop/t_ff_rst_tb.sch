v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {T-flip Flop retains the same output state for T=0, 
It toggles the output state on every positive Clk edge for T=1 } -3340 -800 0 0 0.3 0.3 {}
N -2950 -460 -2950 -440 { lab=Clk}
N -3090 -630 -3060 -630 { lab=T}
C {devices/vsource.sym} -3220 -590 0 0 {name=V1 value=1.2}
C {devices/vdd.sym} -3220 -620 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -3220 -560 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -3090 -570 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -2950 -380 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -2840 -630 2 0 {name=l5 sig_type=std_logic lab=Q}
C {devices/netlist.sym} -2780 -700 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{10/f\}
.save all
"}
C {devices/vsource.sym} -2950 -410 0 0 {name=V3 value="DC 0 PULSE(1.2 0 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} -3060 -630 2 0 {name=l7 sig_type=std_logic lab=T}
C {devices/lab_pin.sym} -2950 -460 2 1 {name=l8 sig_type=std_logic lab=Clk}
C {devices/vsource.sym} -3090 -600 0 0 {name=V2 value=1.2}
C {T_flip_flop/t_ff_rst.sym} -290 150 0 0 {name=X1}
C {devices/lab_pin.sym} -3060 -530 0 0 {name=l9 sig_type=std_logic lab=RST}
C {devices/vsource.sym} -3060 -500 0 1 {name=V4 value="DC 0 PWL(0 1.2 2u 1.2 2.01u 0 10u 0)"}
C {devices/gnd.sym} -3060 -470 0 0 {name=l10 lab=GND}
