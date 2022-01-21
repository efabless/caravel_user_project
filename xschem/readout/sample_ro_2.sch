v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Reset after every half clock-cycle dealy
to prevent the output bus assume any random 
value when nothing is connected to the bus.} 3685 -230 0 0 0.4 0.4 {}
T {Octave-3} 3565 -275 0 0 0.4 0.4 {}
T {Octave-2} 3570 -495 0 0 0.4 0.4 {}
T {Octave-1} 3570 -700 0 0 0.4 0.4 {}
T {f=2*2.56MHz
Twice the max frequency of our system.
This was taken to give a half clock-cycle 
delay between different multiplexed outputs.
} 3200 -940 0 0 0.4 0.4 {}
N 3500 -470 3510 -470 { lab=out}
N 3510 -470 3560 -470 { lab=out}
N 3500 -240 3510 -240 { lab=out}
N 3510 -240 3560 -240 { lab=out}
N 3520 -720 3560 -720 { lab=out}
N 3500 -720 3520 -720 { lab=out}
N 3560 -720 3560 -240 { lab=out}
N 3560 -720 3630 -720 { lab=out}
N 3560 -240 3560 -210 { lab=out}
N 3560 -150 3560 -140 { lab=GND}
N 3230 -720 3350 -720 { lab=in1}
N 3350 -720 3420 -720 { lab=in1}
N 3230 -470 3350 -470 { lab=in2}
N 3350 -470 3420 -470 { lab=in2}
N 3230 -240 3350 -240 { lab=in3}
N 3350 -240 3420 -240 { lab=in3}
C {devices/vsource.sym} 2620 -700 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 2620 -670 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 2620 -730 0 0 {name=l15 lab=VDD}
C {readout/fclk_tree.sym} 1300 635 0 0 {name=X4}
C {devices/vdd.sym} 2770 -575 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 2810 -575 2 1 {name=l2 lab=GND}
C {devices/lab_pin.sym} 2640 -200 2 1 {name=l4 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 2720 -200 0 0 {name=l5 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 2815 -195 0 0 {name=l6 sig_type=std_logic lab=in3}
C {devices/lab_pin.sym} 3630 -720 2 0 {name=l7 sig_type=std_logic lab=out}
C {devices/gnd.sym} 2735 -310 0 1 {name=l89 lab=GND}
C {devices/vsource.sym} 2735 -340 0 0 {name=V10 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 2735 -370 0 1 {name=l8 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 2640 -310 0 0 {name=l88 lab=GND}
C {devices/lab_pin.sym} 2640 -370 0 0 {name=l9 sig_type=std_logic lab=rstb}
C {devices/gnd.sym} 2640 -140 0 1 {name=l10 lab=GND}
C {devices/gnd.sym} 2815 -135 0 0 {name=V7 value="DC 0 PULSE(1.2 0 1n 1n 1n \{duty_cycle*1/(4*f)\} \{1/(4*f)\})"
}
C {devices/gnd.sym} 2720 -140 0 0 {name=V6 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/(2*f)\} \{1/(2*f)\})"
}
C {devices/netlist.sym} 3700 -760 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560*2k
.param duty_cycle=0.5
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {sky130_stdcells/ebufn_1.sym} 3460 -470 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} 3460 -240 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/vsource.sym} 2640 -340 0 1 {name=V9 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {sky130_stdcells/ebufn_1.sym} 3460 -720 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_fd_pr/nfet3_01v8.sym} 3540 -180 0 0 {name=M1
L=0.15
W=0.42
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 3560 -140 0 0 {name=V15 value="DC 0 PULSE(1.2 0 1n 1n 1n \{duty_cycle*1/(4*f)\} \{1/(4*f)\})"
}
C {inv/inv.sym} 2425 -490 3 0 {name=X1 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/vsource.sym} 2640 -170 0 1 {name=V16 value="DC 0 PULSE(0 1.2 \{3/f\} 1n 1n \{duty_cycle*2/f\} \{2/f\})"}
C {devices/vsource.sym} 2720 -170 0 0 {name=V3 value=0}
C {devices/vsource.sym} 2815 -165 0 0 {name=V4 value="DC 0 PULSE(0 1.2 \{3/f+3n\} 1n 1n \{duty_cycle*8/f\} \{8/f\})"}
C {devices/lab_pin.sym} 2850 -505 2 0 {name=l16 sig_type=std_logic lab=clk_8}
C {devices/lab_pin.sym} 2850 -525 2 0 {name=l17 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} 2850 -545 2 0 {name=l18 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2850 -485 2 0 {name=l19 sig_type=std_logic lab=clk_16}
C {devices/lab_pin.sym} 2730 -545 0 0 {name=l20 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2425 -440 3 0 {name=l24 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2425 -540 1 0 {name=l25 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 3520 -180 0 0 {name=l26 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 3230 -720 0 0 {name=l28 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 2730 -505 0 0 {name=l32 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 3230 -470 0 0 {name=l23 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 3230 -240 0 0 {name=l36 sig_type=std_logic lab=in3}
C {devices/lab_pin.sym} 2860 -1005 0 0 {name=l3 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 2855 -905 0 0 {name=l11 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 2855 -790 0 0 {name=l12 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 2855 -770 0 0 {name=l14 sig_type=std_logic lab=clk_2b}
C {devices/lab_pin.sym} 2855 -885 0 0 {name=l21 sig_type=std_logic lab=clk_2b}
C {devices/lab_pin.sym} 2860 -985 0 0 {name=l22 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2855 -865 0 0 {name=l27 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} 2855 -750 0 0 {name=l29 sig_type=std_logic lab=clk_4b}
C {devices/lab_pin.sym} 2855 -730 0 0 {name=l30 sig_type=std_logic lab=clk_8}
C {devices/lab_pin.sym} 2965 -995 2 0 {name=l31 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 2985 -885 2 0 {name=l33 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 3010 -760 2 0 {name=l34 sig_type=std_logic lab=out3}
C {devices/lab_pin.sym} 3420 -680 0 0 {name=l35 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 3420 -430 0 0 {name=l37 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 3420 -200 0 0 {name=l38 sig_type=std_logic lab=out3}
C {inv/inv.sym} 2510 -490 3 0 {name=X6 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/lab_pin.sym} 2510 -440 3 0 {name=l39 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2510 -540 1 0 {name=l40 sig_type=std_logic lab=clk_2b}
C {inv/inv.sym} 2580 -490 3 0 {name=X7 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/lab_pin.sym} 2580 -440 3 0 {name=l41 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} 2580 -540 1 0 {name=l42 sig_type=std_logic lab=clk_4b}
C {and_set/and_2.sym} 135 -185 0 0 {name=X8}
C {and_set/and_3.sym} 275 -25 0 0 {name=X2}
C {and_set/and_4.sym} 195 50 0 0 {name=X3}
