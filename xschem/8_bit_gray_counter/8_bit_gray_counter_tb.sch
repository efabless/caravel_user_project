v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Only issue is that it starts from in between states. } 3510 -1060 0 0 0.4 0.4 {}
N 3170 -880 3170 -860 { lab=Clk}
C {8_bit_gray_counter/8_bit_gray_counter.sym} 1590 -500 0 0 {name=X1}
C {devices/netlist.sym} 3430 -1330 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{100/f\}
.save all
"}
C {devices/gnd.sym} 3170 -800 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 3170 -830 0 0 {name=V3 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} 3050 -1030 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} 3050 -1000 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 3170 -860 0 0 {name=l1 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} 3050 -1060 0 0 {name=l3 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 3280 -1080 2 0 {name=l5 sig_type=std_logic lab=Q0}
C {devices/lab_pin.sym} 3280 -1060 2 0 {name=l6 sig_type=std_logic lab=Q1}
C {devices/lab_pin.sym} 3280 -1040 2 0 {name=l7 sig_type=std_logic lab=Q2}
C {devices/lab_pin.sym} 3280 -1020 2 0 {name=l8 sig_type=std_logic lab=Q3}
C {devices/lab_pin.sym} 3280 -1000 2 0 {name=l9 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} 3280 -980 2 0 {name=l10 sig_type=std_logic lab=Q5}
C {devices/lab_pin.sym} 3280 -960 2 0 {name=l11 sig_type=std_logic lab=Q6}
C {devices/lab_pin.sym} 3280 -940 2 0 {name=l12 sig_type=std_logic lab=Q7}
C {devices/vsource.sym} 2900 -1060 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 2900 -1030 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 2900 -1090 0 0 {name=l15 lab=VDD}
