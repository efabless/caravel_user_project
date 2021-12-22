v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {THis flop resets when R=0bit. It is asynchronous reset.} -2880 -1210 0 0 0.4 0.4 {}
N -2730 -920 -2730 -900 { lab=Clk}
N -2730 -920 -2630 -920 { lab=Clk}
N -2630 -880 -2630 -810 { lab=RST}
N -2680 -900 -2630 -900 { lab=EN}
C {devices/gnd.sym} -2730 -840 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -2730 -870 0 1 {name=V3 value="DC 0 PULSE(0 1.2 \{5/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} -2680 -870 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} -2680 -840 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -2730 -900 0 0 {name=l1 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} -2680 -900 0 0 {name=l3 sig_type=std_logic lab=EN}
C {devices/vsource.sym} -2870 -960 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} -2870 -930 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} -2870 -990 0 0 {name=l15 lab=VDD}
C {devices/lab_pin.sym} -2630 -810 0 0 {name=l14 sig_type=std_logic lab=RST}
C {devices/vsource.sym} -2630 -780 0 1 {name=V4 value="DC 0 PWL(0 0 0.2u 0 0.21u 1.2 2.2u 1.2 2.21u 0 10u 0)"}
C {devices/gnd.sym} -2630 -750 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -2450 -920 2 0 {name=l6 sig_type=std_logic lab=out}
C {devices/netlist.sym} -2380 -1060 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{40/f\}
.save all
"}
C {sky130_stdcells/dfrtp_1.sym} -2540 -900 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
