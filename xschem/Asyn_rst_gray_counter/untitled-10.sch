v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -10550 2980 -10550 3000 { lab=Clk}
N -10670 2895 -10670 2920 { lab=RST_bar}
C {devices/gnd.sym} -10550 3060 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -10550 3030 0 0 {name=V3 value="DC 0 PULSE(1.2 0 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} -10670 2830 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} -10670 2860 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -10550 3000 0 0 {name=l1 sig_type=std_logic lab=Clk}
C {devices/lab_pin.sym} -10670 2800 0 0 {name=l3 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} -10440 2780 2 0 {name=l5 sig_type=std_logic lab=Q0}
C {devices/lab_pin.sym} -10440 2800 2 0 {name=l6 sig_type=std_logic lab=Q1}
C {devices/lab_pin.sym} -10440 2820 2 0 {name=l7 sig_type=std_logic lab=Q2}
C {devices/lab_pin.sym} -10440 2840 2 0 {name=l8 sig_type=std_logic lab=Q3}
C {devices/lab_pin.sym} -10440 2860 2 0 {name=l9 sig_type=std_logic lab=Q4}
C {devices/lab_pin.sym} -10440 2880 2 0 {name=l10 sig_type=std_logic lab=Q5}
C {devices/lab_pin.sym} -10440 2900 2 0 {name=l11 sig_type=std_logic lab=Q6}
C {devices/lab_pin.sym} -10440 2920 2 0 {name=l12 sig_type=std_logic lab=Q7}
C {devices/vsource.sym} -10820 2800 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} -10820 2830 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} -10820 2770 0 0 {name=l15 lab=VDD}
C {devices/netlist.sym} -10450 2500 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(x1.Qb0)=0 
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {devices/lab_pin.sym} -10670 2920 0 0 {name=l14 sig_type=std_logic lab=RST_bar}
C {devices/vsource.sym} -10670 2950 0 1 {name=V4 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"
*DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)}
C {devices/gnd.sym} -10670 2980 0 0 {name=l16 lab=GND}
C {Asyn_rst_gray_counter/counter_8bit.sym} -16.25 225 0 0 {name=X1}
