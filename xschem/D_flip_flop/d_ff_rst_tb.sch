v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -2210 -610 -2210 -590 { lab=Clk}
N -2340 -780 -2310 -780 { lab=D}
C {devices/vsource.sym} -2480 -650 0 0 {name=V1 value=1.2}
C {devices/vdd.sym} -2480 -680 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -2480 -620 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -2340 -750 0 1 {name=V2 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 90)"
*"DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 160)"}
C {devices/gnd.sym} -2340 -720 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} -2210 -530 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -2110 -780 2 0 {name=l5 sig_type=std_logic lab=Q}
C {devices/netlist.sym} -2050 -850 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{10/f\}
.save all
"}
C {devices/vsource.sym} -2210 -560 0 0 {name=V3 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} -2310 -780 2 0 {name=l7 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} -2210 -610 2 1 {name=l8 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} -2310 -680 0 0 {name=l6 sig_type=std_logic lab=RST}
C {devices/vsource.sym} -2310 -650 0 1 {name=V4 value="DC 0 PWL(0 1.2 2u 1.2 2.01u 0 10u 0)"}
C {devices/gnd.sym} -2310 -620 0 0 {name=l9 lab=GND}
C {D_flip_flop/d_ff_rst.sym} -1670 -410 0 0 {name=X2}
