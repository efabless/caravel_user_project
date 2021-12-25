v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 70 0 170 0 { lab=out}
N -330 0 -70 0 { lab=in}
N 20 -80 20 -60 { lab=phi2b}
N 20 80 20 260 { lab=phi2}
N -320 300 -230 300 { lab=#net1}
N -270 320 -230 320 { lab=#net1}
N -270 300 -270 320 { lab=#net1}
N -270 340 -230 340 { lab=#net2}
N -130 220 -20 220 { lab=phi1}
N -20 80 -20 220 { lab=phi1}
N -20 -80 -20 -60 { lab=phi1b}
N -130 240 -100 240 { lab=phi1b}
N -130 260 20 260 { lab=phi2}
N 60 80 60 300 { lab=#net3}
N -130 300 60 300 { lab=#net3}
N -130 320 -110 320 { lab=#net4}
N -130 340 -110 340 { lab=#net5}
N -130 280 -100 280 { lab=phi2b}
N 70 20 140 20 { lab=#net6}
N 70 40 100 40 { lab=#net7}
N 100 40 100 120 { lab=#net7}
N 100 120 140 120 { lab=#net7}
N -300 160 -230 160 { lab=rstb}
N -230 160 -230 220 { lab=rstb}
C {devices/netlist.sym} -240 -330 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(x1.c1)=0 v(out)=0
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{10*1/f\}
.save all
"}
C {devices/vsource.sym} -330 30 0 0 {name=Vin value="DC 0 PULSE (0 1.2 1n 1n 1n \{2*duty_cycle*1/f\} \{10/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -330 60 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 170 0 2 0 {name=l1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -330 0 0 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -330 -170 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -330 -140 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -330 -200 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -270 370 0 0 {name=Vfclk value="DC 0 PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -270 400 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 210 0 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 250 0 0 {name=l13 sig_type=std_logic lab=phi2}
C {Switched_Caps/2switchcaps_thresh.sym} 0 0 0 0 {name=X1 Wcap=10 Lcap=5}
C {clkgen/filter_clkgen.sym} -180 280 0 0 {name=X2}
C {devices/vsource.sym} -320 330 0 0 {name=Vbias value="DC 0.6"}
C {devices/gnd.sym} -320 360 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} -100 240 2 0 {name=l4 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -100 280 2 0 {name=l9 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -20 -80 1 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 -80 1 0 {name=l14 sig_type=std_logic lab=phi2b}
C {devices/vsource.sym} 140 50 0 0 {name=Vthresh1 value="DC 0.6"}
C {devices/gnd.sym} 140 80 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} 140 150 0 0 {name=Vthresh2 value="DC 0.6"}
C {devices/gnd.sym} 140 180 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -300 160 0 0 {name=l17 sig_type=std_logic lab=rstb}
C {devices/vsource.sym} -300 190 0 0 {name=Vrstb value="DC 0 PWL (0 0 \{duty_cycle*1/f\} 0  \{duty_cycle*1/f +1n\} 1.2\}"}
C {devices/gnd.sym} -300 220 0 0 {name=l18 lab=GND}
