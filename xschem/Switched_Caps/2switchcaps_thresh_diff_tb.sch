v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 70 -160 280 -160 { lab=outp}
N -360 -160 -70 -160 { lab=inp}
N 20 -240 20 -220 { lab=phi2b}
N -360 570 -230 570 { lab=bias}
N -270 590 -230 590 { lab=bias}
N -270 570 -270 590 { lab=bias}
N -270 610 -230 610 { lab=fclk}
N -130 490 -20 490 { lab=phi1}
N -20 -240 -20 -220 { lab=phi1b}
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
N 20 -80 20 -60 { lab=phi2}
N -20 -80 -20 -60 { lab=phi1}
N 60 -80 60 -60 { lab=cclk}
N 70 200 280 200 { lab=outm}
N -360 200 -70 200 { lab=inm}
N 20 120 20 140 { lab=phi2b}
N -20 120 -20 140 { lab=phi1b}
N 70 220 160 220 { lab=thresh1}
N 70 240 140 240 { lab=thresh2}
N 20 280 20 300 { lab=phi2}
N -20 280 -20 300 { lab=phi1}
N 60 280 60 300 { lab=cclkb}
N -240 0 160 0 { lab=thresh1}
N -180 40 140 40 { lab=thresh2}
N 140 50 140 240 { lab=thresh2}
N 160 -40 160 220 { lab=thresh1}
N 330 -70 330 -50 { lab=phi1}
N 330 50 330 70 { lab=phi1b}
N 280 -160 280 -20 { lab=outp}
N 280 20 280 200 { lab=outm}
N 620 60 620 120 { lab=phi2}
N 380 -0 400 -0 { lab=compout}
N 580 0 620 0 { lab=latch}
N 620 20 620 60 { lab=phi2}
N 840 40 840 60 { lab=phi2}
N 620 60 840 60 { lab=phi2}
N 820 0 1060 0 { lab=o1}
N 820 0 820 20 { lab=o1}
N 800 20 840 20 { lab=o1}
N 1020 40 1060 40 { lab=o2}
N 400 20 400 70 { lab=phi1}
N 60 -240 60 -220 { lab=cclkb}
N 60 120 60 140 { lab=cclk}
C {devices/netlist.sym} -280 -520 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param thresh1=0.4
.param thresh2=0.8
*cap init conditions included in symbol
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{150*1/f\}
.save all
"}
C {devices/vsource.sym} -360 -130 0 0 {name=Vinp value="DC 0 SIN(0 0.1 50k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -360 -40 0 0 {name=l3 lab=GND}
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
C {Switched_Caps/2switchcaps_thresh.sym} 0 -160 0 0 {name=X1 Wcap=10 Lcap=5}
C {clkgen/filter_clkgen.sym} -180 550 0 0 {name=X2}
C {devices/vsource.sym} -360 600 0 0 {name=Vbias value="DC 0.6"}
C {devices/gnd.sym} -360 630 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} -100 510 2 0 {name=l4 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -60 550 2 0 {name=l9 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -20 -240 1 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 -240 1 0 {name=l14 sig_type=std_logic lab=phi2b}
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
C {devices/lab_pin.sym} -20 -60 3 0 {name=l25 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 -60 3 0 {name=l26 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 60 -60 3 0 {name=l27 sig_type=std_logic lab=cclk}
C {devices/vsource.sym} -360 230 0 0 {name=Vinm value="DC 0 SIN(0 -0.1 50k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -360 320 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} 280 200 2 0 {name=l29 sig_type=std_logic lab=outm}
C {devices/lab_pin.sym} -360 200 0 0 {name=l30 sig_type=std_logic lab=inm}
C {Switched_Caps/2switchcaps_thresh.sym} 0 200 0 0 {name=X3 Wcap=10 Lcap=5}
C {devices/lab_pin.sym} -20 120 1 0 {name=l31 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 120 1 0 {name=l32 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -20 300 3 0 {name=l35 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 300 3 0 {name=l36 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 60 300 3 0 {name=l37 sig_type=std_logic lab=cclkb}
C {comparator/doubletaillatch.sym} 280 50 0 0 {name=X4}
C {devices/lab_pin.sym} 330 -70 1 0 {name=l33 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 70 3 0 {name=l34 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1260 20 0 1 {name=l39 sig_type=std_logic lab=out}
C {sky130_stdcells/xor2_1.sym} 1120 20 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 820 0 3 1 {name=l43 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 1040 40 1 1 {name=l44 sig_type=std_logic lab=o2}
C {sky130_stdcells/buf_1.sym} 1220 20 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 620 120 3 0 {name=l45 sig_type=std_logic lab=phi2}
C {sky130_stdcells/dlxtp_1.sym} 490 10 0 0 {name=x7 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 710 10 2 1 {name=x8 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 930 30 2 1 {name=x1 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 400 70 3 0 {name=l38 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 390 0 3 1 {name=l40 sig_type=std_logic lab=compout}
C {devices/lab_pin.sym} 60 -240 1 0 {name=l41 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 60 120 1 0 {name=l42 sig_type=std_logic lab=cclk}
C {devices/vsource.sym} -360 -70 0 0 {name=Vinp1 value="DC 0 SIN(0.7 0.1 25k)"
*SIN (0.6 0.6 1k)"}
C {devices/vsource.sym} -360 290 0 0 {name=Vinm1 value="DC 0 SIN(0.5 -0.1 25k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} 600 0 3 1 {name=l46 sig_type=std_logic lab=latch}
