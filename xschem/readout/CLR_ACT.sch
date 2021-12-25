v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -200 -100 -100 -100 { lab=comp_out0}
N -200 -20 -100 -20 { lab=comp_out1}
N -200 60 -100 60 { lab=comp_out2}
N -200 140 -100 140 { lab=comp_out3}
N -200 220 -100 220 { lab=comp_out4}
N -200 300 -100 300 { lab=comp_out5}
N -200 380 -100 380 { lab=comp_out6}
N -200 460 -100 460 { lab=comp_out7}
N -140 -60 -100 -60 { lab=RST_drive}
N -140 -60 -140 560 { lab=RST_drive}
N -140 20 -100 20 { lab=RST_drive}
N -140 100 -100 100 { lab=RST_drive}
N -140 180 -100 180 { lab=RST_drive}
N -140 260 -100 260 { lab=RST_drive}
N -140 340 -100 340 { lab=RST_drive}
N -140 420 -100 420 { lab=RST_drive}
N -140 500 -100 500 { lab=RST_drive}
N -420 730 -320 730 { lab=fclkb}
N 80 -100 120 -100 { lab=anyACT}
N 120 -100 120 460 { lab=anyACT}
N 80 460 120 460 { lab=anyACT}
N 80 380 120 380 { lab=anyACT}
N 80 300 120 300 { lab=anyACT}
N 80 220 120 220 { lab=anyACT}
N 80 140 120 140 { lab=anyACT}
N 80 60 120 60 { lab=anyACT}
N 80 -20 120 -20 { lab=anyACT}
N 120 160 350 160 { lab=anyACT}
N 120 200 140 200 { lab=anyACT}
N 220 200 350 200 { lab=anyACTb}
N -360 770 -320 770 { lab=anyACT}
N -140 730 300 730 { lab=CLR}
N -140 560 180 560 { lab=RST_drive}
N 300 580 300 730 { lab=CLR}
N 300 160 300 540 { lab=anyACT}
N -160 -80 -100 -80 { lab=ACT}
N -160 -80 -160 660 { lab=ACT}
N -160 0 -100 -0 { lab=ACT}
N -160 80 -100 80 { lab=ACT}
N -160 160 -100 160 { lab=ACT}
N -160 240 -100 240 { lab=ACT}
N -160 320 -100 320 { lab=ACT}
N -160 400 -100 400 { lab=ACT}
N -160 480 -100 480 { lab=ACT}
N 260 680 300 680 { lab=CLR}
N 260 640 340 640 { lab=anyACTb}
N 340 200 340 640 { lab=anyACTb}
N -160 660 140 660 { lab=ACT}
N -340 750 -320 750 { lab=VDD}
N -340 680 -340 750 { lab=VDD}
C {sky130_stdcells/dlrtp_1.sym} -10 -80 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 0 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 80 0 0 {name=x3 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 160 0 0 {name=x4 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 240 0 0 {name=x5 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 320 0 0 {name=x6 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 400 0 0 {name=x7 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlrtp_1.sym} -10 480 0 0 {name=x8 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -200 -100 0 0 {name=p1 lab=comp_out0}
C {devices/ipin.sym} -200 -20 0 0 {name=p2 lab=comp_out1}
C {devices/ipin.sym} -200 60 0 0 {name=p3 lab=comp_out2}
C {devices/ipin.sym} -200 140 0 0 {name=p4 lab=comp_out3}
C {devices/ipin.sym} -200 220 0 0 {name=p5 lab=comp_out4}
C {devices/ipin.sym} -200 300 0 0 {name=p6 lab=comp_out5}
C {devices/ipin.sym} -200 380 0 0 {name=p7 lab=comp_out6}
C {devices/ipin.sym} -200 460 0 0 {name=p8 lab=comp_out7}
C {sky130_stdcells/dfrtp_1.sym} -230 750 0 0 {name=x9 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -420 730 0 0 {name=p9 lab=fclkb}
C {devices/lab_pin.sym} 350 160 2 0 {name=l1 sig_type=std_logic lab=anyACT}
C {sky130_stdcells/inv_1.sym} 180 200 0 0 {name=x10 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 350 200 2 0 {name=l2 sig_type=std_logic lab=anyACTb}
C {devices/lab_pin.sym} -360 770 0 0 {name=l3 sig_type=std_logic lab=anyACT}
C {devices/lab_pin.sym} -120 730 3 0 {name=l4 sig_type=std_logic lab=CLR}
C {devices/lab_pin.sym} 160 560 1 0 {name=l5 sig_type=std_logic lab=RST_drive}
C {sky130_stdcells/and2_0.sym} 240 560 2 0 {name=x11 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_0.sym} 200 660 2 0 {name=x12 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 120 660 1 0 {name=l6 sig_type=std_logic lab=ACT}
C {devices/vdd.sym} -340 680 0 0 {name=l7 lab=VDD}
