v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 50 -40 100 -40 { lab=outp}
N -190 -40 -50 -40 { lab=inp}
N 50 40 100 40 { lab=outm}
N 0 60 0 80 { lab=ctrl}
N -250 -40 -250 -20 { lab=inp}
N -250 -40 -190 -40 { lab=inp}
N -140 40 -140 60 { lab=inm}
N -140 40 -50 40 { lab=inm}
C {devices/vsource.sym} -250 10 0 0 {name=Vinp value="DC 0 SIN(0.6 0.6 1k)"}
C {devices/vsource.sym} -320 -150 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -320 -180 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -320 -120 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -250 -40 0 0 {name=l4 sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 100 -40 2 0 {name=l5 sig_type=std_logic lab=outp}
C {devices/vsource.sym} 0 110 0 0 {name=Vctrl value="PULSE (0 1.2 1u 1u 1u 1m 2m)"}
C {devices/gnd.sym} 0 140 0 0 {name=l6 lab=GND}
C {devices/netlist.sym} -230 -200 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1u 4m
.save all
"}
C {devices/lab_pin.sym} 0 60 2 0 {name=l9 sig_type=std_logic lab=ctrl}
C {devices/lab_pin.sym} 100 40 2 0 {name=l7 sig_type=std_logic lab=outm}
C {devices/gnd.sym} -250 40 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -140 90 0 0 {name=Vinm value="DC 0 SIN(0.6 -0.6 1k)"}
C {devices/lab_pin.sym} -140 40 0 0 {name=l10 sig_type=std_logic lab=inm}
C {devices/gnd.sym} -140 120 0 0 {name=l11 lab=GND}
C {mux/multiplier_differential.sym} 0 0 0 0 {name=X1}
