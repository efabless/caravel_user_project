v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {} -3220 -1030 0 0 0.4 0.4 {}
N -3560 -860 -3560 -840 { lab=Clk}
C {devices/netlist.sym} -3300 -1300 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{40/f\}
.save all
"}
C {devices/gnd.sym} -3560 -780 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -3560 -810 0 0 {name=V3 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} -3680 -1000 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} -3680 -970 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -3560 -840 0 0 {name=l1 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} -3680 -1030 0 0 {name=l3 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} -3450 -1050 2 0 {name=l5 sig_type=std_logic lab=Q0}
C {devices/lab_pin.sym} -3450 -1030 2 0 {name=l6 sig_type=std_logic lab=Q1}
C {devices/lab_pin.sym} -3450 -1010 2 0 {name=l7 sig_type=std_logic lab=Q2}
C {devices/lab_pin.sym} -3450 -990 2 0 {name=l8 sig_type=std_logic lab=Q3}
C {devices/lab_pin.sym} -3450 -970 2 0 {name=l9 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} -3450 -950 2 0 {name=l10 sig_type=std_logic lab=Q5}
C {devices/lab_pin.sym} -3450 -930 2 0 {name=l11 sig_type=std_logic lab=Q6}
C {devices/lab_pin.sym} -3450 -910 2 0 {name=l12 sig_type=std_logic lab=Q7}
C {devices/vsource.sym} -3830 -1030 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} -3830 -1000 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} -3830 -1060 0 0 {name=l15 lab=VDD}
C {devices/lab_pin.sym} -3680 -930 0 0 {name=l14 sig_type=std_logic lab=RST}
C {devices/vsource.sym} -3680 -900 0 1 {name=V4 value="DC 0 PWL(0 1.2 2u 1.2 2.01u 0 10u 0)"}
C {devices/gnd.sym} -3680 -870 0 0 {name=l16 lab=GND}
C {8_bit_gray_counter/8_bit_gray_counter_syn_rst.sym} -880 -170 0 0 {name=X2}
