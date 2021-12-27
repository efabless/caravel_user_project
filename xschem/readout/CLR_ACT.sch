v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {CLR} -170 -250 0 0 0.4 0.4 {}
T {ACT} 150 -210 0 0 0.4 0.4 {}
T {D flip flop, inverted RST
} -210 -230 0 0 0.2 0.2 {}
T {D latch, inverted RST
} 120 -190 0 0 0.2 0.2 {}
N -330 40 -250 40 { lab=POL_I}
N -330 120 -250 120 { lab=POL_Q}
N -330 200 -250 200 { lab=EVENT}
N -270 80 -250 80 { lab=anyACTb}
N -270 160 -250 160 { lab=anyACTb}
N -270 240 -250 240 { lab=anyACTb}
N -170 40 270 40 { lab=gPOL_I}
N -170 120 270 120 { lab=gPOL_Q}
N -170 200 270 200 { lab=gEVENT}
N -330 -200 -240 -200 { lab=phi2}
N -270 -180 -240 -180 { lab=VDD}
N -270 -250 -270 -180 { lab=VDD}
N 90 -260 90 -200 { lab=RST_drv}
N -270 -160 -240 -160 { lab=anyACTb}
N -60 -200 -60 -140 { lab=#net1}
N -270 -100 -60 -100 { lab=anyACTb}
N -270 -40 -40 -40 { lab=anyACTb}
N 40 -40 270 -40 { lab=anyACT}
N 60 -120 90 -120 { lab=#net2}
N 90 -200 90 -160 { lab=RST_drv}
N -270 -160 -270 240 { lab=anyACTb}
N 270 -260 270 -40 { lab=anyACT}
N -60 -200 -30 -200 { lab=#net1}
N 50 -200 90 -200 { lab=RST_drv}
C {devices/ipin.sym} -330 40 0 0 {name=p1 lab=POL_I}
C {devices/ipin.sym} -330 120 0 0 {name=p2 lab=POL_Q}
C {devices/ipin.sym} -330 200 0 0 {name=p3 lab=EVENT}
C {sky130_stdcells/ebufn_1.sym} -210 40 0 0 {name=x1 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/opin.sym} 270 40 0 0 {name=p10 lab=gPOL_I}
C {devices/opin.sym} 270 120 0 0 {name=p11 lab=gPOL_Q}
C {devices/opin.sym} 270 200 0 0 {name=p12 lab=gEVENT}
C {sky130_stdcells/dfrtp_1.sym} -150 -180 0 0 {name=x4 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/ipin.sym} -330 -200 0 0 {name=p13 lab=phi2}
C {devices/vdd.sym} -270 -250 0 0 {name=l11 lab=VDD}
C {devices/iopin.sym} 90 -260 3 0 {name=p14 lab=RST_drv}
C {sky130_stdcells/dlrtp_1.sym} 180 -140 2 1 {name=x5 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/iopin.sym} 270 -260 3 0 {name=p15 lab=anyACT}
C {sky130_stdcells/inv_1.sym} 0 -40 2 0 {name=x7 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} -270 -100 0 0 {name=l9 sig_type=std_logic lab=anyACTb}
C {sky130_stdcells/and2_0.sym} 0 -120 0 0 {name=x8 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 90 -140 0 0 {name=l8 sig_type=std_logic lab=phi2}
C {sky130_stdcells/inv_1.sym} 10 -200 0 0 {name=x6 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} -210 120 0 0 {name=x2 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} -210 200 0 0 {name=x3 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
