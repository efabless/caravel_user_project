v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 70 -160 280 -160 { lab=inp}
N 70 200 280 200 { lab=inm}
N 330 -70 330 -50 { lab=phi1}
N 330 50 330 70 { lab=phi1b}
N 280 -160 280 -20 { lab=inp}
N 280 20 280 200 { lab=inm}
N 380 -0 400 -0 { lab=compout}
N -230 -160 -100 -160 { lab=inp}
N -200 200 -70 200 { lab=inm}
N -100 -160 70 -160 { lab=inp}
N -70 200 70 200 { lab=inm}
N 540 -240 580 -240 { lab=fclk}
N 680 -360 790 -360 { lab=phi1}
N 680 -340 710 -340 { lab=phi1b}
N 680 -320 830 -320 { lab=phi2}
N 680 -280 870 -280 { lab=cclk}
N 680 -260 700 -260 { lab=cclkb}
N 680 -240 700 -240 { lab=fclkdiv2}
N 680 -300 750 -300 { lab=phi2b}
N 450 -410 580 -410 { lab=rstb}
N 580 -410 580 -360 { lab=rstb}
C {devices/netlist.sym} 510 60 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param thresh1=0.1
.param thresh2=0.25
*cap init conditions included in symbol
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{60*1/f\}
*.tran 1n 10u
.save all
"}
C {devices/vsource.sym} -230 -130 0 0 {name=Vinp value=SIN(0.6,0.3,15000)}
C {devices/gnd.sym} -230 -100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -230 -160 0 0 {name=l5 sig_type=std_logic lab=inp}
C {devices/vsource.sym} 260 -290 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} 260 -260 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 260 -320 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -200 230 0 0 {name=Vinm value=0.7}
C {devices/gnd.sym} -200 260 0 0 {name=l28 lab=GND}
C {devices/lab_pin.sym} -200 200 0 0 {name=l30 sig_type=std_logic lab=inm}
C {comparator/doubletaillatch.sym} 280 50 0 0 {name=X4}
C {devices/lab_pin.sym} 400 0 0 1 {name=l40 sig_type=std_logic lab=compout}
C {devices/vsource.sym} -230 -280 0 0 {name=VDD1 value=PULSE(0,1.2,0,1n,1n,200n,420n)}
C {devices/gnd.sym} -230 -250 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 0 -290 0 0 {name=VDD2 value=PULSE(0,1.2,0,1n,1n,200n,420n,180)}
C {devices/gnd.sym} 0 -260 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} -230 -310 0 0 {name=l14 sig_type=std_logic lab=c}
C {devices/lab_pin.sym} 0 -320 0 0 {name=l15 sig_type=std_logic lab=cbar}
C {devices/vsource.sym} 540 -210 0 0 {name=Vfclk value="DC 0 PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 540 -180 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 790 -360 2 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 830 -320 2 0 {name=l13 sig_type=std_logic lab=phi2}
C {clkgen/filter_clkgen.sym} 630 -300 0 0 {name=X2}
C {devices/vsource.sym} 450 -250 0 0 {name=Vbias value="DC 0.6"}
C {devices/gnd.sym} 450 -220 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 710 -340 2 0 {name=l4 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 750 -300 2 0 {name=l9 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} 450 -410 0 0 {name=l17 sig_type=std_logic lab=rstb}
C {devices/vsource.sym} 450 -380 0 0 {name=Vrstb value="DC 0 PWL (0 0 \{1/4*1/f\} 0  \{1/4*1/f +0.1u\} 1.2\}"}
C {devices/gnd.sym} 450 -350 0 0 {name=l18 lab=GND}
C {devices/lab_pin.sym} 540 -240 0 0 {name=l2 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} 450 -280 0 0 {name=l21 sig_type=std_logic lab=bias}
C {devices/lab_pin.sym} 700 -260 2 0 {name=l22 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} 700 -240 2 0 {name=l23 sig_type=std_logic lab=fclkdiv2}
C {devices/lab_pin.sym} 870 -280 2 0 {name=l24 sig_type=std_logic lab=cclk}
C {devices/vsource.sym} -200 -370 0 0 {name=Vinp1 value=1.1}
C {devices/gnd.sym} -200 -340 0 0 {name=l35 lab=GND}
C {devices/lab_pin.sym} -200 -400 0 0 {name=l36 sig_type=std_logic lab=vnb}
C {devices/vsource.sym} -110 -370 0 0 {name=Vinp2 value=0.1}
C {devices/gnd.sym} -110 -340 0 0 {name=l37 lab=GND}
C {devices/lab_pin.sym} -110 -400 0 0 {name=l42 sig_type=std_logic lab=vpb}
C {devices/lab_pin.sym} 580 -260 0 0 {name=l31 sig_type=std_logic lab=vnb}
C {devices/lab_pin.sym} 580 -280 0 0 {name=l32 sig_type=std_logic lab=vpb}
C {devices/lab_pin.sym} 330 -70 2 0 {name=l20 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 330 70 2 0 {name=l16 sig_type=std_logic lab=phi1b}
