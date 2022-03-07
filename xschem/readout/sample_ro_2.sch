v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Octave-3} 3835 -415 0 0 0.4 0.4 {}
T {Octave-2} 3830 -495 0 0 0.4 0.4 {}
T {Octave-1} 3830 -550 0 0 0.4 0.4 {}
T {Octave-4} 3835 -335 0 0 0.4 0.4 {}
T {Octave-5} 3835 -255 0 0 0.4 0.4 {}
T {Octave-6} 3835 -175 0 0 0.4 0.4 {}
T {Octave-7} 3835 -105 0 0 0.4 0.4 {}
T {Octave-8} 3835 -25 0 0 0.4 0.4 {}
N 3760 -480 3770 -480 { lab=#net1}
N 3770 -480 3820 -480 { lab=#net1}
N 3760 -400 3770 -400 { lab=#net1}
N 3770 -400 3820 -400 { lab=#net1}
N 3780 -560 3820 -560 { lab=#net1}
N 3760 -560 3780 -560 { lab=#net1}
N 3820 -560 3820 -80 { lab=#net1}
N 3820 -560 3890 -560 { lab=#net1}
N 3490 -560 3610 -560 { lab=in1}
N 3610 -560 3680 -560 { lab=in1}
N 3490 -480 3610 -480 { lab=in2}
N 3610 -480 3680 -480 { lab=in2}
N 3490 -400 3610 -400 { lab=in3}
N 3610 -400 3680 -400 { lab=in3}
N 3760 -240 3770 -240 { lab=#net1}
N 3770 -240 3820 -240 { lab=#net1}
N 3760 -160 3770 -160 { lab=#net1}
N 3770 -160 3820 -160 { lab=#net1}
N 3780 -320 3820 -320 { lab=#net1}
N 3760 -320 3780 -320 { lab=#net1}
N 3490 -320 3610 -320 { lab=in4}
N 3610 -320 3680 -320 { lab=in4}
N 3490 -240 3610 -240 { lab=in5}
N 3610 -240 3680 -240 { lab=in5}
N 3490 -160 3610 -160 { lab=in6}
N 3610 -160 3680 -160 { lab=in6}
N 3760 -80 3770 -80 { lab=#net1}
N 3770 -80 3820 -80 { lab=#net1}
N 3760 0 3770 0 { lab=#net1}
N 3770 0 3820 0 { lab=#net1}
N 3490 -80 3610 -80 { lab=in7}
N 3610 -80 3680 -80 { lab=in7}
N 3490 0 3610 0 { lab=in8}
N 3610 0 3680 0 { lab=in8}
N 3820 -80 3820 0 { lab=#net1}
C {devices/vsource.sym} 1930 -650 0 0 {name=V2 value=1.2}
C {devices/vdd.sym} 1930 -680 0 0 {name=l15 lab=VDD}
C {devices/vdd.sym} 2080 -525 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 2120 -525 2 1 {name=l2 lab=GND}
C {devices/lab_pin.sym} 1950 -150 2 1 {name=l4 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 2030 -150 0 0 {name=l5 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 2125 -145 0 0 {name=l6 sig_type=std_logic lab=in3}
C {devices/lab_pin.sym} 4010 -580 2 0 {name=l7 sig_type=std_logic lab=out}
C {devices/gnd.sym} 2045 -260 0 1 {name=l89 lab=GND}
C {devices/vsource.sym} 2045 -290 0 0 {name=V10 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 2045 -320 0 1 {name=l8 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 1950 -260 0 0 {name=l88 lab=GND}
C {devices/lab_pin.sym} 1950 -320 0 0 {name=l9 sig_type=std_logic lab=rstb}
C {devices/gnd.sym} 1950 -90 0 1 {name=l10 lab=GND}
C {devices/gnd.sym} 2125 -85 0 0 {name=V7 value="DC 0 PULSE(1.2 0 1n 1n 1n \{duty_cycle*1/(4*f)\} \{1/(4*f)\})"
}
C {devices/gnd.sym} 2030 -90 0 0 {name=V6 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/(2*f)\} \{1/(2*f)\})"
}
C {devices/netlist.sym} 3460 -820 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560*2k
.param duty_cycle=0.5
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {sky130_stdcells/ebufn_1.sym} 3720 -480 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} 3720 -400 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/vsource.sym} 1950 -290 0 1 {name=V9 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {sky130_stdcells/ebufn_1.sym} 3720 -560 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {inv/inv.sym} 3050 -625 0 0 {name=X1 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/vsource.sym} 1950 -120 0 1 {name=V16 value="DC 0 PULSE(0 1.2 \{3/f\} 1n 1n \{duty_cycle*2/f\} \{2/f\})"}
C {devices/vsource.sym} 2030 -120 0 0 {name=V3 value=0}
C {devices/vsource.sym} 2125 -115 0 0 {name=V4 value="DC 0 PULSE(0 1.2 \{3/f+3n\} 1n 1n \{duty_cycle*8/f\} \{8/f\})"}
C {devices/lab_pin.sym} 2160 -455 2 0 {name=l16 sig_type=std_logic lab=clk_8}
C {devices/lab_pin.sym} 2160 -475 2 0 {name=l17 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} 2160 -495 2 0 {name=l18 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2160 -435 2 0 {name=l19 sig_type=std_logic lab=clk_16}
C {devices/lab_pin.sym} 2040 -495 0 0 {name=l20 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 3000 -625 0 0 {name=l24 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 3100 -625 2 0 {name=l25 sig_type=std_logic lab=ctr1}
C {devices/lab_pin.sym} 3490 -560 0 0 {name=l28 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 2040 -455 0 0 {name=l32 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 3490 -480 0 0 {name=l23 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 3490 -400 0 0 {name=l36 sig_type=std_logic lab=in3}
C {devices/lab_pin.sym} 2290 -875 0 0 {name=l3 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} 2290 -855 0 0 {name=l22 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2395 -865 2 0 {name=l31 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} 3680 -520 0 0 {name=l35 sig_type=std_logic lab=ctr1}
C {devices/lab_pin.sym} 3680 -440 0 0 {name=l37 sig_type=std_logic lab=ctr2}
C {devices/lab_pin.sym} 3680 -360 0 0 {name=l38 sig_type=std_logic lab=ctr3}
C {inv/inv.sym} 2620 -870 0 0 {name=X6 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/lab_pin.sym} 2570 -870 0 0 {name=l39 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} 2670 -870 2 0 {name=l40 sig_type=std_logic lab=clk_2b}
C {inv/inv.sym} 2620 -800 0 0 {name=X7 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/lab_pin.sym} 2570 -800 0 0 {name=l41 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} 2670 -800 2 0 {name=l42 sig_type=std_logic lab=clk_4b}
C {and_set/and_2.sym} -435 -55 0 0 {name=X8}
C {sky130_stdcells/ebufn_1.sym} 3720 -240 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} 3720 -160 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} 3720 -320 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 3490 -320 0 0 {name=l11 sig_type=std_logic lab=in4}
C {devices/lab_pin.sym} 3490 -240 0 0 {name=l12 sig_type=std_logic lab=in5}
C {devices/lab_pin.sym} 3490 -160 0 0 {name=l14 sig_type=std_logic lab=in6}
C {devices/lab_pin.sym} 3680 -280 0 0 {name=l21 sig_type=std_logic lab=ctr4}
C {devices/lab_pin.sym} 3680 -200 0 0 {name=l26 sig_type=std_logic lab=ctr5}
C {devices/lab_pin.sym} 3680 -120 0 0 {name=l27 sig_type=std_logic lab=ctr6}
C {sky130_stdcells/ebufn_1.sym} 3720 -80 0 0 {name=x7 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} 3720 0 0 0 {name=x8 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 3490 -80 0 0 {name=l29 sig_type=std_logic lab=in7}
C {devices/lab_pin.sym} 3490 0 0 0 {name=l30 sig_type=std_logic lab=in8}
C {devices/lab_pin.sym} 3680 -40 0 0 {name=l33 sig_type=std_logic lab=ctr7}
C {devices/lab_pin.sym} 3680 40 0 0 {name=l34 sig_type=std_logic lab=ctr8}
C {sky130_stdcells/and2_1.sym} 4210 -290 0 0 {name=x10 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and3_1.sym} 4210 -150 0 0 {name=x9 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and4_1.sym} 4220 0 0 0 {name=x11 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 3950 -580 0 0 {name=x13 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 3890 -600 0 0 {name=l43 sig_type=std_logic lab=rstb}
C {sky130_stdcells/dfrtn_1.sym} 3040 -550 0 0 {name=x14 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3040 -440 0 0 {name=x15 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3040 -350 0 0 {name=x16 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3040 -250 0 0 {name=x17 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3040 -150 0 0 {name=x18 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3040 -50 0 0 {name=x19 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} 3040 40 0 0 {name=x20 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 2950 -570 0 0 {name=l13 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2950 -460 0 0 {name=l44 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2950 -370 0 0 {name=l45 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2950 -270 0 0 {name=l46 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2950 -170 0 0 {name=l47 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2950 -70 0 0 {name=l48 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 2950 20 0 0 {name=l49 sig_type=std_logic lab=clk}
C {inv/inv.sym} 3180 -570 0 0 {name=X2 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} 3180 -460 0 0 {name=X3 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} 3180 -370 0 0 {name=X4 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} 3180 -270 0 0 {name=X5 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} 3180 -170 0 0 {name=X9 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} 3180 -70 0 0 {name=X10 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} 3180 20 0 0 {name=X11 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/lab_pin.sym} 3230 -570 2 0 {name=l50 sig_type=std_logic lab=ctr2}
C {devices/lab_pin.sym} 3230 -460 2 0 {name=l51 sig_type=std_logic lab=ctr3}
C {devices/lab_pin.sym} 3230 -370 2 0 {name=l52 sig_type=std_logic lab=ctr4}
C {devices/lab_pin.sym} 3230 -270 2 0 {name=l53 sig_type=std_logic lab=ctr5}
C {devices/lab_pin.sym} 3230 -170 2 0 {name=l54 sig_type=std_logic lab=ctr6}
C {devices/lab_pin.sym} 3230 -70 2 0 {name=l55 sig_type=std_logic lab=ctr7}
C {devices/lab_pin.sym} 3230 20 2 0 {name=l56 sig_type=std_logic lab=ctr8}
