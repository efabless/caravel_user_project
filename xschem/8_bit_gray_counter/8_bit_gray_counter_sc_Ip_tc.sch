v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 330 -1010 330 -990 { lab=Clk}
C {devices/gnd.sym} 330 -930 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 330 -960 0 0 {name=V3 value="DC 0 PULSE(0 1.2 0 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} 210 -1160 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} 210 -1130 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 330 -990 0 0 {name=l1 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} 210 -1190 0 0 {name=l3 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 440 -1210 2 0 {name=l5 sig_type=std_logic lab=Q0}
C {devices/lab_pin.sym} 440 -1190 2 0 {name=l6 sig_type=std_logic lab=Q1}
C {devices/lab_pin.sym} 440 -1170 2 0 {name=l7 sig_type=std_logic lab=Q2}
C {devices/lab_pin.sym} 440 -1150 2 0 {name=l8 sig_type=std_logic lab=Q3}
C {devices/lab_pin.sym} 440 -1130 2 0 {name=l9 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} 440 -1110 2 0 {name=l10 sig_type=std_logic lab=Q5}
C {devices/lab_pin.sym} 440 -1090 2 0 {name=l11 sig_type=std_logic lab=Q6}
C {devices/lab_pin.sym} 440 -1070 2 0 {name=l12 sig_type=std_logic lab=Q7}
C {devices/vsource.sym} 60 -1190 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 60 -1160 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 60 -1220 0 0 {name=l15 lab=VDD}
C {8_bit_gray_counter/8_bit_gray_counter_sc_Ip.sym} -1060 -390 0 0 {name=X1}
C {devices/netlist.sym} 430 -1490 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.ic v(x1.Qb0)=0 
.tran \{(1/100)*(1/f)\} \{40/f\}
.save all
"}
