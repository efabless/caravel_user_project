v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO generation} 95 920 3 0 0.4 0.4 {}
T {Phi1/Phi2/Div2 generation} 515 970 3 0 0.4 0.4 {}
N 535 510 585 510 { lab=opi}
N 535 530 585 530 { lab=omi}
N 535 570 585 570 { lab=opq}
N 535 590 585 590 { lab=omq}
N 405 620 405 750 { lab=loq}
N -160 1000 325 1000 { lab=fclk}
N 425 880 435 880 { lab=phi1}
N 435 620 435 880 { lab=phi1}
N 425 920 475 920 { lab=phi2}
N 475 620 475 920 { lab=phi2}
N 425 900 455 900 { lab=#net1}
N 455 620 455 900 { lab=#net1}
N 425 940 495 940 { lab=#net2}
N 495 620 495 940 { lab=#net2}
N 425 1000 585 1000 { lab=fclkdiv2}
N 135 660 365 660 { lab=loi}
N 365 620 365 660 { lab=loi}
N 135 660 135 1085 { lab=loi}
N 125 1185 125 1225 { lab=EN}
N 30 1225 125 1225 { lab=EN}
N 147.5 1185 147.5 1265 { lab=RSTb}
N -42.5 1265 147.5 1265 { lab=RSTb}
N -152.5 1305 167.5 1305 { lab=mclk}
N -160 680 -110 680 { lab=EN}
N -160 800 -110 800 { lab=RSTb}
N -160 900 -110 900 { lab=Vmid}
N 300 960 300 980 { lab=Vmid}
N 300 980 325 980 { lab=Vmid}
N 280 960 325 960 { lab=Vmid}
N 280 880 325 880 { lab=RSTb}
N 425 960 445 960 { lab=cclk}
N 425 980 445 980 { lab=cclkb}
N 167.5 1185 167.5 1305 { lab=mclk}
N 135 1085 135 1095 { lab=loi}
N 165 752.5 165 1095 { lab=loq}
N 165 750 405 750 { lab=loq}
N 165 750 165 752.5 { lab=loq}
N 280 530 350 530 { lab=inp}
N 280 570 350 570 { lab=inm}
C {devices/netlist.sym} 775 580 0 0 {name=SPICE only_toplevel=false value="
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
.param tau=\{(16^2)*1/fclk\}
.param tend=\{4*tau\}
*start all caps with 0 charge:
*.ic included in cap symbols
.tran \{1/fclk/100\} \{tend\}
.save all
"}
C {devices/lab_pin.sym} 585 510 2 0 {name=l1 sig_type=std_logic lab=opi}
C {devices/lab_pin.sym} 280 530 0 0 {name=l5 sig_type=std_logic lab=inp}
C {devices/vsource.sym} -162.5 597.5 0 0 {name=VDD value="DC 1.2"}
C {devices/vdd.sym} -162.5 567.5 0 0 {name=l7 lab=VDD}
C {devices/lab_pin.sym} 585 530 2 0 {name=l2 sig_type=std_logic lab=omi}
C {devices/lab_pin.sym} 585 570 2 0 {name=l9 sig_type=std_logic lab=opq}
C {devices/lab_pin.sym} 585 590 2 0 {name=l14 sig_type=std_logic lab=omq}
C {devices/lab_pin.sym} 280 570 0 0 {name=l11 sig_type=std_logic lab=inm}
C {devices/vsource.sym} -160 1030 0 0 {name=Vphi value="DC 0 PULSE (0 1.2 1n 1n 1n \{f_dc*1/fclk\} \{1/fclk\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -160 1060 0 0 {name=l31 lab=GND}
C {devices/gnd.sym} -162.5 627.5 0 0 {name=l38 lab=GND}
C {devices/lab_pin.sym} 365 650 0 0 {name=l13 sig_type=std_logic lab=loi}
C {devices/lab_pin.sym} 405 740 0 0 {name=l15 sig_type=std_logic lab=loq}
C {devices/lab_pin.sym} 425 880 1 0 {name=l17 sig_type=std_logic lab=phi1}
C {wavelet_channel/wavelet_iq.sym} 465 550 0 0 {name=X1 W=20 L=20}
C {clkgen/filter_clkgen.sym} 375 940 0 0 {name=X2}
C {devices/lab_pin.sym} 465 920 1 0 {name=l6 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} -160 710 0 0 {name=Ven value=1.2}
C {devices/gnd.sym} -160 740 0 0 {name=l85 lab=GND}
C {devices/lab_pin.sym} 30 1225 0 0 {name=l86 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} -42.5 1265 0 0 {name=l87 sig_type=std_logic lab=RSTb}
C {devices/vsource.sym} -160 830 0 0 {name=Vrstb value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {devices/gnd.sym} -160 860 0 0 {name=l88 lab=GND}
C {devices/lab_pin.sym} -152.5 1305 0 0 {name=l90 sig_type=std_logic lab=mclk}
C {devices/lab_pin.sym} -110 680 2 0 {name=l8 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} -110 800 2 0 {name=l16 sig_type=std_logic lab=RSTb}
C {devices/lab_pin.sym} -160 1000 0 0 {name=l44 sig_type=std_logic lab=fclk}
C {devices/vsource.sym} -160 930 0 0 {name=Vmid value=0.6}
C {devices/gnd.sym} -160 960 0 0 {name=l45 lab=GND}
C {devices/lab_pin.sym} -110 900 2 0 {name=l46 sig_type=std_logic lab=Vmid}
C {devices/lab_pin.sym} 280 960 0 0 {name=l47 sig_type=std_logic lab=Vmid}
C {devices/lab_pin.sym} 280 880 0 0 {name=l48 sig_type=std_logic lab=RSTb}
C {devices/lab_pin.sym} 585 1000 2 0 {name=l49 sig_type=std_logic lab=fclkdiv2}
C {devices/vsource.sym} -160 1130 0 1 {name=Vmclk value="DC 0 PULSE (0 1.2 \{1/2/mclk\} 1n 1n \{m_dc*1/mclk\} \{1/mclk\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -160 1160 0 0 {name=l50 lab=GND}
C {devices/lab_pin.sym} -160 1100 0 0 {name=l51 sig_type=std_logic lab=mclk}
C {Sinusoid_generator/sinusoid_generator.sym} -8890 5040 3 0 {name=X3}
C {devices/lab_pin.sym} 445 960 2 0 {name=l10 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 445 980 2 0 {name=l12 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 435 470 1 0 {name=l18 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 455 470 1 0 {name=l19 sig_type=std_logic lab=cclkb}
C {devices/vsource.sym} -160 440 0 0 {name=Vthresh2 value=0.25}
C {devices/gnd.sym} -160 470 0 0 {name=l20 lab=GND}
C {devices/vsource.sym} -160 330 0 0 {name=Vthresh1 value=0.1}
C {devices/gnd.sym} -160 360 0 0 {name=l21 lab=GND}
C {devices/vsource.sym} -20 440 0 0 {name=Vinp1 value="DC 0 SIN(0 0.1 50k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 530 0 0 {name=l22 lab=GND}
C {devices/lab_pin.sym} -20 410 0 0 {name=l23 sig_type=std_logic lab=inp}
C {devices/vsource.sym} -20 500 0 0 {name=Vinp2 value="DC 0 SIN(0.7 0.1 25k)"
*SIN (0.6 0.6 1k)"}
C {devices/vsource.sym} -20 620 0 0 {name=Vinm1 value="DC 0 SIN(0 -0.1 50k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 710 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} -20 590 0 0 {name=l30 sig_type=std_logic lab=inm}
C {devices/vsource.sym} -20 680 0 0 {name=Vinm2 value="DC 0 SIN(0.5 -0.1 25k)"
*SIN (0.6 0.6 1k)"}
C {devices/lab_pin.sym} -160 300 0 0 {name=l3 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} -160 410 0 0 {name=l4 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 475 470 1 0 {name=l24 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} 495 470 1 0 {name=l25 sig_type=std_logic lab=thresh2}
