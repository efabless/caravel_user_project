v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {The sparse decoder gives logic"1" only for the case where we need "0" out of ROM.
Ideally since we have just 11 zeros in our 64 bit quarter sequence, implementing the same
decoder for both inphase and q-phase component requires to implement 22 output decoder. 
It seems that 2 outputs overlap, hence 20 outputs.} 540 580 0 0 0.3 0.3 {}
N 540 845 660 845 { lab=A0}
N 540 865 660 865 { lab=A1}
N 540 885 660 885 { lab=A2}
N 540 905 660 905 { lab=A3}
N 540 925 660 925 { lab=A4}
N 540 945 660 945 { lab=A5}
N 540 965 570 965 { lab=#net1}
N 540 985 570 985 { lab=#net2}
N 430 1035 430 1055 { lab=Clk}
N 310 780 740 780 { lab=GND}
N 740 780 740 805 { lab=GND}
N 890 740 890 805 { lab=VDD}
N 310 740 890 740 { lab=VDD}
N 383.75 780 383.75 795 { lab=GND}
N 483.75 740 483.75 795 { lab=VDD}
C {devices/netlist.sym} 1185 770 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=80k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{40/f\}
.save all
"}
C {devices/lab_pin.sym} 980 845 2 0 {name=l21 sig_type=std_logic lab=s2}
C {devices/lab_pin.sym} 980 865 2 0 {name=l22 sig_type=std_logic lab=s3}
C {devices/lab_pin.sym} 980 885 2 0 {name=l23 sig_type=std_logic lab=s4}
C {devices/lab_pin.sym} 980 905 2 0 {name=l24 sig_type=std_logic lab=s9}
C {devices/lab_pin.sym} 980 925 2 0 {name=l25 sig_type=std_logic lab=s10}
C {devices/lab_pin.sym} 980 945 2 0 {name=l26 sig_type=std_logic lab=s13}
C {devices/lab_pin.sym} 980 965 2 0 {name=l27 sig_type=std_logic lab=s17}
C {devices/lab_pin.sym} 980 985 2 0 {name=l28 sig_type=std_logic lab=s21}
C {devices/lab_pin.sym} 980 1005 2 0 {name=l29 sig_type=std_logic lab=s23}
C {devices/lab_pin.sym} 980 1025 2 0 {name=l30 sig_type=std_logic lab=s31}
C {devices/lab_pin.sym} 980 1045 2 0 {name=l31 sig_type=std_logic lab=s32}
C {devices/lab_pin.sym} 980 1065 2 0 {name=l32 sig_type=std_logic lab=s40}
C {devices/lab_pin.sym} 980 1085 2 0 {name=l33 sig_type=std_logic lab=s42}
C {devices/lab_pin.sym} 980 1105 2 0 {name=l34 sig_type=std_logic lab=s46}
C {devices/lab_pin.sym} 980 1125 2 0 {name=l35 sig_type=std_logic lab=s50}
C {devices/lab_pin.sym} 980 1145 2 0 {name=l36 sig_type=std_logic lab=s53}
C {devices/lab_pin.sym} 980 1165 2 0 {name=l37 sig_type=std_logic lab=s54}
C {devices/lab_pin.sym} 980 1185 2 0 {name=l38 sig_type=std_logic lab=s59}
C {devices/lab_pin.sym} 980 1205 2 0 {name=l39 sig_type=std_logic lab=s60}
C {devices/lab_pin.sym} 980 1225 2 0 {name=l40 sig_type=std_logic lab=s61}
C {devices/vsource.sym} 120 895 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 120 925 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 120 865 0 0 {name=l15 lab=VDD}
C {devices/lab_pin.sym} 660 945 0 0 {name=l14 sig_type=std_logic lab=A5}
C {devices/lab_pin.sym} 660 925 0 0 {name=l16 sig_type=std_logic lab=A4}
C {devices/lab_pin.sym} 660 905 0 0 {name=l17 sig_type=std_logic lab=A3}
C {devices/lab_pin.sym} 660 885 0 0 {name=l18 sig_type=std_logic lab=A2}
C {devices/lab_pin.sym} 660 865 0 0 {name=l19 sig_type=std_logic lab=A1}
C {devices/lab_pin.sym} 660 845 0 0 {name=l20 sig_type=std_logic lab=A0}
C {devices/vsource.sym} 310 895 0 0 {name=V8 value=1.2}
C {devices/gnd.sym} 310 925 0 0 {name=l85 lab=GND}
C {devices/lab_pin.sym} 310 865 0 0 {name=l86 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 310 960 0 0 {name=l87 sig_type=std_logic lab=RST_bar}
C {devices/vsource.sym} 310 990 0 1 {name=V9 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {devices/gnd.sym} 310 1020 0 0 {name=l88 lab=GND}
C {devices/gnd.sym} 430 1115 0 0 {name=l89 lab=GND}
C {devices/vsource.sym} 430 1085 0 0 {name=V10 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 430 1055 0 0 {name=l90 sig_type=std_logic lab=Clk}
C {Asyn_rst_gray_counter/asyn_rst_gray_counter.sym} 6203.75 1240 0 0 {name=X1}
C {sparse_decoder/sparse_decoder_crude.sym} -1910 -2005 0 0 {name=X2}
C {devices/lab_pin.sym} 310 740 0 0 {name=l1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 310 780 0 0 {name=l2 sig_type=std_logic lab=GND}
