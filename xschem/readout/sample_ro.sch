v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Reset after every half clock-cycle dealy
to prevent the output bus assume any random 
value when nothing is connected to the bus.} -1576482985 -284837690 0 0 0.4 0.4 {}
T {Octave-3} -1576483105 -284837735 0 0 0.4 0.4 {}
T {Octave-2} -1576483100 -284837955 0 0 0.4 0.4 {}
T {Octave-1} -1576483100 -284838160 0 0 0.4 0.4 {}
T {f=2*2.56MHz
Twice the max frequency of our system.
This was taken to give a half clock-cycle 
delay between different multiplexed outputs.
} -1576484155 -284838340 0 0 0.4 0.4 {}
T {Negative edge triggered D-Flip Flops
Negative Reset pins} -1576483620 -284838015 0 0 0.27 0.27 {}
T {Negative edge triggered D-Flip Flops
Negative Reset pins} -1576483620 -284837750 0 0 0.27 0.27 {}
T {Negative edge triggered D-Flip Flops
Negative Reset pins} -1576483625 -284837525 0 0 0.27 0.27 {}
N -1576483250 -284837890 -1576483250 -284837810 { lab=#net1}
N -1576483170 -284837930 -1576483160 -284837930 { lab=out}
N -1576483160 -284837930 -1576483110 -284837930 { lab=out}
N -1576483250 -284837660 -1576483250 -284837580 { lab=#net2}
N -1576483170 -284837700 -1576483160 -284837700 { lab=out}
N -1576483160 -284837700 -1576483110 -284837700 { lab=out}
N -1576483150 -284838180 -1576483110 -284838180 { lab=out}
N -1576483170 -284838180 -1576483150 -284838180 { lab=out}
N -1576483250 -284838140 -1576483250 -284838080 { lab=#net3}
N -1576483110 -284838180 -1576483110 -284837700 { lab=out}
N -1576483110 -284838180 -1576483040 -284838180 { lab=out}
N -1576483110 -284837700 -1576483110 -284837670 { lab=out}
N -1576483110 -284837610 -1576483110 -284837600 { lab=GND}
N -1576483620 -284838160 -1576483500 -284838160 { lab=in1}
N -1576483320 -284838180 -1576483250 -284838180 { lab=#net4}
N -1576483620 -284837910 -1576483500 -284837910 { lab=in2}
N -1576483320 -284837930 -1576483250 -284837930 { lab=#net5}
N -1576483620 -284837680 -1576483500 -284837680 { lab=in3}
N -1576483320 -284837700 -1576483250 -284837700 { lab=#net6}
C {inv/inv.sym} -1576483300 -284837810 0 0 {name=X2 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {inv/inv.sym} -1576483300 -284837580 0 0 {name=X3 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/vsource.sym} -1576484150 -284837935 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} -1576484150 -284837905 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} -1576484150 -284837965 0 0 {name=l15 lab=VDD}
C {readout/fclk_tree.sym} -1576485370 -284836825 0 0 {name=X4}
C {devices/vdd.sym} -1576483900 -284838035 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -1576483860 -284838035 2 1 {name=l2 lab=GND}
C {devices/lab_pin.sym} -1576484030 -284837660 2 1 {name=l4 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} -1576483950 -284837660 0 0 {name=l5 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} -1576483855 -284837655 0 0 {name=l6 sig_type=std_logic lab=in3}
C {devices/lab_pin.sym} -1576483040 -284838180 2 0 {name=l7 sig_type=std_logic lab=out}
C {sky130_stdcells/dfrtn_1.sym} -1576483440 -284837790 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtn_1.sym} -1576483440 -284837560 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/gnd.sym} -1576483935 -284837770 0 1 {name=l89 lab=GND}
C {devices/vsource.sym} -1576483935 -284837800 0 0 {name=V10 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} -1576483935 -284837830 0 1 {name=l8 sig_type=std_logic lab=clk}
C {devices/gnd.sym} -1576484030 -284837770 0 0 {name=l88 lab=GND}
C {devices/lab_pin.sym} -1576484030 -284837830 0 0 {name=l9 sig_type=std_logic lab=rstb}
C {devices/gnd.sym} -1576484030 -284837600 0 1 {name=l10 lab=GND}
C {devices/gnd.sym} -1576483855 -284837595 0 0 {name=V7 value="DC 0 PULSE(1.2 0 1n 1n 1n \{duty_cycle*1/(4*f)\} \{1/(4*f)\})"
}
C {devices/gnd.sym} -1576483950 -284837600 0 0 {name=V6 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/(2*f)\} \{1/(2*f)\})"
}
C {devices/netlist.sym} -1576482970 -284838220 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560*2k
.param duty_cycle=0.5
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {sky130_stdcells/ebufn_1.sym} -1576483210 -284837930 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/ebufn_1.sym} -1576483210 -284837700 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} -1576483530 -284837810 0 0 {name=l11 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} -1576483530 -284837580 0 0 {name=l12 sig_type=std_logic lab=clk_8}
C {devices/vsource.sym} -1576484030 -284837800 0 1 {name=V9 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {inv/inv.sym} -1576483300 -284838080 0 0 {name=X6 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {sky130_stdcells/dfrtn_1.sym} -1576483440 -284838060 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} -1576483530 -284838080 0 0 {name=l3 sig_type=std_logic lab=clk_2}
C {sky130_stdcells/ebufn_1.sym} -1576483210 -284838180 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_fd_pr/nfet3_01v8.sym} -1576483130 -284837640 0 0 {name=M1
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
C {devices/gnd.sym} -1576483110 -284837600 0 0 {name=V15 value="DC 0 PULSE(1.2 0 1n 1n 1n \{duty_cycle*1/(4*f)\} \{1/(4*f)\})"
}
C {inv/inv.sym} -1576484045 -284837940 3 0 {name=X1 Wpmos=0.42 Lpmos=0.15 Wnmos=0.42 Lnmos=0.15}
C {devices/vsource.sym} -1576484030 -284837630 0 1 {name=V16 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*2/f\} \{2/f\})"}
C {devices/vsource.sym} -1576483950 -284837630 0 0 {name=V3 value=0}
C {devices/vsource.sym} -1576483855 -284837625 0 0 {name=V4 value="DC 0 PULSE(0 1.2 \{3/f+3n\} 1n 1n \{duty_cycle*8/f\} \{8/f\})"}
C {devices/lab_pin.sym} -1576483530 -284837540 0 0 {name=l14 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -1576483820 -284837965 2 0 {name=l16 sig_type=std_logic lab=clk_8}
C {devices/lab_pin.sym} -1576483820 -284837985 2 0 {name=l17 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} -1576483820 -284838005 2 0 {name=l18 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} -1576483820 -284837945 2 0 {name=l19 sig_type=std_logic lab=clk_16}
C {devices/lab_pin.sym} -1576483940 -284838005 0 0 {name=l20 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -1576483530 -284838040 0 0 {name=l21 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -1576483530 -284837770 0 0 {name=l22 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -1576484045 -284837890 3 0 {name=l24 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} -1576484045 -284837990 1 0 {name=l25 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} -1576483150 -284837640 0 0 {name=l26 sig_type=std_logic lab=clkb}
C {devices/lab_pin.sym} -1576483620 -284838160 0 0 {name=l28 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} -1576483530 -284837560 0 0 {name=l29 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -1576483530 -284837790 0 0 {name=l30 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -1576483530 -284838060 0 0 {name=l31 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -1576483940 -284837965 0 0 {name=l32 sig_type=std_logic lab=rstb}
C {sky130_stdcells/dfrtn_1.sym} -1576483410 -284838160 0 0 {name=x7 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} -1576483500 -284838180 0 0 {name=l33 sig_type=std_logic lab=clk_2}
C {devices/lab_pin.sym} -1576483500 -284838140 0 0 {name=l34 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -1576483620 -284837910 0 0 {name=l23 sig_type=std_logic lab=in2}
C {sky130_stdcells/dfrtn_1.sym} -1576483410 -284837910 0 0 {name=x8 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} -1576483500 -284837930 0 0 {name=l27 sig_type=std_logic lab=clk_4}
C {devices/lab_pin.sym} -1576483500 -284837890 0 0 {name=l35 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -1576483620 -284837680 0 0 {name=l36 sig_type=std_logic lab=in3}
C {sky130_stdcells/dfrtn_1.sym} -1576483410 -284837680 0 0 {name=x9 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} -1576483500 -284837700 0 0 {name=l37 sig_type=std_logic lab=clk_8}
C {devices/lab_pin.sym} -1576483500 -284837660 0 0 {name=l38 sig_type=std_logic lab=VDD}
