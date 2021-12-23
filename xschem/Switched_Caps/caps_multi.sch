v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1160 -890 1200 -890 { lab=in}
N 940 -1020 940 -980 { lab=P1}
N 1000 -1010 1000 -990 { lab=P1}
N 940 -990 1000 -990 { lab=P1}
N 1000 -1140 1000 -1110 { lab=P2}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1540 -1030 0 0 {name=C1 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 1490 -1060 0 0 {name=X1 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1640 -1030 0 0 {name=C2 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 1590 -1060 0 0 {name=X2 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/netlist.sym} 1720 -1440 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2.56M
.param duty_cycle=0.5
.param tau=\{(16^2)*1/f\}
.param tend=\{4*tau\}

*start all caps with 0 charge
.ic v(a)=0 v(b)=0 v(c)=0 v(d)=0 
+ v(e)=0 v(f)=0 v(g)=0 v(h)=0 
+ v(i)=0 v(j)=0 v(k)=0 v(l)=0 
+ v(m)=0 v(n)=0 v(o)=0 v(p)=0

*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{tend\}
.save all
"}
C {devices/vsource.sym} 1160 -860 0 0 {name=Vin1 value="DC 0 PULSE (0 \{100u * f\} 1n 1n 1n \{2*duty_cycle*1/f\} \{tend\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 1160 -830 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 1200 -890 2 0 {name=l2 sig_type=std_logic lab=in}
C {devices/vsource.sym} 1160 -1070 0 0 {name=VDD2 value="DC 1.2"}
C {devices/gnd.sym} 1160 -1040 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 1160 -1100 0 0 {name=l8 lab=VDD}
C {devices/vsource.sym} 940 -950 0 0 {name=Vphi_clk3 value="DC 0 PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {/home/sky/Desktop/fossi_cochlea/xschem/inv/inv_set.sym} 1000 -1060 3 0 {name=X3 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 1000 -1140 0 0 {name=l3 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 940 -1020 0 0 {name=l5 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 1440 -1060 0 0 {name=l6 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 1490 -1100 0 0 {name=l7 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 1490 -1020 0 0 {name=l10 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 1590 -1100 0 0 {name=l11 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 1590 -1020 0 0 {name=l9 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 1540 -1000 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} 1640 -1000 0 0 {name=l13 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1740 -1030 0 0 {name=C3 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 1690 -1060 0 0 {name=X4 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1840 -1030 0 0 {name=C4 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 1790 -1060 0 0 {name=X5 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 1690 -1100 0 0 {name=l14 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 1690 -1020 0 0 {name=l15 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 1790 -1100 0 0 {name=l16 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 1790 -1020 0 0 {name=l17 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 1740 -1000 0 0 {name=l18 lab=GND}
C {devices/gnd.sym} 1840 -1000 0 0 {name=l19 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1940 -1030 0 0 {name=C5 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 1890 -1060 0 0 {name=X6 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2040 -1030 0 0 {name=C6 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 1990 -1060 0 0 {name=X7 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 1890 -1100 0 0 {name=l20 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 1890 -1020 0 0 {name=l21 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 1990 -1100 0 0 {name=l22 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 1990 -1020 0 0 {name=l23 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 1940 -1000 0 0 {name=l24 lab=GND}
C {devices/gnd.sym} 2040 -1000 0 0 {name=l25 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2140 -1030 0 0 {name=C7 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2090 -1060 0 0 {name=X8 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2240 -1030 0 0 {name=C8 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2190 -1060 0 0 {name=X9 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 2090 -1100 0 0 {name=l26 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 2090 -1020 0 0 {name=l27 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2190 -1100 0 0 {name=l28 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2190 -1020 0 0 {name=l29 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 2140 -1000 0 0 {name=l30 lab=GND}
C {devices/gnd.sym} 2240 -1000 0 0 {name=l31 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2340 -1030 0 0 {name=C9 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2290 -1060 0 0 {name=X10 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2440 -1030 0 0 {name=C10 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2390 -1060 0 0 {name=X11 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 2290 -1100 0 0 {name=l32 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 2290 -1020 0 0 {name=l33 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2390 -1100 0 0 {name=l34 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2390 -1020 0 0 {name=l35 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 2340 -1000 0 0 {name=l36 lab=GND}
C {devices/gnd.sym} 2440 -1000 0 0 {name=l37 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2540 -1030 0 0 {name=C11 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2490 -1060 0 0 {name=X12 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2640 -1030 0 0 {name=C12 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2590 -1060 0 0 {name=X13 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 2490 -1100 0 0 {name=l38 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 2490 -1020 0 0 {name=l39 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2590 -1100 0 0 {name=l40 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2590 -1020 0 0 {name=l41 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 2540 -1000 0 0 {name=l42 lab=GND}
C {devices/gnd.sym} 2640 -1000 0 0 {name=l43 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2740 -1030 0 0 {name=C13 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2690 -1060 0 0 {name=X14 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2840 -1030 0 0 {name=C14 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2790 -1060 0 0 {name=X15 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 2690 -1100 0 0 {name=l44 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 2690 -1020 0 0 {name=l45 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2790 -1100 0 0 {name=l46 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2790 -1020 0 0 {name=l47 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 2740 -1000 0 0 {name=l48 lab=GND}
C {devices/gnd.sym} 2840 -1000 0 0 {name=l49 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 2940 -1030 0 0 {name=C15 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2890 -1060 0 0 {name=X16 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {sky130_fd_pr/cap_mim_m3_1.sym} 3040 -1030 0 0 {name=C16 model=cap_mim_m3_1 W=5 L=10 MF=1 spiceprefix=X}
C {/home/sky/Desktop/fossi_cochlea/xschem/transmission_gate/transmission_gate_set.sym} 2990 -1060 0 0 {name=X17 Wpmos=1 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/lab_pin.sym} 2890 -1100 0 0 {name=l50 sig_type=std_logic lab=P1}
C {devices/lab_pin.sym} 2890 -1020 0 0 {name=l51 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2990 -1100 0 0 {name=l52 sig_type=std_logic lab=P2}
C {devices/lab_pin.sym} 2990 -1020 0 0 {name=l53 sig_type=std_logic lab=P1}
C {devices/gnd.sym} 2940 -1000 0 0 {name=l54 lab=GND}
C {devices/gnd.sym} 3040 -1000 0 0 {name=l55 lab=GND}
C {devices/lab_pin.sym} 3040 -1060 2 0 {name=l56 sig_type=std_logic lab=p}
C {devices/lab_pin.sym} 1540 -1060 1 0 {name=l57 sig_type=std_logic lab=a}
C {devices/lab_pin.sym} 1640 -1060 1 0 {name=l58 sig_type=std_logic lab=b}
C {devices/lab_pin.sym} 1740 -1060 1 0 {name=l59 sig_type=std_logic lab=c}
C {devices/lab_pin.sym} 1840 -1060 1 0 {name=l60 sig_type=std_logic lab=d}
C {devices/lab_pin.sym} 1940 -1060 1 0 {name=l61 sig_type=std_logic lab=e}
C {devices/lab_pin.sym} 2040 -1060 1 0 {name=l62 sig_type=std_logic lab=f}
C {devices/lab_pin.sym} 2140 -1060 1 0 {name=l63 sig_type=std_logic lab=g}
C {devices/lab_pin.sym} 2240 -1060 1 0 {name=l64 sig_type=std_logic lab=h}
C {devices/lab_pin.sym} 2340 -1060 1 0 {name=l65 sig_type=std_logic lab=i}
C {devices/lab_pin.sym} 2440 -1060 1 0 {name=l66 sig_type=std_logic lab=j}
C {devices/lab_pin.sym} 2540 -1060 1 0 {name=l67 sig_type=std_logic lab=k}
C {devices/lab_pin.sym} 2640 -1060 1 0 {name=l68 sig_type=std_logic lab=l}
C {devices/lab_pin.sym} 2740 -1060 1 0 {name=l69 sig_type=std_logic lab=m}
C {devices/lab_pin.sym} 2840 -1060 1 0 {name=l70 sig_type=std_logic lab=n}
C {devices/lab_pin.sym} 2940 -1060 1 0 {name=l71 sig_type=std_logic lab=o}
C {devices/gnd.sym} 940 -920 0 0 {name=l72 lab=GND}
