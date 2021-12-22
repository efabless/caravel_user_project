v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Testing with CLK toggling 10x faster than T} -420 50 0 0 0.3 0.3 {}
N 110 -50 160 -50 { lab=Q}
N -330 120 0 120 { lab=CLK}
N -330 -50 -110 -50 { lab=T}
C {devices/netlist.sym} -320 -360 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.tran \{(1/100)*(1/f)\} \{4/f\}
.save all
"}
C {T_flip_flop/t_ff_sc_lp.sym} 0 -10 0 0 {name=X1}
C {devices/lab_pin.sym} -330 120 0 0 {name=l1 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} -330 -50 0 0 {name=l2 sig_type=std_logic lab=T}
C {devices/lab_pin.sym} 160 -50 2 0 {name=l3 sig_type=std_logic lab=Q}
C {devices/vdd.sym} -460 -340 0 0 {name=l4 lab=VDD}
C {devices/vsource.sym} -460 -310 0 0 {name=VDD value=1.2}
C {devices/gnd.sym} -460 -280 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} -330 -20 0 0 {name=Vin value=1.2}
C {devices/gnd.sym} -330 10 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} -330 180 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} -330 150 0 0 {name=Vin1 value="DC 0 PULSE(1.2 0 1n 1n 1n \{1/2/f\} \{1/f\})"}
