v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 70 0 170 0 { lab=out}
N -360 0 -70 0 { lab=in}
N 20 -80 20 -60 { lab=phi2b}
N 20 80 20 340 { lab=phi2}
N -410 380 -230 380 { lab=Vpb}
N -340 400 -230 400 { lab=Vnb}
N -270 420 -230 420 { lab=fclk}
N -130 300 -20 300 { lab=phi1}
N -20 80 -20 300 { lab=phi1}
N -20 -80 -20 -60 { lab=phi1b}
N -130 320 -100 320 { lab=phi1b}
N -130 340 20 340 { lab=phi2}
N 60 80 60 380 { lab=cclk}
N -130 380 60 380 { lab=cclk}
N -130 400 -110 400 { lab=cclkb}
N -130 420 -110 420 { lab=fclkdiv2}
N -130 360 -60 360 { lab=phi2b}
N 70 20 120 20 { lab=thresh1}
N 70 40 100 40 { lab=thresh2}
N 100 40 100 120 { lab=thresh2}
N -360 120 100 120 { lab=thresh2}
N -360 250 -230 250 { lab=rstb}
N -270 140 120 140 { lab=thresh1}
N 120 20 120 140 { lab=thresh1}
N -230 250 -230 300 { lab=rstb}
N 60 -80 60 -60 { lab=cclkb}
N -340 400 -340 420 { lab=Vnb}
N -410 380 -410 420 { lab=Vpb}
C {devices/netlist.sym} -240 -330 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param thresh1=0.6
.param thresh2=0.6
*cap init conditions included in symbol
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{10*1/f\}
.save all
"}
C {devices/vsource.sym} -360 30 0 0 {name=Vin value="DC 0 PULSE (0 1.2 1n 1n 1n \{2*1/f\} \{10/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -360 60 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 170 0 2 0 {name=l1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -360 0 0 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -360 -110 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -360 -80 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -360 -140 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -270 450 0 0 {name=Vfclk value="DC 0 PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -270 480 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 290 0 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 330 0 0 {name=l13 sig_type=std_logic lab=phi2}
C {clkgen/filter_clkgen.sym} -180 360 0 0 {name=X2}
C {devices/lab_pin.sym} -100 320 2 0 {name=l4 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} -60 360 2 0 {name=l9 sig_type=std_logic lab=phi2b}
C {devices/lab_pin.sym} -20 -80 1 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 20 -80 1 0 {name=l14 sig_type=std_logic lab=phi2b}
C {devices/vsource.sym} -270 170 0 0 {name=Vthresh1 value="DC \{thresh1\}"}
C {devices/gnd.sym} -270 200 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} -360 150 0 0 {name=Vthresh2 value="DC \{thresh2\}"}
C {devices/gnd.sym} -360 180 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -360 250 0 0 {name=l17 sig_type=std_logic lab=rstb}
C {devices/vsource.sym} -360 280 0 0 {name=Vrstb value="DC 0 PWL (0 0 \{1/4*1/f\} 0  \{1/4*1/f +0.1u\} 1.2\}"}
C {devices/gnd.sym} -360 310 0 0 {name=l18 lab=GND}
C {devices/lab_pin.sym} -270 420 0 0 {name=l2 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} 90 40 3 0 {name=l19 sig_type=std_logic lab=thresh2}
C {devices/lab_pin.sym} 110 20 3 0 {name=l20 sig_type=std_logic lab=thresh1}
C {devices/lab_pin.sym} -110 400 2 0 {name=l22 sig_type=std_logic lab=cclkb}
C {devices/lab_pin.sym} -110 420 2 0 {name=l23 sig_type=std_logic lab=fclkdiv2}
C {devices/lab_pin.sym} 60 380 2 0 {name=l24 sig_type=std_logic lab=cclk}
C {devices/lab_pin.sym} 60 -80 1 0 {name=l25 sig_type=std_logic lab=cclkb}
C {Switched_Caps/2switchcaps_thresh.sym} 0 0 0 0 {name=X1 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25}
C {devices/vsource.sym} -410 450 0 0 {name=Vpb value=0}
C {devices/gnd.sym} -410 480 0 0 {name=l21 lab=GND}
C {devices/lab_pin.sym} -410 420 0 0 {name=l26 sig_type=std_logic lab=Vpb}
C {devices/vsource.sym} -340 450 0 0 {name=Vnb value=1.2}
C {devices/gnd.sym} -340 480 0 0 {name=l27 lab=GND}
C {devices/lab_pin.sym} -340 420 0 0 {name=l28 sig_type=std_logic lab=Vnb}
C {devices/vsource.sym} -535 -35 0 0 {name=Vinp1 value="DC 0 SIN(0 0.1 15k)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -535 55 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} -535 -65 0 0 {name=l29 sig_type=std_logic lab=inp}
C {devices/vsource.sym} -535 25 0 0 {name=Vinp2 value="DC 0 SIN(0.7 0.1 14k)"
*SIN (0.6 0.6 1k)"}
