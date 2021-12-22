v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -5000 1020 -4920 1020 { lab=Clk}
N -4490 1210 -4490 1230 { lab=Q0}
N -4790 1000 -4790 1020 { lab=Clk}
N -5000 830 -4900 830 { lab=T}
N -4590 690 -4590 830 { lab=A0}
N -4640 830 -4640 1090 { lab=Q0}
N -4640 1090 -4510 1090 { lab=Q0}
N -4900 670 -4900 830 { lab=T}
N -4900 670 -4750 670 { lab=T}
N -4750 710 -4750 740 { lab=Q0}
N -4750 740 -4680 740 { lab=Q0}
N -4680 740 -4680 830 { lab=Q0}
N -4680 830 -4640 830 { lab=Q0}
N -4630 690 -4590 690 { lab=A0}
N -4900 930 -4900 1050 { lab=RST_bar}
N -5000 1050 -4900 1050 { lab=RST_bar}
N -4920 1020 -4790 1020 { lab=Clk}
N -4470 1090 -4400 1090 { lab=X1}
N -4400 1010 -4400 1090 { lab=X1}
N -4680 830 -4680 870 { lab=Q0}
C {devices/ipin.sym} -4990 1020 0 0 {name=p11 lab=Clk}
C {devices/ipin.sym} -4990 830 0 0 {name=p12 lab=T}
C {devices/opin.sym} -4490 1220 1 0 {name=p13 lab=Q0}
C {sky130_stdcells/xor2_1.sym} -4490 1150 1 0 {name=x14 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} -4690 690 2 1 {name=x12 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {T_flip_flop/asyn_rst_t_ff.sym} -3850 1250 0 0 {name=X1}
C {devices/ipin.sym} -4990 1050 0 0 {name=p22 lab=RST_bar}
C {devices/opin.sym} -4590 820 1 0 {name=p1 lab=A0}
C {devices/ipin.sym} -4400 1020 1 0 {name=p2 lab=X1}
C {devices/opin.sym} -4680 860 1 0 {name=p3 lab=Q}
