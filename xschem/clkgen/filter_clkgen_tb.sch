v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Filter clk for bank} -170 180 0 0 0.4 0.4 {}
T {To next bank} 80 150 0 0 0.4 0.4 {}
N 50 40 80 40 { lab=phi1b}
N 50 80 80 80 { lab=phi2b}
N 50 20 80 20 { lab=phi1}
N 50 60 80 60 { lab=phi2}
N -210 140 -50 140 { lab=fclk}
N -400 20 -50 20 { lab=rstb}
N 50 120 80 120 { lab=cclkb}
N 50 100 80 100 { lab=cclk}
N 50 140 80 140 { lab=fclk_div2}
N -290 120 -290 140 { lab=Vnb}
N -290 120 -50 120 { lab=Vnb}
N -360 100 -360 140 { lab=Vpb}
N -360 100 -50 100 { lab=Vpb}
C {devices/vsource.sym} -400 50 0 0 {name=Vrstb value="DC 1.2 PULSE(1.2 0 1n 1n 1n \{0.2/f\} \{4/f\})"}
C {devices/vsource.sym} -410 -110 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -410 -140 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -410 -80 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -400 80 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -400 20 0 0 {name=l4 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 80 40 2 0 {name=l5 sig_type=std_logic lab=phi1b}
C {devices/netlist.sym} -320 -140 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.param f=\{256*10k\}
.tran \{1/100/f\} \{4/f\}
.save all
"}
C {devices/vsource.sym} -360 170 0 0 {name=Vpb value=0.6}
C {devices/gnd.sym} -360 200 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -360 140 0 0 {name=l7 sig_type=std_logic lab=Vpb}
C {devices/vsource.sym} -290 170 0 0 {name=Vnb value=0.6}
C {devices/gnd.sym} -290 200 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -290 140 0 0 {name=l10 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 80 80 2 0 {name=l15 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 80 20 2 0 {name=l16 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 80 60 2 0 {name=l17 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 80 140 2 0 {name=l23 sig_type=std_logic lab=fclk_div2}
C {devices/vsource.sym} -210 170 0 0 {name=Vclk value="DC 0 PULSE(0 1.2 1n 1n 1n \{1/2/f\} \{1/f\})"}
C {devices/gnd.sym} -210 200 0 0 {name=l24 lab=GND}
C {devices/lab_pin.sym} -210 140 0 0 {name=l25 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} 80 120 2 0 {name=l11 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 80 100 2 0 {name=l22 sig_type=std_logic lab=cclk}
C {clkgen/filter_clkgen.sym} 0 80 0 0 {name=X1}
