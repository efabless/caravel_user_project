v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2990 -510 3010 -510 { lab=rstb}
N 2990 -510 2990 -440 { lab=rstb}
N 2990 -440 3010 -440 { lab=rstb}
N 2990 -440 2990 -380 { lab=rstb}
N 2970 -460 3010 -460 { lab=event}
N 2970 -530 3010 -530 { lab=pol}
N 2980 -480 3010 -480 { lab=fclk}
N 2980 -550 2980 -480 { lab=fclk}
N 2980 -550 3010 -550 { lab=fclk}
N 2980 -480 2980 -380 { lab=fclk}
N 3190 -550 3210 -550 { lab=ro_p}
N 3190 -480 3210 -480 { lab=ro_e}
N 2960 -530 2970 -530 { lab=pol}
N 2960 -460 2970 -460 { lab=event}
N 2960 -380 2980 -380 { lab=fclk}
N 2990 -380 2990 -360 { lab=rstb}
N 2960 -360 2990 -360 { lab=rstb}
N 2840 -600 2860 -600 { lab=GND}
N 2840 -620 2860 -620 { lab=VDD}
C {sky130_stdcells/dfrtn_1.sym} 3100 -530 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3100 -460 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/ipin.sym} 2970 -530 0 0 {name=p1 lab=pol}
C {devices/ipin.sym} 2970 -460 0 0 {name=p2 lab=event}
C {devices/ipin.sym} 2970 -380 0 0 {name=p3 lab=fclk}
C {devices/ipin.sym} 2970 -360 0 0 {name=p4 lab=rstb}
C {devices/iopin.sym} 2850 -620 2 0 {name=p5 lab=VDD}
C {devices/iopin.sym} 2850 -600 2 0 {name=p6 lab=GND}
C {devices/opin.sym} 3200 -550 0 0 {name=p7 lab=ro_p}
C {devices/opin.sym} 3200 -480 0 0 {name=p8 lab=ro_e}
