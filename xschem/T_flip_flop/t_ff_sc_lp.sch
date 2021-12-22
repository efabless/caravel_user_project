v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -30 20 20 20 { lab=#net1}
N -230 40 -150 40 { lab=T}
N -150 -70 -150 0 { lab=Q}
N -150 -70 230 -70 { lab=Q}
N 230 -70 230 0 { lab=Q}
N 200 0 270 0 { lab=Q}
N 0 0 20 0 { lab=CLK}
N 0 0 0 90 { lab=CLK}
N -230 90 0 90 { lab=CLK}
C {sky130_stdcells/xor2_1.sym} -90 20 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 110 10 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/ipin.sym} -230 40 0 0 {name=p1 lab=T}
C {devices/ipin.sym} -230 90 0 0 {name=p2 lab=CLK}
C {devices/opin.sym} 270 0 0 0 {name=p3 lab=Q}
