v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {dfxtp is a flip flop} 180 -140 0 0 0.2 0.2 {}
N 860 -160 860 -140 { lab=pol}
N 860 -180 860 -160 { lab=pol}
N 500 -180 500 -140 { lab=pol}
N 500 -180 540 -180 { lab=pol}
N 860 -230 860 -180 { lab=pol}
N 860 -230 970 -230 { lab=pol}
N 980 -150 980 -120 { lab=event}
N 980 -190 980 -150 { lab=event}
N 970 -230 980 -230 { lab=pol}
N 540 -180 860 -180 { lab=pol}
C {comparator/doubletaillatch.sym} 40 -130 0 0 {name=X4}
C {devices/lab_pin.sym} 90 -230 1 0 {name=l33 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 90 -130 3 0 {name=l34 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 980 -120 0 1 {name=l49 sig_type=std_logic lab=event}
C {sky130_stdcells/xor2_1.sym} 920 -120 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 140 -160 3 0 {name=l53 sig_type=std_logic lab=phi1b}
C {sky130_stdcells/dfxtp_1.sym} 590 -130 2 1 {name=x11 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 500 -120 3 0 {name=l55 sig_type=std_logic lab=phi1}
C {sky130_stdcells/dfxtp_1.sym} 770 -110 2 1 {name=x12 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 680 -100 3 0 {name=l56 sig_type=std_logic lab=phi1}
C {sky130_stdcells/dfxtp_1.sym} 230 -170 2 1 {name=x9 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 410 -150 2 1 {name=x10 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 320 -140 3 0 {name=l50 sig_type=std_logic lab=phi1}
C {sky130_stdcells/and2_0.sym} 1040 -210 0 0 {name=x13 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 1100 -210 0 1 {name=l51 sig_type=std_logic lab=polxevent}
C {devices/lab_pin.sym} 610 -180 3 1 {name=l38 sig_type=std_logic lab=pol}
C {devices/ipin.sym} 60 -110 0 0 {name=p1 lab=inp}
C {devices/opin.sym} 1060 -80 0 0 {name=p2 lab=event}
C {devices/opin.sym} 1060 -110 0 0 {name=p3 lab=polxevent}
C {devices/opin.sym} 1060 -50 0 0 {name=p4 lab=pol}
C {devices/ipin.sym} 60 -80 0 0 {name=p5 lab=inm}
C {devices/ipin.sym} 60 -50 0 0 {name=p6 lab=phi1}
C {devices/ipin.sym} 60 -20 0 0 {name=p7 lab=phi1b}
C {devices/lab_pin.sym} 40 -200 0 0 {name=l1 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 40 -160 0 0 {name=l2 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 140 -180 3 1 {name=l3 sig_type=std_logic lab=compout}
C {devices/lab_pin.sym} 320 -160 3 1 {name=l4 sig_type=std_logic lab=latch}
C {devices/opin.sym} 1060 -20 0 0 {name=p8 lab=compout}
C {devices/opin.sym} 1060 10 0 0 {name=p9 lab=latch}
