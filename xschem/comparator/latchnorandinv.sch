v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 140 -230 140 -140 { lab=clk}
N 110 -270 140 -270 { lab=#net1}
N 30 -270 30 -100 { lab=D}
N 30 -40 140 -40 { lab=D}
N 140 -140 140 -80 { lab=clk}
N 30 -100 30 -40 { lab=D}
N 260 -60 480 -60 { lab=#net2}
N 260 -250 480 -250 { lab=#net3}
N 480 -210 480 -190 { lab=#net4}
N 480 -190 600 -100 { lab=#net4}
N 600 -100 600 -80 { lab=#net4}
N 480 -120 480 -100 { lab=Q}
N 480 -120 600 -210 { lab=Q}
N 600 -230 600 -210 { lab=Q}
N 600 -230 650 -230 { lab=Q}
N 0 -160 30 -160 { lab=D}
N 120 -160 140 -160 { lab=clk}
C {sky130_stdcells/and2_1.sym} 200 -250 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 70 -270 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/nor2_1.sym} 540 -230 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 200 -60 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/nor2_1.sym} 540 -80 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/ipin.sym} 0 -160 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 120 -160 0 0 {name=p2 lab=clk}
C {devices/opin.sym} 650 -230 0 0 {name=p3 lab=Q}
