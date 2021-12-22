v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {CLK_inv} -560 -190 0 0 0.4 0.4 {}
T {THis is positive edge triggered D Flip Flop
CLK_inv is the inverted Clk
D is the input} -120 -330 0 0 0.4 0.4 {}
N -100 50 -30 50 { lab=#net1}
N 70 50 200 50 { lab=#net2}
N 300 50 350 50 { lab=#net3}
N -60 -100 -60 50 { lab=#net1}
N 40 -100 60 -100 { lab=#net4}
N 160 -100 160 50 { lab=#net2}
N 300 -100 300 50 { lab=#net3}
N 400 -100 430 -100 { lab=#net5}
N 450 50 570 50 { lab=Q}
N -150 90 -150 110 { lab=#net6}
N -150 -10 -150 10 { lab=Clk}
N -10 -60 -10 -40 { lab=Clk}
N -10 -150 -10 -140 { lab=#net6}
N 250 90 250 110 { lab=Clk}
N 250 0 250 10 { lab=#net6}
N 250 -10 250 0 { lab=#net6}
N -10 -160 -10 -150 { lab=#net6}
N 350 -60 350 -40 { lab=#net6}
N 350 -160 350 -140 { lab=Clk}
N -280 -30 -250 -30 { lab=Clk}
N -650 -30 -440 -30 { lab=Clk}
N -410 -160 -10 -160 { lab=#net6}
N -10 -160 240 -160 { lab=#net6}
N 270 -40 350 -40 { lab=#net6}
N 240 -160 250 -160 { lab=#net6}
N 250 -160 250 -10 { lab=#net6}
N 250 -40 270 -40 { lab=#net6}
N -250 -30 -10 -30 { lab=Clk}
N -10 -40 -10 -30 { lab=Clk}
N -150 -30 -150 -10 { lab=Clk}
N -440 -180 -440 -30 { lab=Clk}
N -280 -180 350 -180 { lab=Clk}
N 350 -180 350 -160 { lab=Clk}
N -440 -30 -440 130 { lab=Clk}
N -280 130 250 130 { lab=Clk}
N 250 110 250 130 { lab=Clk}
N 530 20 530 50 { lab=Q}
N 430 -100 530 -100 { lab=#net5}
N 530 -100 530 -80 { lab=#net5}
N -570 -60 -570 -30 { lab=Clk}
N -510 -160 -510 110 { lab=#net6}
N -350 110 -150 110 { lab=#net6}
N -440 -180 -280 -180 { lab=Clk}
N -510 -160 -410 -160 { lab=#net6}
N -510 110 -350 110 { lab=#net6}
N -440 130 -280 130 { lab=Clk}
N -440 -30 -280 -30 { lab=Clk}
N -220 50 -200 50 { lab=#net7}
N -390 70 -360 70 { lab=D}
N -560 70 -390 70 { lab=D}
N -690 70 -560 70 { lab=D}
N -690 40 -630 40 { lab=RST}
N -530 40 -360 40 { lab=#net8}
N -570 -160 -510 -160 { lab=#net6}
C {inv/inv.sym} 20 50 0 0 {name=X1}
C {inv/inv.sym} 400 50 0 0 {name=X2}
C {inv/inv.sym} 110 -100 2 0 {name=X3}
C {inv/inv.sym} 530 -30 3 0 {name=X4}
C {transmission_gate/transmission_gate.sym} -150 50 0 0 {name=X5}
C {transmission_gate/transmission_gate.sym} -10 -100 0 0 {name=X6}
C {transmission_gate/transmission_gate.sym} 350 -100 0 0 {name=X7}
C {transmission_gate/transmission_gate.sym} 250 50 0 0 {name=X8}
C {devices/ipin.sym} -680 70 0 0 {name=p1 lab=D}
C {devices/ipin.sym} -640 -30 0 0 {name=p2 lab=Clk}
C {devices/opin.sym} 560 50 0 0 {name=p11 lab=Q}
C {inv/inv.sym} -570 -110 3 0 {name=X9}
C {and_gate/and_gate.sym} -860 540 0 0 {name=X10}
C {devices/ipin.sym} -680 40 0 0 {name=p3 lab=RST}
C {inv/inv.sym} -580 40 2 1 {name=X11}
