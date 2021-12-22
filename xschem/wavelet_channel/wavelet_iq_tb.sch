v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO generation} -530 190 0 0 0.4 0.4 {}
T {Phi1/Phi2 generation} -540 430 0 0 0.4 0.4 {}
N 430 -20 460 -20 { lab=opi}
N 80 560 120 560 { lab=phi2_clkb}
N -60 560 -20 560 { lab=phi2_clk}
N 430 100 460 100 { lab=omi}
N 430 220 460 220 { lab=opq}
N 430 340 460 340 { lab=omq}
N 50 0 90 0 { lab=ipi}
N 90 -20 90 0 { lab=ipi}
N 90 -20 150 -20 { lab=ipi}
N 50 80 90 80 { lab=imi}
N 90 80 90 100 { lab=imi}
N 90 100 150 100 { lab=imi}
N 50 240 90 240 { lab=ipq}
N 90 220 90 240 { lab=ipq}
N 90 220 150 220 { lab=ipq}
N 50 320 90 320 { lab=imq}
N 90 320 90 340 { lab=imq}
N 90 340 150 340 { lab=imq}
N -480 0 -50 0 { lab=inp}
N -400 80 -50 80 { lab=inm}
N -90 0 -90 240 { lab=inp}
N -90 240 -50 240 { lab=inp}
N -130 320 -50 320 { lab=inm}
N -130 80 -130 320 { lab=inm}
N -490 240 -450 240 { lab=lo_i}
N -450 320 -410 320 { lab=lo_q}
N -500 480 -460 480 { lab=phi1_clk}
N -460 560 -420 560 { lab=phi2_clk}
N 80 480 120 480 { lab=phi1_clkb}
N -60 480 -20 480 { lab=phi1_clk}
N -0 100 -0 140 { lab=lo_i}
N -0 340 0 380 { lab=lo_q}
C {devices/netlist.sym} -250 -450 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param flo=\{256*10k\}
.param lo_dc = 0.5
.param r_phi_lo = 1
* ratio of phi / lo clk
.param phi_dc = 0.25
.param fphi = \{flo*r_phi_lo\}
.param tau=\{(16^2)*1/fphi\}
.param tend=\{4*tau\}

*start all caps with 0 charge
*.ic included in cap symbols

*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/fphi/100\} \{tend\}
.save all
"}
C {devices/vsource.sym} -480 30 0 0 {name=Vin value="DC 0 SIN(0.6 0.3 \{flo\})"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -480 60 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 460 -20 2 0 {name=l1 sig_type=std_logic lab=opi}
C {devices/lab_pin.sym} -480 0 0 0 {name=l5 sig_type=std_logic lab=inp}
C {devices/vsource.sym} -420 -120 0 0 {name=VDD value="DC 1.2"}
C {devices/vdd.sym} -420 -150 0 0 {name=l7 lab=VDD}
C {inv/inv.sym} 30 560 0 0 {name=X8}
C {devices/lab_pin.sym} 260 30 0 0 {name=l12 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 -70 0 0 {name=l13 sig_type=std_logic lab=phi1_clkb}
C {devices/lab_pin.sym} 460 100 2 0 {name=l2 sig_type=std_logic lab=omi}
C {mux/multiplier_differential.sym} 0 40 0 0 {name=X3}
C {devices/lab_pin.sym} 460 220 2 0 {name=l9 sig_type=std_logic lab=opq}
C {devices/lab_pin.sym} 460 340 2 0 {name=l14 sig_type=std_logic lab=omq}
C {mux/multiplier_differential.sym} 0 280 0 0 {name=X6}
C {devices/vsource.sym} -400 110 0 0 {name=Vin1 value="DC 0 SIN(0.6 -0.3 \{flo\})"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -400 140 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -400 80 0 0 {name=l11 sig_type=std_logic lab=inm}
C {devices/vsource.sym} -490 270 0 0 {name=Vlo_i value="DC 0 PULSE (0 1.2 1n 1n 1n \{lo_dc*1/flo\} \{1/flo\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -490 300 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} -450 240 2 0 {name=l15 sig_type=std_logic lab=lo_i}
C {devices/vsource.sym} -450 350 0 0 {name=Vlo_q value="DC 0 PULSE (0 1.2 1n 1n 1n \{lo_dc*1/flo\} \{1/flo\} 90"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -450 380 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -410 320 2 0 {name=l17 sig_type=std_logic lab=lo_q}
C {Switched_Caps/16switchcaps_2phi.sym} 280 -20 0 0 {name=X1 W=20 L=20}
C {devices/lab_pin.sym} 300 30 2 0 {name=l6 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 -70 2 0 {name=l18 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 150 0 0 {name=l19 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 50 0 0 {name=l20 sig_type=std_logic lab=phi1_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 280 100 0 0 {name=X2 W=20 L=20}
C {devices/lab_pin.sym} 300 150 2 0 {name=l21 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 50 2 0 {name=l22 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 270 0 0 {name=l23 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 170 0 0 {name=l24 sig_type=std_logic lab=phi1_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 280 220 0 0 {name=X4 W=20 L=20}
C {devices/lab_pin.sym} 300 270 2 0 {name=l25 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 170 2 0 {name=l26 sig_type=std_logic lab=phi2_clkb}
C {devices/lab_pin.sym} 260 390 0 0 {name=l27 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 260 290 0 0 {name=l28 sig_type=std_logic lab=phi1_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 280 340 0 0 {name=X5 W=20 L=20}
C {devices/lab_pin.sym} 300 390 2 0 {name=l29 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 300 290 2 0 {name=l30 sig_type=std_logic lab=phi2_clkb}
C {devices/vsource.sym} -500 510 0 0 {name=Vphi1 value="DC 0 PULSE (0 1.2 1n 1n 1n \{phi_dc*1/fphi\} \{1/fphi\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -500 540 0 0 {name=l31 lab=GND}
C {devices/lab_pin.sym} -460 480 2 0 {name=l32 sig_type=std_logic lab=phi1_clk}
C {devices/vsource.sym} -460 590 0 0 {name=Vphi2 value="DC 0 PULSE (0 1.2 1n 1n 1n \{phi_dc*1/fphi\} \{1/fphi\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -460 620 0 0 {name=l33 lab=GND}
C {devices/lab_pin.sym} -420 560 2 0 {name=l34 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} -60 560 0 0 {name=l10 sig_type=std_logic lab=phi2_clk}
C {devices/lab_pin.sym} 120 560 2 0 {name=l35 sig_type=std_logic lab=phi2_clkb}
C {inv/inv.sym} 30 480 0 0 {name=X7}
C {devices/lab_pin.sym} -60 480 0 0 {name=l36 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 120 480 2 0 {name=l37 sig_type=std_logic lab=phi1_clkb}
C {devices/gnd.sym} -420 -90 0 0 {name=l38 lab=GND}
C {devices/lab_pin.sym} 0 140 3 0 {name=l39 sig_type=std_logic lab=lo_i}
C {devices/lab_pin.sym} 0 380 3 0 {name=l40 sig_type=std_logic lab=lo_q}
C {devices/lab_pin.sym} 90 340 0 0 {name=l41 sig_type=std_logic lab=imq}
C {devices/lab_pin.sym} 90 220 0 0 {name=l42 sig_type=std_logic lab=ipq}
C {devices/lab_pin.sym} 90 100 0 0 {name=l43 sig_type=std_logic lab=imi}
C {devices/lab_pin.sym} 90 -20 0 0 {name=l44 sig_type=std_logic lab=ipi}
