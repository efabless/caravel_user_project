v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 310 -360 510 -360 { lab=#net1}
N 310 -140 510 -140 { lab=#net2}
N 630 -340 710 -340 { lab=Q}
N 660 -340 660 -300 { lab=Q}
N 480 -230 660 -300 { lab=Q}
N 480 -230 480 -180 { lab=Q}
N 480 -180 510 -180 { lab=Q}
N 660 -200 660 -160 { lab=#net3}
N 480 -270 660 -200 { lab=#net3}
N 480 -320 480 -270 { lab=#net3}
N 480 -320 510 -320 { lab=#net3}
N 340 -360 340 -320 { lab=#net1}
N 190 -230 340 -320 { lab=#net1}
N 190 -230 190 -160 { lab=#net1}
N 150 -340 190 -340 { lab=clk}
N 150 -340 150 -120 { lab=clk}
N 150 -120 190 -120 { lab=clk}
N 110 -120 150 -120 { lab=clk}
N 110 -380 190 -380 { lab=D}
N 630 -160 660 -160 { lab=#net3}
C {sky130_stdcells/nand2_1.sym} 250 -360 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__}
C {devices/ipin.sym} 110 -380 0 0 {name=p1 lab=D}
C {devices/ipin.sym} 110 -120 0 0 {name=p2 lab=clk}
C {devices/opin.sym} 710 -340 0 0 {name=p3 lab=Q}
C {sky130_stdcells/nand2_1.sym} 570 -340 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__}
C {sky130_stdcells/nand2_1.sym} 250 -140 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__}
C {sky130_stdcells/nand2_1.sym} 570 -160 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__}
