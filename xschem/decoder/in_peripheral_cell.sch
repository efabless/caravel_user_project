v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -40 -90 -40 90 { lab=GND}
N 40 -90 40 90 { lab=VDD}
N 40 -50 100 -50 { lab=vdd}
N -40 50 100 50 { lab=gnd}
C {devices/iopin.sym} 40 85 1 0 {name=p3 lab=vdd}
C {devices/iopin.sym} -40 -85 3 0 {name=p4 lab=gnd}
C {devices/iopin.sym} 90 -50 0 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 90 50 0 0 {name=p5 lab=gnd}
C {devices/vdd.sym} 40 -90 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -40 90 0 0 {name=l2 lab=GND}
