v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {CLK_inv} -380 -220 0 0 0.4 0.4 {}
T {THis is positive edge triggered D Flip Flop
CLK_inv is the inverted Clk
D is the input} -100 -360 0 0 0.4 0.4 {}
N -80 20 -10 20 { lab=#net1}
N 90 20 220 20 { lab=#net2}
N 320 20 370 20 { lab=#net3}
N -40 -130 -40 20 { lab=#net1}
N 60 -130 80 -130 { lab=#net4}
N 180 -130 180 20 { lab=#net2}
N 320 -130 320 20 { lab=#net3}
N 420 -130 450 -130 { lab=Q_inv}
N 470 20 590 20 { lab=Q}
N 550 -130 590 -130 { lab=Q_inv}
N -220 20 -180 20 { lab=D}
N -130 60 -130 80 { lab=Clk_inv}
N -130 -40 -130 -20 { lab=Clk}
N 10 -90 10 -70 { lab=Clk}
N 10 -180 10 -170 { lab=Clk_inv}
N 270 60 270 80 { lab=Clk}
N 270 -30 270 -20 { lab=Clk_inv}
N 270 -40 270 -30 { lab=Clk_inv}
N 10 -190 10 -180 { lab=Clk_inv}
N 370 -90 370 -70 { lab=Clk_inv}
N 370 -190 370 -170 { lab=Clk}
N -260 -60 -230 -60 { lab=Clk}
N -470 -60 -260 -60 { lab=Clk}
N -390 -190 10 -190 { lab=Clk_inv}
N 10 -190 260 -190 { lab=Clk_inv}
N 290 -70 370 -70 { lab=Clk_inv}
N 260 -190 270 -190 { lab=Clk_inv}
N 270 -190 270 -40 { lab=Clk_inv}
N 270 -70 290 -70 { lab=Clk_inv}
N -230 -60 10 -60 { lab=Clk}
N 10 -70 10 -60 { lab=Clk}
N -130 -60 -130 -40 { lab=Clk}
N -260 -210 -260 -60 { lab=Clk}
N -260 -210 370 -210 { lab=Clk}
N 370 -210 370 -190 { lab=Clk}
N -260 -60 -260 100 { lab=Clk}
N -260 100 270 100 { lab=Clk}
N 270 80 270 100 { lab=Clk}
N 550 -10 550 20 { lab=Q}
N 450 -130 550 -130 { lab=Q_inv}
N 550 -130 550 -110 { lab=Q_inv}
N -390 -90 -390 -60 { lab=Clk}
N -330 -190 -330 80 { lab=Clk_inv}
N -330 80 -130 80 { lab=Clk_inv}
C {inv/inv.sym} 40 20 0 0 {name=X1}
C {inv/inv.sym} 420 20 0 0 {name=X2}
C {inv/inv.sym} 130 -130 2 0 {name=X3}
C {inv/inv.sym} 550 -60 3 0 {name=X4}
C {transmission_gate/transmission_gate.sym} -130 20 0 0 {name=X5}
C {transmission_gate/transmission_gate.sym} 10 -130 0 0 {name=X6}
C {transmission_gate/transmission_gate.sym} 370 -130 0 0 {name=X7}
C {transmission_gate/transmission_gate.sym} 270 20 0 0 {name=X8}
C {devices/ipin.sym} -210 20 0 0 {name=p1 lab=D}
C {devices/ipin.sym} -460 -60 0 0 {name=p2 lab=Clk}
C {devices/opin.sym} 580 -130 0 0 {name=p10 lab=Q_inv}
C {devices/opin.sym} 580 20 0 0 {name=p11 lab=Q}
C {devices/lab_pin.sym} -330 -190 2 0 {name=l5 sig_type=std_logic lab=Clk_inv}
C {inv/inv.sym} -390 -140 3 0 {name=X9}
