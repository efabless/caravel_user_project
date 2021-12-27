v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {https://electronics.stackexchange.com/questions/497337/why-do-we-use-2-transistors-for-each-path-of-a-mux-in-cmos} -290 170 0 0 0.4 0.4 {}
N 50 -60 80 -60 { lab=out}
N 80 -60 80 60 { lab=out}
N 50 60 80 60 { lab=out}
N 80 -0 140 -0 { lab=out}
N -0 -20 -0 -0 { lab=ctrl}
N -0 -0 -0 20 { lab=ctrl}
N -140 0 0 0 { lab=ctrl}
N -0 100 0 140 { lab=ctrl}
N -200 -60 -50 -60 { lab=in1}
N -200 60 -50 60 { lab=in2}
N -200 0 -140 0 { lab=ctrl}
N -0 140 120 140 { lab=ctrl}
N 120 -140 120 140 { lab=ctrl}
N -40 -140 120 -140 { lab=ctrl}
N -0 -140 -0 -100 { lab=ctrl}
N -200 -140 -40 -140 { lab=ctrl}
C {devices/ipin.sym} -200 -60 0 0 {name=p1 lab=in1}
C {devices/ipin.sym} -200 0 0 0 {name=p2 lab=ctrl}
C {devices/ipin.sym} -200 60 0 0 {name=p3 lab=in2}
C {devices/iopin.sym} 140 0 0 0 {name=p4 lab=out}
C {transmission_gate/transmission_gate.sym} 0 -60 0 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {transmission_gate/transmission_gate.sym} 0 60 0 0 {name=X2 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/ipin.sym} -200 -140 0 0 {name=p5 lab=ctrlbar}
