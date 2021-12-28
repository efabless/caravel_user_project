v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 70 -160 280 -160 { lab=outp}
N -70 -220 -70 -200 { lab=phi2b}
N -360 570 -230 570 { lab=bias}
N -270 590 -230 590 { lab=bias}
N -270 570 -270 590 { lab=bias}
N -270 610 -230 610 { lab=fclk}
N -130 490 -20 490 { lab=phi1}
N -110 -220 -110 -200 { lab=phi1b}
N -130 510 -100 510 { lab=phi1b}
N -130 530 20 530 { lab=phi2}
N -130 570 60 570 { lab=cclk}
N -130 590 -110 590 { lab=cclkb}
N -130 610 -110 610 { lab=fclkdiv2}
N -130 550 -60 550 { lab=phi2b}
N 70 -140 160 -140 { lab=thresh1}
N 70 -120 140 -120 { lab=thresh2}
N 140 -120 140 50 { lab=thresh2}
N -360 440 -230 440 { lab=rstb}
N 160 -140 160 -40 { lab=thresh1}
N -230 440 -230 490 { lab=rstb}
N -70 -100 -70 -80 { lab=phi2}
N -110 -100 -110 -80 { lab=phi1}
N 50 -100 50 -80 { lab=cclk}
N 70 200 280 200 { lab=outm}
N -70 140 -70 160 { lab=phi2b}
N -110 140 -110 160 { lab=phi1b}
N -70 260 -70 280 { lab=phi2}
N -110 260 -110 280 { lab=phi1}
N 50 260 50 280 { lab=cclk}
N -240 0 160 0 { lab=thresh1}
N -180 40 140 40 { lab=thresh2}
N 160 -40 160 220 { lab=thresh1}
N 330 -70 330 -50 { lab=phi1}
N 330 50 330 70 { lab=phi1b}
N 280 -160 280 -20 { lab=outp}
N 280 20 280 200 { lab=outm}
N 380 -0 400 -0 { lab=compout}
N 50 -220 50 -200 { lab=cclkb}
N 50 140 50 160 { lab=cclkb}
N 70 220 140 220 { lab=thresh2}
N 140 50 140 220 { lab=thresh2}
N 70 240 160 240 { lab=thresh1}
N 160 220 160 240 { lab=thresh1}
N -360 -160 -230 -160 { lab=inp}
N -360 200 -230 200 { lab=inm}
C {devices/netlist.sym} -280 -520 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param thresh1=0.1
.param thresh2=0.25
*cap init conditions included in symbol
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{150*1/f\}
.save all
"}
C {devices/vsource.sym} -360 -130 0 0 {name=Vinp value="DC 0 SIN(0 0.3 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -360 -100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 280 -160 2 0 {name=l1 sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} -360 -160 0 0 {name=l5 sig_type=std_logic lab=inp}
C {devices/vsource.sym} -360 -320 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -360 -290 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -360 -350 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -270 640 0 0 {name=Vfclk value="DC 0 PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -270 670 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 490 2 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 530 2 0 {name=l13 sig_type=std_logic lab=phi2}
C {clkgen/filter_clkgen.sym} -180 550 0 0 {name=X2}
C {devices/vsource.sym} -360 600 0 0 {name=Vbias value="DC 0.6"}
C {devices/gnd.sym} -360 630 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} -100 510 2 0 {name=l4 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -60 550 2 0 {name=l9 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -110 -220 1 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -70 -220 1 0 {name=l14 sig_type=std_logic lab=phi2b}
C {devices/vsource.sym} -240 30 0 0 {name=Vthresh1 value="DC \{thresh1\}"}
C {devices/gnd.sym} -240 60 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} -180 70 0 0 {name=Vthresh2 value="DC \{thresh2\}"}
C {devices/gnd.sym} -180 100 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -360 440 0 0 {name=l17 sig_type=std_logic lab=rstb}
C {devices/vsource.sym} -360 470 0 0 {name=Vrstb value="DC 0 PWL (0 0 \{1/4*1/f\} 0  \{1/4*1/f +0.1u\} 1.2\}"}
C {devices/gnd.sym} -360 500 0 0 {name=l18 lab=GND}
C {devices/lab_pin.sym} -270 610 0 0 {name=l2 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} 130 -120 3 0 {name=l19 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 150 -140 3 0 {name=l20 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} -360 570 0 0 {name=l21 sig_type=std_logic lab=bias}
C {devices/lab_pin.sym} -110 590 2 0 {name=l22 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} -110 610 2 0 {name=l23 sig_type=std_logic lab=fclkdiv2}
C {devices/lab_pin.sym} 60 570 2 0 {name=l24 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} -110 -80 3 0 {name=l25 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -70 -80 3 0 {name=l26 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 50 -80 3 0 {name=l27 sig_type=std_logic lab=cclk}
C {devices/vsource.sym} -360 230 0 0 {name=Vinm value="DC 0 SIN(0 -0.3 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -360 260 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} 280 200 2 0 {name=l29 sig_type=std_logic lab=outm}
C {devices/lab_pin.sym} -360 200 0 0 {name=l30 sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} -110 140 1 0 {name=l31 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -70 140 1 0 {name=l32 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -110 280 3 0 {name=l35 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -70 280 3 0 {name=l36 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 50 140 1 0 {name=l37 sig_type=std_logic lab=cclkb}
C {comparator/doubletaillatch.sym} 280 50 0 0 {name=X4}
C {devices/lab_pin.sym} 330 70 3 0 {name=l33 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 -70 1 0 {name=l34 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 400 0 0 1 {name=l40 sig_type=std_logic lab=compout}
C {devices/lab_pin.sym} 50 -220 1 0 {name=l41 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 50 280 3 0 {name=l42 sig_type=std_logic lab=cclk}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} -90 210 0 0 {name=X5 W=20 L=20}
C {Switched_Caps/16switchcaps_2phi_thresh.sym} -90 -150 0 0 {name=X1 W=20 L=20}
