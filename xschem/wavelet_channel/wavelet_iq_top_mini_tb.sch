v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO generation} 630 -505 3 0 0.4 0.4 {}
T {Phi1/Phi2/Div2 generation} 1050 -455 3 0 0.4 0.4 {}
N 1070 -915 1120 -915 { lab=opi}
N 1070 -895 1120 -895 { lab=omi}
N 1070 -855 1120 -855 { lab=opq}
N 1070 -835 1120 -835 { lab=omq}
N 940 -805 940 -675 { lab=loq}
N 375 -425 860 -425 { lab=fclk}
N 960 -545 970 -545 { lab=phi1}
N 970 -805 970 -545 { lab=phi1}
N 960 -505 1010 -505 { lab=phi2}
N 1010 -805 1010 -505 { lab=phi2}
N 960 -525 990 -525 { lab=phi1b}
N 990 -805 990 -525 { lab=phi1b}
N 960 -485 1030 -485 { lab=#net1}
N 1030 -805 1030 -485 { lab=#net1}
N 960 -425 1120 -425 { lab=fclkdiv2}
N 670 -765 900 -765 { lab=loi}
N 900 -805 900 -765 { lab=loi}
N 670 -765 670 -340 { lab=loi}
N 660 -240 660 -200 { lab=EN}
N 565 -200 660 -200 { lab=EN}
N 682.5 -240 682.5 -160 { lab=RSTb}
N 492.5 -160 682.5 -160 { lab=RSTb}
N 382.5 -120 702.5 -120 { lab=mclk}
N 375 -745 425 -745 { lab=EN}
N 375 -625 425 -625 { lab=RSTb}
N 375 -525 425 -525 { lab=Vmid}
N 835 -465 835 -445 { lab=Vmid}
N 835 -445 860 -445 { lab=Vmid}
N 815 -465 860 -465 { lab=Vmid}
N 815 -545 860 -545 { lab=RSTb}
N 960 -465 980 -465 { lab=cclk}
N 960 -445 980 -445 { lab=cclkb}
N 702.5 -240 702.5 -120 { lab=mclk}
N 670 -340 670 -330 { lab=loi}
N 700 -672.5 700 -330 { lab=loq}
N 700 -675 940 -675 { lab=loq}
N 700 -675 700 -672.5 { lab=loq}
N 815 -895 885 -895 { lab=inp}
N 815 -855 885 -855 { lab=inm}
C {devices/netlist.sym} 1310 -845 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param ftest = 10k
.param Atest = 0.3
.param mclk=\{256*ftest\}
.param m_dc = 0.5
* ratio of phi / lo clk:
.param ratio_fm = 1
.param f_dc = 0.5
.param fclk = \{mclk*ratio_fm\}
.param tau=\{1/4000\}
.param tend=\{tau\}
*start all caps with 0 charge:
*.ic included in cap symbols
.tran 1u \{tend\}
.save all
"}
C {devices/lab_pin.sym} 1120 -915 2 0 {name=l1 sig_type=std_logic lab=opi}
C {devices/lab_pin.sym} 815 -895 0 0 {name=l5 sig_type=std_logic lab=inp}
C {devices/vsource.sym} 372.5 -827.5 0 0 {name=VDD value="DC 1.2"}
C {devices/vdd.sym} 372.5 -857.5 0 0 {name=l7 lab=VDD}
C {devices/lab_pin.sym} 1120 -895 2 0 {name=l2 sig_type=std_logic lab=omi}
C {devices/lab_pin.sym} 1120 -855 2 0 {name=l9 sig_type=std_logic lab=opq}
C {devices/lab_pin.sym} 1120 -835 2 0 {name=l14 sig_type=std_logic lab=omq}
C {devices/lab_pin.sym} 815 -855 0 0 {name=l11 sig_type=std_logic lab=inm}
C {devices/vsource.sym} 375 -395 0 0 {name=Vphi value="DC 0 PULSE (0 1.2 1n 1n 1n \{f_dc*1/fclk\} \{1/fclk\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 375 -365 0 0 {name=l31 lab=GND}
C {devices/gnd.sym} 372.5 -797.5 0 0 {name=l38 lab=GND}
C {devices/lab_pin.sym} 900 -775 0 0 {name=l13 sig_type=std_logic lab=loi}
C {devices/lab_pin.sym} 940 -685 0 0 {name=l15 sig_type=std_logic lab=loq}
C {devices/lab_pin.sym} 960 -545 1 0 {name=l17 sig_type=std_logic lab=phi1}
C {wavelet_channel/wavelet_iq.sym} 1000 -875 0 0 {name=X1 W=20 L=20}
C {clkgen/filter_clkgen.sym} 910 -485 0 0 {name=X2}
C {devices/lab_pin.sym} 1000 -505 1 0 {name=l6 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} 375 -715 0 0 {name=Ven value=1.2}
C {devices/gnd.sym} 375 -685 0 0 {name=l85 lab=GND}
C {devices/lab_pin.sym} 565 -200 0 0 {name=l86 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 492.5 -160 0 0 {name=l87 sig_type=std_logic lab=RSTb}
C {devices/vsource.sym} 375 -595 0 0 {name=Vrstb value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {devices/gnd.sym} 375 -565 0 0 {name=l88 lab=GND}
C {devices/lab_pin.sym} 382.5 -120 0 0 {name=l90 sig_type=std_logic lab=mclk}
C {devices/lab_pin.sym} 425 -745 2 0 {name=l8 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 425 -625 2 0 {name=l16 sig_type=std_logic lab=RSTb}
C {devices/lab_pin.sym} 375 -425 0 0 {name=l44 sig_type=std_logic lab=fclk}
C {devices/vsource.sym} 375 -495 0 0 {name=Vmid value=0.6}
C {devices/gnd.sym} 375 -465 0 0 {name=l45 lab=GND}
C {devices/lab_pin.sym} 425 -525 2 0 {name=l46 sig_type=std_logic lab=Vmid}
C {devices/lab_pin.sym} 815 -465 0 0 {name=l47 sig_type=std_logic lab=Vmid}
C {devices/lab_pin.sym} 815 -545 0 0 {name=l48 sig_type=std_logic lab=RSTb}
C {devices/lab_pin.sym} 1120 -425 2 0 {name=l49 sig_type=std_logic lab=fclkdiv2}
C {devices/vsource.sym} 375 -295 0 1 {name=Vmclk value="DC 0 PULSE (0 1.2 \{1/2/mclk\} 1n 1n \{m_dc*1/mclk\} \{1/mclk\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 375 -265 0 0 {name=l50 lab=GND}
C {devices/lab_pin.sym} 375 -325 0 0 {name=l51 sig_type=std_logic lab=mclk}
C {Sinusoid_generator/sinusoid_generator.sym} -8355 3615 3 0 {name=X3}
C {devices/lab_pin.sym} 980 -465 2 0 {name=l10 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 980 -445 2 0 {name=l12 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 970 -955 1 0 {name=l18 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 990 -955 1 0 {name=l19 sig_type=std_logic lab=cclkb}
C {devices/vsource.sym} 375 -985 0 0 {name=Vthresh2 value=0.25}
C {devices/gnd.sym} 375 -955 0 0 {name=l20 lab=GND}
C {devices/vsource.sym} 375 -1095 0 0 {name=Vthresh1 value=0.1}
C {devices/gnd.sym} 375 -1065 0 0 {name=l21 lab=GND}
C {devices/vsource.sym} 515 -985 0 0 {name=Vinp1 value="DC 0 SIN(0 0.1 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 515 -895 0 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} 515 -1015 0 0 {name=l23 sig_type=std_logic lab=inp}
C {devices/vsource.sym} 515 -925 0 0 {name=Vinp2 value="DC 0 SIN(0.7 0.1 14k)"
*SIN (0.6 0.6 1k)"}
C {devices/vsource.sym} 515 -805 0 0 {name=Vinm1 value="DC 0 SIN(0 -0.1 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 515 -715 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} 515 -835 0 0 {name=l30 sig_type=std_logic lab=inm}
C {devices/vsource.sym} 515 -745 0 0 {name=Vinm2 value="DC 0 SIN(0.5 -0.1 14k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} 375 -1125 0 0 {name=l3 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 375 -1015 0 0 {name=l4 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 1010 -955 1 0 {name=l24 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 1030 -955 1 0 {name=l25 sig_type=std_logic lab=thresh2}
C {comparator/comparator_out.sym} 1115 -955 0 0 {name=x1}
C {devices/lab_pin.sym} 1205 -1055 0 0 {name=l26 sig_type=std_logic lab=opi}
C {devices/lab_pin.sym} 1205 -995 0 0 {name=l27 sig_type=std_logic lab=omi}
C {devices/lab_pin.sym} 1325 -915 3 0 {name=l29 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 1325 -1155 1 0 {name=l32 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 980 -525 1 0 {name=l33 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 1435 -1055 2 0 {name=l34 sig_type=std_logic lab=polxev}
C {devices/lab_pin.sym} 1435 -1025 2 0 {name=l35 sig_type=std_logic lab=pol}
C {devices/lab_pin.sym} 1435 -995 2 0 {name=l36 sig_type=std_logic lab=ev}
C {devices/lab_pin.sym} 1435 -1075 2 0 {name=l37 sig_type=std_logic lab=compout}
C {devices/lab_pin.sym} 1435 -975 2 0 {name=l39 sig_type=std_logic lab=latch}
