v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -30 -340 -30 -270 { lab=Q}
N -50 -240 -30 -240 { lab=T}
N 200 -90 200 -70 { lab=Clk}
N 300 -260 340 -260 { lab=Q}
N -30 -340 300 -340 { lab=Q}
N 300 -340 300 -260 { lab=Q}
N 300 -160 340 -160 { lab=Q_inv}
C {D_flip_flop/d_flip_flop.sym} 90 -120 0 0 {name=X1}
C {exor_gate/exor_gate.sym} -540 -160 0 0 {name=X2}
C {devices/ipin.sym} -40 -240 0 0 {name=p1 lab=T}
C {devices/ipin.sym} 200 -80 3 0 {name=p2 lab=Clk}
C {devices/opin.sym} 330 -260 0 0 {name=p3 lab=Q}
C {devices/opin.sym} 330 -160 0 0 {name=p4 lab=Q_inv}
