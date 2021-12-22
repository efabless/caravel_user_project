v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2580 -800 2630 -800 { lab=#net1}
N 2380 -780 2460 -780 { lab=T}
N 2460 -890 2460 -820 { lab=Q}
N 2460 -890 2840 -890 { lab=Q}
N 2840 -890 2840 -820 { lab=Q}
N 2810 -820 2880 -820 { lab=Q}
N 2610 -820 2630 -820 { lab=CLK}
N 2610 -820 2610 -730 { lab=CLK}
N 2380 -730 2610 -730 { lab=CLK}
N 2630 -780 2630 -720 { lab=RST}
N 2630 -720 2630 -700 { lab=RST}
N 2380 -700 2630 -700 { lab=RST}
N 2370 -700 2380 -700 { lab=RST}
C {sky130_stdcells/dfrtp_1.sym} 2720 -800 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/xor2_1.sym} 2520 -800 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/ipin.sym} 2380 -780 0 0 {name=p1 lab=T}
C {devices/ipin.sym} 2380 -730 0 0 {name=p2 lab=CLK}
C {devices/opin.sym} 2880 -820 0 0 {name=p3 lab=Q}
C {devices/ipin.sym} 2380 -700 0 0 {name=p4 lab=RST}
