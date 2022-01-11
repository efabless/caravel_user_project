v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 330 -1010 330 -990 { lab=Clk}
N 210 -1095 210 -1070 { lab=RST_bar}
N 210 -1260 283.75 -1260 { lab=GND}
N 383.75 -1281.25 383.75 -1258.75 { lab=VDD}
N 208.75 -1281.25 383.75 -1281.25 { lab=VDD}
C {devices/gnd.sym} 330 -930 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 330 -960 0 0 {name=V3 value="DC 0 PULSE(1.2 0 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
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
C {devices/netlist.sym} 430 -1490 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(x1.Qb0)=0 
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {Asyn_rst_gray_counter/asyn_rst_gray_counter.sym} 6103.75 -815 0 0 {name=X1}
C {devices/lab_pin.sym} 210 -1070 0 0 {name=l14 sig_type=std_logic lab=RST_bar}
C {devices/vsource.sym} 210 -1040 0 1 {name=V4 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"
*DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)}
C {devices/gnd.sym} 210 -1010 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} 210 -1260 0 0 {name=l17 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 208.75 -1281.25 0 0 {name=l18 sig_type=std_logic lab=VDD}
