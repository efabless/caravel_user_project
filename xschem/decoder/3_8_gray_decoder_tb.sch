v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 10060 7240 10060 7260 { lab=A0}
N 10010 7280 10060 7280 { lab=A1}
N 10060 7300 10060 7330 { lab=A2}
C {decoder/3_8_gray_decoder.sym} 3880 2580 0 0 {name=X1}
C {devices/vsource.sym} 10060 7210 2 0 {name=V1 value="DC 0.6 PWL(0 0 5 0 5.1 1.2 7 1.2 7.1 0 10 0)"}
C {devices/gnd.sym} 10060 7180 2 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 10060 7240 2 0 {name=l3 sig_type=std_logic lab=A0}
C {devices/vsource.sym} 9670 7250 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 9670 7280 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 9670 7220 0 0 {name=l15 lab=VDD}
C {devices/vsource.sym} 10010 7310 0 1 {name=V3 value="DC 0.6 PWL(0 0 5 0 5.1 1.2 7 1.2 7.1 0 10 0)"}
C {devices/gnd.sym} 10010 7340 0 1 {name=l1 lab=GND}
C {devices/lab_pin.sym} 10010 7280 0 0 {name=l4 sig_type=std_logic lab=A1}
C {devices/vsource.sym} 10060 7360 0 1 {name=V4 value="DC 0.6 PWL(0 0 5 0 5.1 1.2 7 1.2 7.1 0 10 0)"}
C {devices/gnd.sym} 10060 7390 0 1 {name=l5 lab=GND}
C {devices/lab_pin.sym} 10060 7330 0 0 {name=l6 sig_type=std_logic lab=A2}
C {devices/lab_pin.sym} 10270 7260 2 0 {name=l21 sig_type=std_logic lab=s0}
C {devices/lab_pin.sym} 10270 7280 2 0 {name=l22 sig_type=std_logic lab=s1}
C {devices/lab_pin.sym} 10270 7300 2 0 {name=l23 sig_type=std_logic lab=s2}
C {devices/lab_pin.sym} 10270 7320 2 0 {name=l24 sig_type=std_logic lab=s3}
C {devices/lab_pin.sym} 10270 7340 2 0 {name=l25 sig_type=std_logic lab=s4}
C {devices/lab_pin.sym} 10270 7360 2 0 {name=l26 sig_type=std_logic lab=s5}
C {devices/lab_pin.sym} 10270 7380 2 0 {name=l27 sig_type=std_logic lab=s6}
C {devices/lab_pin.sym} 10270 7400 2 0 {name=l28 sig_type=std_logic lab=s7}
C {devices/netlist.sym} 10300 7090 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
*.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
*.param a0=0
*.param a1=0
*.param a2=0
.ic v(s0)=0 v(s1)=0 v(s2)=0 v(s3)=0 v(s4)=0 v(s5)=0 v(s6)=0 
.tran 0.1 10
.save all
"}
