v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -280 -10 -250 -10 { lab=A}
N -280 -40 -280 -10 { lab=A}
N -280 20 -250 20 { lab=B}
N -280 20 -280 40 { lab=B}
N 110 -20 150 -20 { lab=A}
N 110 20 150 20 { lab=B}
C {exor_gate/exor_gate.sym} -760 100 0 0 {name=X1}
C {devices/vsource.sym} -280 -70 2 0 {name=V1 value="DC 0 PULSE(1.2 0 1n 1n 1n \{1/2/f\} \{1/f\} 0)"
*PWL(0 0 1u 0 1.1u 1.2 5u 1.2 5.1u 0 10u 0)"}
C {devices/vsource.sym} -280 70 0 1 {name=V2 value="DC 0 PULSE(1.2 0 1n 1n 1n \{1/4/f\} \{1/2/f\} 0)"
*PWL(0 0 1u 0 3u 0 3.1u 1.2 7u 1.2 7.1u 0 10u 0)"
}
C {devices/gnd.sym} -280 100 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -280 -100 2 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -120 0 2 0 {name=l3 sig_type=std_logic lab=out}
C {devices/netlist.sym} -320 -360 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle1=0.5
.param duty_cycle2=0.5
.tran \{(1/100)*(1/f)\} \{4/f\}
.save all
"}
C {devices/lab_pin.sym} -280 -40 0 0 {name=l4 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} -280 40 0 0 {name=l5 sig_type=std_logic lab=B}
C {devices/vsource.sym} -390 -180 0 1 {name=V3 value=1.2}
C {devices/gnd.sym} -390 -150 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -390 -210 0 0 {name=l7 lab=VDD}
C {sky130_stdcells/xor2_1.sym} 210 0 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 110 -20 0 0 {name=l8 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 110 20 0 0 {name=l9 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} 270 0 2 0 {name=l10 sig_type=std_logic lab=out_lp}
