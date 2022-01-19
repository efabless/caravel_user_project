v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Stay ON through first phi1} -300 80 0 0 0.2 0.2 {}
T {inject charge as .ic} 320 -340 0 0 0.4 0.4 {}
T {180 deg phase shift} -230 330 0 0 0.4 0.4 {}
T {flip hi/lo setting} -160 380 0 0 0.4 0.4 {}
N -160 0 -130 0 { lab=in}
N 150 0 180 0 { lab=out8}
N -460 40 -420 40 { lab=in}
N 20 -70 20 -50 { lab=phi2b}
N 20 50 20 90 { lab=phi2}
N -20 50 -20 90 { lab=phi1}
N -20 -70 -20 -50 { lab=phi1b}
N 410 -280 440 -280 { lab=in2}
N 720 -280 750 -280 { lab=out2}
N 590 -230 590 -190 { lab=phi2}
N 550 -230 550 -190 { lab=phi1}
N 550 -350 550 -330 { lab=phi1b}
N 590 -350 590 -330 { lab=phi2b}
N 410 -280 410 -230 { lab=in2}
N -460 220 -420 220 { lab=phi1b}
N -410 290 -370 290 { lab=phi1}
N -350 340 -310 340 { lab=phi2}
N -280 390 -240 390 { lab=phi2b}
N 330 290 360 290 { lab=c1}
N 640 290 670 290 { lab=out3}
N 470 340 470 380 { lab=phi2}
N 510 340 510 380 { lab=phi1}
N 510 220 510 240 { lab=phi1b}
N 470 220 470 240 { lab=phi2b}
N 330 290 330 340 { lab=c1}
N 230 330 230 390 { lab=phi1}
N 230 230 230 250 { lab=phi1b}
N 280 290 330 290 { lab=c1}
N 150 290 180 290 { lab=in}
N 330 -70 330 -50 { lab=phi2b}
N 330 50 330 90 { lab=phi2}
N 290 50 290 90 { lab=phi1}
N 290 -70 290 -50 { lab=phi1b}
N 460 0 490 0 { lab=out16}
N 640 -70 640 -50 { lab=phi2b}
N 640 50 640 90 { lab=phi2}
N 600 50 600 90 { lab=phi1}
N 600 -70 600 -50 { lab=phi1b}
N 770 0 800 0 { lab=out24}
N 950 -70 950 -50 { lab=phi2b}
N 950 50 950 90 { lab=phi2}
N 910 50 910 90 { lab=phi1}
N 910 -70 910 -50 { lab=phi1b}
C {devices/netlist.sym} -240 -400 0 0 {name=SPICE only_toplevel=false value="
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
C {devices/vsource.sym} -460 70 0 0 {name=Vin value="PULSE (0 input 1n 1n 1n \{(0.25+duty_cycle/2)*1/f\} \{N/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -460 100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 170 0 1 0 {name=l1 sig_type=std_logic lab=out8}
C {devices/lab_pin.sym} -160 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -420 40 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -460 -140 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -460 -110 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -460 -170 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -410 320 0 0 {name=Vphi1 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -410 350 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 90 3 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 90 3 0 {name=l13 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} -460 250 0 0 {name=Vphi1b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/vsource.sym} -350 370 0 0 {name=Vphi2 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -350 400 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -280 420 0 0 {name=Vphi2b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -280 450 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -20 -70 1 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 -70 1 0 {name=l14 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 0 0 0 0 {name=X1 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 750 -280 2 0 {name=l15 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 410 -280 0 0 {name=l16 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 550 -190 3 0 {name=l17 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 590 -190 3 0 {name=l18 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 550 -350 1 0 {name=l19 sig_type=std_logic lab=phi1b}
C {Switched_Caps/16switchcaps_2phi.sym} 570 -280 0 0 {name=X2 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 590 -350 1 0 {name=l20 sig_type=std_logic lab=phi2b}
C {sky130_fd_pr/cap_mim_m3_1.sym} 410 -200 0 0 {name=C1 model=cap_mim_m3_1 W=4 L=25 MF=1 spiceprefix=X}
C {devices/gnd.sym} 410 -170 0 0 {name=l21 lab=GND}
C {devices/gnd.sym} -460 280 0 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} -420 220 2 0 {name=l23 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -370 290 2 0 {name=l24 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} -310 340 2 0 {name=l25 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} -240 390 2 0 {name=l26 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 670 290 2 0 {name=l2 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} 510 380 3 0 {name=l28 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 470 380 3 0 {name=l29 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 510 220 1 0 {name=l30 sig_type=std_logic lab=phi1b}
C {Switched_Caps/16switchcaps_2phi.sym} 490 290 0 0 {name=X3 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 470 220 1 0 {name=l31 sig_type=std_logic lab=phi2b}
C {sky130_fd_pr/cap_mim_m3_1.sym} 330 370 0 0 {name=C2 model=cap_mim_m3_1 W=4 L=25 MF=1 spiceprefix=X}
C {devices/gnd.sym} 330 400 0 0 {name=l32 lab=GND}
C {transmission_gate/transmission_gate.sym} 230 290 0 0 {name=X4 Wpmos=0.42 Lpmos=0.18 Wnmos=0.42 Lnmos=0.18}
C {devices/lab_pin.sym} 230 390 3 0 {name=l33 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 230 230 1 0 {name=l34 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 150 290 0 0 {name=l27 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 330 290 1 0 {name=l38 sig_type=std_logic lab=c1}
C {devices/lab_pin.sym} 290 90 3 0 {name=l35 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 90 3 0 {name=l36 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 290 -70 1 0 {name=l37 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 330 -70 1 0 {name=l39 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 310 0 0 0 {name=X5 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 480 0 1 0 {name=l41 sig_type=std_logic lab=out16}
C {devices/lab_pin.sym} 600 90 3 0 {name=l42 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 640 90 3 0 {name=l43 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 600 -70 1 0 {name=l44 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 640 -70 1 0 {name=l45 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 620 0 0 0 {name=X6 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 790 0 1 0 {name=l47 sig_type=std_logic lab=out24}
C {devices/lab_pin.sym} 910 90 3 0 {name=l48 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 950 90 3 0 {name=l49 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 910 -70 1 0 {name=l50 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 950 -70 1 0 {name=l51 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 930 0 0 0 {name=X7 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 1080 0 2 0 {name=l40 sig_type=std_logic lab=out32}
