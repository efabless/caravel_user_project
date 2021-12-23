v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 140 -230 140 -140 { lab=clkbar}
N 110 -270 140 -270 { lab=#net1}
N 30 -270 30 -100 { lab=D}
N 30 -40 140 -40 { lab=D}
N 140 -140 140 -80 { lab=clkbar}
N 30 -100 30 -40 { lab=D}
N 260 -60 480 -60 { lab=#net2}
N 260 -250 480 -250 { lab=#net3}
N 480 -210 480 -190 { lab=#net4}
N 480 -190 600 -100 { lab=#net4}
N 600 -100 600 -80 { lab=#net4}
N 480 -120 480 -100 { lab=out}
N 480 -120 600 -210 { lab=out}
N 600 -230 600 -210 { lab=out}
N 600 -230 650 -230 { lab=out}
N 0 -160 30 -160 { lab=D}
N 120 -160 140 -160 { lab=clkbar}
C {sky130_stdcells/and2_1.sym} 200 -250 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 70 -270 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/nor2_1.sym} 540 -230 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 200 -60 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/nor2_1.sym} 540 -80 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/code_shown.sym} 10 -545 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 0.2m
.save all
"}
C {devices/vsource.sym} 60 -370 0 0 {name=V7 value=PULSE(1,0,0,1n,1n,10u,20u)}
C {devices/vsource.sym} 380 -360 0 0 {name=V10 value=1}
C {devices/vdd.sym} 380 -390 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 380 -330 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 60 -400 0 0 {name=l6 sig_type=std_logic lab=clkbar}
C {devices/gnd.sym} 60 -340 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 500 -370 0 0 {name=V1 value=PULSE(0,1,3u,1n,1n,15u,30u)}
C {devices/lab_pin.sym} 500 -400 0 0 {name=l17 sig_type=std_logic lab=D}
C {devices/gnd.sym} 500 -340 0 0 {name=l18 lab=GND}
C {devices/lab_pin.sym} 120 -160 0 0 {name=l3 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 0 -160 0 0 {name=l4 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 650 -230 0 1 {name=l5 sig_type=std_logic lab=out}
