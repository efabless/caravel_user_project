v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {dfxtp is a flip flop} 440 40 0 0 0.2 0.2 {}
N 70 -160 280 -160 { lab=outp}
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
N -240 0 160 0 { lab=thresh1}
N -180 40 140 40 { lab=thresh2}
N 160 -40 160 220 { lab=thresh1}
N 330 -70 330 -50 { lab=phi1}
N 330 50 330 70 { lab=phi1b}
N 280 -160 280 -20 { lab=outp}
N 280 20 280 200 { lab=outm}
N 380 -0 400 -0 { lab=compout}
N 60 -240 60 -220 { lab=cclkb}
N 70 220 140 220 { lab=thresh2}
N 140 50 140 220 { lab=thresh2}
N 70 240 160 240 { lab=thresh1}
N 160 220 160 240 { lab=thresh1}
N 400 60 400 120 { lab=phi1b}
N 400 20 400 60 { lab=phi1b}
N 1120 20 1120 40 { lab=pol}
N 1120 0 1120 20 { lab=pol}
N 760 0 760 40 { lab=pol}
N 760 0 800 0 { lab=pol}
N 1120 -50 1120 0 { lab=pol}
N 1120 -50 1230 -50 { lab=pol}
N 1240 30 1240 60 { lab=#net1}
N 1240 -10 1240 30 { lab=#net1}
N 1230 -50 1240 -50 { lab=pol}
N 800 0 1120 -0 { lab=pol}
N 20 120 20 140 { lab=phi2b}
N -20 120 -20 140 { lab=phi1b}
N 20 280 20 300 { lab=phi2}
N -20 280 -20 300 { lab=phi1}
N 60 280 60 300 { lab=cclk}
N 60 120 60 140 { lab=cclkb}
N -120 -240 -120 -220 { lab=phi2b}
N -160 -240 -160 -220 { lab=phi1b}
N -120 -80 -120 -60 { lab=phi2}
N -160 -80 -160 -60 { lab=phi1}
N -400 0 -240 -0 { lab=thresh1}
N -340 40 -180 40 { lab=thresh2}
N -120 120 -120 140 { lab=phi2b}
N -160 120 -160 140 { lab=phi1b}
N -120 280 -120 300 { lab=phi2}
N -160 280 -160 300 { lab=phi1}
N -260 -240 -260 -220 { lab=phi2b}
N -300 -240 -300 -220 { lab=phi1b}
N -260 -80 -260 -60 { lab=phi2}
N -300 -80 -300 -60 { lab=phi1}
N -400 -240 -400 -220 { lab=phi2b}
N -440 -240 -440 -220 { lab=phi1b}
N -400 -80 -400 -60 { lab=phi2}
N -440 -80 -440 -60 { lab=phi1}
N -260 120 -260 140 { lab=phi2b}
N -300 120 -300 140 { lab=phi1b}
N -260 280 -260 300 { lab=phi2}
N -300 280 -300 300 { lab=phi1}
N -400 120 -400 140 { lab=phi2b}
N -440 120 -440 140 { lab=phi1b}
N -400 280 -400 300 { lab=phi2}
N -440 280 -440 300 { lab=phi1}
N -660 -160 -490 -160 { lab=inp}
N -660 200 -490 200 { lab=inm}
C {devices/netlist.sym} -280 -520 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param thresh1=0.1
.param thresh2=0.22
*cap init conditions included in symbol
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{450*1/f\}
.save all
"}
C {devices/vsource.sym} -660 -130 0 0 {name=Vinp value="DC 0 SIN(0 0.1 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -660 -40 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 280 -160 2 0 {name=l1 sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} -660 -160 0 0 {name=l5 sig_type=std_logic lab=inp}
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
C {devices/lab_pin.sym} -20 -240 1 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 -240 1 0 {name=l14 sig_type=std_logic lab=phi2b}
C {devices/vsource.sym} -400 30 0 0 {name=Vthresh1 value="DC \{thresh1\}"}
C {devices/gnd.sym} -400 60 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} -340 70 0 0 {name=Vthresh2 value="DC \{thresh2\}"}
C {devices/gnd.sym} -340 100 0 0 {name=l16 lab=GND}
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
C {devices/vsource.sym} -660 230 0 0 {name=Vinm value="DC 0 SIN(0 -0.1 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -660 320 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} 280 200 2 0 {name=l29 sig_type=std_logic lab=outm}
C {devices/lab_pin.sym} -660 200 0 0 {name=l30 sig_type=std_logic lab=inm}
C {comparator/doubletaillatch.sym} 280 50 0 0 {name=X4}
C {devices/lab_pin.sym} 330 70 3 0 {name=l33 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 -70 1 0 {name=l34 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 390 0 3 1 {name=l40 sig_type=std_logic lab=compout}
C {devices/lab_pin.sym} 60 -240 1 0 {name=l41 sig_type=std_logic lab=cclkb}
C {devices/vsource.sym} -660 -70 0 0 {name=Vinp1 value="DC 0 SIN(0.7 0.1 12k)"
*SIN (0.6 0.6 1k)"}
C {devices/vsource.sym} -660 290 0 0 {name=Vinm1 value="DC 0 SIN(0.5 -0.1 12k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} 1320 60 0 1 {name=l49 sig_type=std_logic lab=event}
C {sky130_stdcells/xor2_1.sym} 1180 60 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 400 120 3 0 {name=l53 sig_type=std_logic lab=phi1b}
C {sky130_stdcells/dfxtp_1.sym} 850 50 2 1 {name=x11 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 760 60 3 0 {name=l55 sig_type=std_logic lab=phi1}
C {sky130_stdcells/dfxtp_1.sym} 1030 70 2 1 {name=x12 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 940 80 3 0 {name=l56 sig_type=std_logic lab=phi1}
C {sky130_stdcells/dfxtp_1.sym} 490 10 2 1 {name=x9 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 670 30 2 1 {name=x10 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 580 40 3 0 {name=l50 sig_type=std_logic lab=phi1}
C {sky130_stdcells/and2_0.sym} 1300 -30 0 0 {name=x13 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 1360 -30 0 1 {name=l51 sig_type=std_logic lab=polxevent}
C {devices/lab_pin.sym} 870 0 3 1 {name=l38 sig_type=std_logic lab=pol}
C {Switched_Caps/2switchcaps_thresh.sym} 0 -160 0 0 {name=X1 Wcap=5 Lcap=8}
C {devices/lab_pin.sym} -20 120 1 0 {name=l31 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 120 1 0 {name=l32 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -20 300 3 0 {name=l35 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 300 3 0 {name=l36 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 60 300 3 0 {name=l37 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 60 120 1 0 {name=l39 sig_type=std_logic lab=cclkb}
C {Switched_Caps/2switchcaps_thresh.sym} 0 200 0 0 {name=X3 Wcap=5 Lcap=8}
C {Switched_Caps/2switchcaps.sym} -140 -160 0 0 {name=X5 Wcap=5 Lcap=8}
C {Switched_Caps/2switchcaps.sym} -140 200 0 0 {name=X6 Wcap=5 Lcap=8}
C {devices/lab_pin.sym} -160 -240 1 0 {name=l42 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -120 -240 1 0 {name=l43 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -160 -60 3 0 {name=l44 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -120 -60 3 0 {name=l45 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} -160 120 1 0 {name=l46 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -120 120 1 0 {name=l47 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -160 300 3 0 {name=l48 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -120 300 3 0 {name=l52 sig_type=std_logic lab=phi2}
C {Switched_Caps/2switchcaps.sym} -280 -160 0 0 {name=X7 Wcap=5 Lcap=8}
C {devices/lab_pin.sym} -300 -240 1 0 {name=l54 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -260 -240 1 0 {name=l57 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -300 -60 3 0 {name=l58 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -260 -60 3 0 {name=l59 sig_type=std_logic lab=phi2}
C {Switched_Caps/2switchcaps.sym} -420 -160 0 0 {name=X8 Wcap=5 Lcap=28}
C {devices/lab_pin.sym} -440 -240 1 0 {name=l60 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -400 -240 1 0 {name=l61 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -440 -60 3 0 {name=l62 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -400 -60 3 0 {name=l63 sig_type=std_logic lab=phi2}
C {Switched_Caps/2switchcaps.sym} -280 200 0 0 {name=X9 Wcap=5 Lcap=8}
C {devices/lab_pin.sym} -300 120 1 0 {name=l64 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -260 120 1 0 {name=l65 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -300 300 3 0 {name=l66 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -260 300 3 0 {name=l67 sig_type=std_logic lab=phi2}
C {Switched_Caps/2switchcaps.sym} -420 200 0 0 {name=X10 Wcap=5 Lcap=8}
C {devices/lab_pin.sym} -440 120 1 0 {name=l68 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -400 120 1 0 {name=l69 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -440 300 3 0 {name=l70 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -400 300 3 0 {name=l71 sig_type=std_logic lab=phi2}
C {sky130_stdcells/buf_1.sym} 1280 60 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
