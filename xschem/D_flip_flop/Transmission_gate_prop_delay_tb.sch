v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Transmission gate propagation delay tesy bench
Prop delay=8ps} 100 -230 0 0 0.3 0.3 {}
N 240 -90 270 -90 { lab=in}
N 110 -130 110 -90 { lab=clk}
N 210 -130 320 -130 { lab=clk_inv}
N 110 -90 200 -90 { lab=clk}
N 200 -90 200 -0 { lab=clk}
N 200 -0 320 0 { lab=clk}
N 320 -50 320 0 { lab=clk}
C {transmission_gate/transmission_gate.sym} 320 -90 0 0 {name=X1}
C {devices/vsource.sym} 240 -60 0 0 {name=V1 value="PWL(0 0 1u 0 1u 1.2 3u 1.2 10u 1.2)"}
C {devices/vsource.sym} 110 -60 0 1 {name=V3 value=1.2}
C {inv/inv.sym} 160 -130 0 0 {name=X2}
C {devices/gnd.sym} 110 -30 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 240 -30 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 10 -160 0 0 {name=vdd value=1.2}
C {devices/gnd.sym} 10 -130 0 0 {name=l3 lab=GND}
C {devices/vdd.sym} 10 -190 0 0 {name=l4 lab=VDD}
C {devices/lab_pin.sym} 370 -90 2 0 {name=l5 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} 270 -90 1 0 {name=l6 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 110 -90 0 0 {name=l7 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 210 -130 2 0 {name=l8 sig_type=std_logic lab=clk_inv}
C {devices/netlist.sym} 480 -130 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.tran 0.1u 12u
.save all
"}
