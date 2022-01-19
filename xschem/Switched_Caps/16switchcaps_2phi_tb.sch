v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Stay ON through first phi1} -310 230 0 0 0.2 0.2 {}
T {inject charge as .ic} 140 -460 0 0 0.4 0.4 {}
T {180 deg phase shift} -240 480 0 0 0.4 0.4 {}
T {flip hi/lo setting} -170 530 0 0 0.4 0.4 {}
N 150 30 180 30 { lab=in}
N 460 30 490 30 { lab=out8}
N -470 190 -430 190 { lab=in}
N 330 -40 330 -20 { lab=phi2b}
N 330 80 330 100 { lab=phi2}
N 290 80 290 100 { lab=phi1}
N 290 -40 290 -20 { lab=phi1b}
N 90 -350 180 -350 { lab=in2}
N 460 -350 490 -350 { lab=out2}
N 330 -300 330 -280 { lab=phi2}
N 290 -300 290 -280 { lab=phi1}
N 290 -420 290 -400 { lab=phi1b}
N 330 -420 330 -400 { lab=phi2b}
N -470 370 -430 370 { lab=phi1b}
N -420 440 -380 440 { lab=phi1}
N -360 490 -320 490 { lab=phi2}
N -290 540 -250 540 { lab=phi2b}
N 630 -190 660 -190 { lab=c1}
N 940 -190 970 -190 { lab=out3}
N 770 -140 770 -120 { lab=phi2}
N 810 -140 810 -120 { lab=phi1}
N 810 -260 810 -240 { lab=phi1b}
N 770 -260 770 -240 { lab=phi2b}
N 630 -190 630 -150 { lab=c1}
N 530 -150 530 -130 { lab=phi1}
N 530 -250 530 -230 { lab=phi1b}
N 580 -190 630 -190 { lab=c1}
N 450 -190 480 -190 { lab=in}
N 150 200 180 200 { lab=in}
N 460 200 490 200 { lab=#net1}
N 330 130 330 150 { lab=phi2b}
N 330 250 330 270 { lab=phi2}
N 290 250 290 270 { lab=phi1}
N 290 130 290 150 { lab=phi1b}
N 640 130 640 150 { lab=phi2b}
N 640 250 640 270 { lab=phi2}
N 600 250 600 270 { lab=phi1}
N 600 130 600 150 { lab=phi1b}
N 770 200 800 200 { lab=out16}
N 150 370 180 370 { lab=in}
N 460 370 490 370 { lab=#net2}
N 330 300 330 320 { lab=phi2b}
N 330 420 330 440 { lab=phi2}
N 290 420 290 440 { lab=phi1}
N 290 300 290 320 { lab=phi1b}
N 640 300 640 320 { lab=phi2b}
N 640 420 640 440 { lab=phi2}
N 600 420 600 440 { lab=phi1}
N 600 300 600 320 { lab=phi1b}
N 770 370 800 370 { lab=#net3}
N 950 300 950 320 { lab=phi2b}
N 950 420 950 440 { lab=phi2}
N 910 420 910 440 { lab=phi1}
N 910 300 910 320 { lab=phi1b}
N 1080 370 1110 370 { lab=out24}
N 150 540 180 540 { lab=in}
N 460 540 490 540 { lab=#net4}
N 330 470 330 490 { lab=phi2b}
N 330 590 330 610 { lab=phi2}
N 290 590 290 610 { lab=phi1}
N 290 470 290 490 { lab=phi1b}
N 640 470 640 490 { lab=phi2b}
N 640 590 640 610 { lab=phi2}
N 600 590 600 610 { lab=phi1}
N 600 470 600 490 { lab=phi1b}
N 770 540 800 540 { lab=#net5}
N 950 470 950 490 { lab=phi2b}
N 950 590 950 610 { lab=phi2}
N 910 590 910 610 { lab=phi1}
N 910 470 910 490 { lab=phi1b}
N 1080 540 1110 540 { lab=#net6}
N 1260 470 1260 490 { lab=phi2b}
N 1260 590 1260 610 { lab=phi2}
N 1220 590 1220 610 { lab=phi1}
N 1220 470 1220 490 { lab=phi1b}
C {devices/netlist.sym} -470 -360 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param fmax=2560k
.param f=\{fmax/(2^7)\}
*do we need to scale the input size with f/fmax?
.param input=\{1.2\}
*.param input=\{1.2*10\}
.param duty_cycle=0.4
*number of 1/f cycles to sim
.param N=1000
.ic v(in2)=1.2 v(in3)=1.2
*.ic conditions are set inside cap sym
.tran \{1/f/100\} \{N*1/f\}
.save all
"}
C {devices/vsource.sym} -470 220 0 0 {name=Vin value="PULSE (0 input 1n 1n 1n \{(0.25+duty_cycle/2)*1/f\} \{N/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -470 250 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 490 30 2 0 {name=l1 sig_type=std_logic lab=out8}
C {devices/lab_pin.sym} 150 30 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -430 190 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -470 10 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -470 40 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -470 -20 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -420 470 0 0 {name=Vphi1 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -420 500 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 290 100 0 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 100 2 0 {name=l13 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} -470 400 0 0 {name=Vphi1b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/vsource.sym} -360 520 0 0 {name=Vphi2 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -360 550 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -290 570 0 0 {name=Vphi2b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -290 600 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 290 -40 0 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 -40 2 0 {name=l14 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 310 30 0 0 {name=X1 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 490 -350 2 0 {name=l15 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 90 -350 1 0 {name=l16 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 290 -280 0 0 {name=l17 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 -280 2 0 {name=l18 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 290 -420 0 0 {name=l19 sig_type=std_logic lab=phi1b}
C {Switched_Caps/16switchcaps_2phi.sym} 310 -350 0 0 {name=X2 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 330 -420 2 0 {name=l20 sig_type=std_logic lab=phi2b}
C {sky130_fd_pr/cap_mim_m3_1.sym} 90 -320 0 0 {name=C1 model=cap_mim_m3_1 W=4 L=25 MF=1 spiceprefix=X}
C {devices/gnd.sym} 90 -290 0 0 {name=l21 lab=GND}
C {devices/gnd.sym} -470 430 0 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} -430 370 2 0 {name=l23 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -380 440 2 0 {name=l24 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -320 490 2 0 {name=l25 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} -250 540 2 0 {name=l26 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 970 -190 2 0 {name=l2 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} 810 -120 2 0 {name=l28 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 770 -120 0 0 {name=l29 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 810 -260 2 0 {name=l30 sig_type=std_logic lab=phi1b}
C {Switched_Caps/16switchcaps_2phi.sym} 790 -190 0 0 {name=X3 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 770 -260 0 0 {name=l31 sig_type=std_logic lab=phi2b}
C {sky130_fd_pr/cap_mim_m3_1.sym} 630 -120 0 0 {name=C2 model=cap_mim_m3_1 W=4 L=25 MF=1 spiceprefix=X}
C {devices/gnd.sym} 630 -90 0 0 {name=l32 lab=GND}
C {transmission_gate/transmission_gate.sym} 530 -190 0 0 {name=X4 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 530 -130 1 0 {name=l33 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 530 -250 2 0 {name=l34 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 450 -190 0 0 {name=l27 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 630 -190 1 0 {name=l38 sig_type=std_logic lab=c1}
C {devices/lab_pin.sym} 150 200 0 0 {name=l52 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 290 270 0 0 {name=l53 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 270 2 0 {name=l54 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 290 130 0 0 {name=l55 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 130 2 0 {name=l56 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 310 200 0 0 {name=X8 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 600 270 0 0 {name=l57 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 640 270 2 0 {name=l58 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 600 130 0 0 {name=l59 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 640 130 2 0 {name=l60 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 620 200 0 0 {name=X9 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 800 200 2 0 {name=l61 sig_type=std_logic lab=out16}
C {devices/lab_pin.sym} 150 370 0 0 {name=l73 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 290 440 0 0 {name=l74 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 440 2 0 {name=l75 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 290 300 0 0 {name=l76 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 300 2 0 {name=l77 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 310 370 0 0 {name=X12 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 600 440 0 0 {name=l78 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 640 440 2 0 {name=l79 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 600 300 0 0 {name=l80 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 640 300 2 0 {name=l81 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 620 370 0 0 {name=X13 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 910 440 0 0 {name=l83 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 950 440 2 0 {name=l84 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 910 300 0 0 {name=l85 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 950 300 2 0 {name=l86 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 930 370 0 0 {name=X14 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 1110 370 2 0 {name=l87 sig_type=std_logic lab=out24}
C {devices/lab_pin.sym} 150 540 0 0 {name=l94 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 290 610 0 0 {name=l95 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 610 2 0 {name=l96 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 290 470 0 0 {name=l97 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 470 2 0 {name=l98 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 310 540 0 0 {name=X16 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 600 610 0 0 {name=l99 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 640 610 2 0 {name=l100 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 600 470 0 0 {name=l101 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 640 470 2 0 {name=l102 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 620 540 0 0 {name=X17 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 910 610 0 0 {name=l104 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 950 610 2 0 {name=l105 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 910 470 0 0 {name=l106 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 950 470 2 0 {name=l107 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 930 540 0 0 {name=X18 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 1220 610 0 0 {name=l109 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1260 610 2 0 {name=l110 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 1220 470 0 0 {name=l111 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1260 470 2 0 {name=l112 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 1240 540 0 0 {name=X19 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 1390 540 2 0 {name=l113 sig_type=std_logic lab=out32}
