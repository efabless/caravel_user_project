v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {2x duty cycle
Period scaled to get one impulse only} -460 130 0 0 0.2 0.2 {}
N -160 0 -130 0 { lab=in}
N 150 0 180 0 { lab=out}
N -490 80 -450 80 { lab=in}
N -20 280 20 280 { lab=phi_clk}
N -20 80 -20 280 { lab=phi_clk}
N 20 80 20 140 { lab=phi_clkb}
N 20 240 20 280 { lab=phi_clk}
N -20 50 -20 80 { lab=phi_clk}
N 20 80 260 80 { lab=phi_clkb}
N 260 -80 260 80 { lab=phi_clkb}
N -20 -80 260 -80 { lab=phi_clkb}
N -20 -80 -20 -50 { lab=phi_clkb}
N 280 280 340 280 { lab=phi_clk2}
N 340 240 340 280 { lab=phi_clk2}
N 280 60 280 280 { lab=phi_clk2}
N 20 60 280 60 { lab=phi_clk2}
N 20 50 20 60 { lab=phi_clk2}
N 340 -60 340 140 { lab=phi_clkb2}
N 20 -60 340 -60 { lab=phi_clkb2}
N 20 -60 20 -50 { lab=phi_clkb2}
N 450 0 480 0 { lab=out}
N 1630 0 1660 0 { lab=out}
N 1940 0 1970 0 { lab=out3}
N 1770 280 1810 280 { lab=phi_clk}
N 1770 80 1770 280 { lab=phi_clk}
N 1810 80 1810 140 { lab=phi_clkb}
N 1810 240 1810 280 { lab=phi_clk}
N 1770 50 1770 80 { lab=phi_clk}
N 1810 80 2050 80 { lab=phi_clkb}
N 2050 -80 2050 80 { lab=phi_clkb}
N 1770 -80 2050 -80 { lab=phi_clkb}
N 1770 -80 1770 -50 { lab=phi_clkb}
N 2070 280 2130 280 { lab=phi_clk2}
N 2130 240 2130 280 { lab=phi_clk2}
N 2070 60 2070 280 { lab=phi_clk2}
N 1810 60 2070 60 { lab=phi_clk2}
N 1810 50 1810 60 { lab=phi_clk2}
N 2130 -60 2130 140 { lab=phi_clkb2}
N 1810 -60 2130 -60 { lab=phi_clkb2}
N 1810 -60 1810 -50 { lab=phi_clkb2}
N 2200 0 2230 0 { lab=out3}
N 2510 0 2540 0 { lab=out4}
N 2340 280 2380 280 { lab=phi_clk}
N 2340 80 2340 280 { lab=phi_clk}
N 2380 80 2380 140 { lab=phi_clkb}
N 2380 240 2380 280 { lab=phi_clk}
N 2340 50 2340 80 { lab=phi_clk}
N 2380 80 2620 80 { lab=phi_clkb}
N 2620 -80 2620 80 { lab=phi_clkb}
N 2340 -80 2620 -80 { lab=phi_clkb}
N 2340 -80 2340 -50 { lab=phi_clkb}
N 2640 280 2700 280 { lab=phi_clk2}
N 2700 240 2700 280 { lab=phi_clk2}
N 2640 60 2640 280 { lab=phi_clk2}
N 2380 60 2640 60 { lab=phi_clk2}
N 2380 50 2380 60 { lab=phi_clk2}
N 2700 -60 2700 140 { lab=phi_clkb2}
N 2380 -60 2700 -60 { lab=phi_clkb2}
N 2380 -60 2380 -50 { lab=phi_clkb2}
N 180 0 450 -0 { lab=out}
N 1380 -0 1630 -0 { lab=out}
N 1970 0 2200 -0 { lab=out3}
N 1050 -0 1380 -0 { lab=out}
N 480 0 1050 -0 { lab=out}
C {devices/netlist.sym} -610 -710 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param tau=\{(16^2)*1/f\}
.param tend=\{4*tau\}

*start all caps with 0 charge
.ic v(x1.x1.c1)=0 v(x1.c2)=0 v(x1.x2.c1)=0 v(x1.c4)=0 
+ v(x1.x3.c1)=0 v(x1.c6)=0 v(x1.x4.c1)=0 v(x1.c8)=0 
+ v(x1.x5.c1)=0 v(x1.c10)=0 v(x1.x6.c1)=0 v(x1.c12)=0 
+ v(x1.x7.c1)=0 v(x1.c14)=0 v(x1.x8.c1)=0 v(out)=0
+ v(x11.x1.c1)=0 v(x11.c2)=0 v(x11.x2.c1)=0 v(x11.c4)=0 
+ v(x11.x3.c1)=0 v(x11.c6)=0 v(x11.x4.c1)=0 v(x11.c8)=0 
+ v(x11.x5.c1)=0 v(x11.c10)=0 v(x11.x6.c1)=0 v(x11.c12)=0 
+ v(x11.x7.c1)=0 v(x11.c14)=0 v(x11.x8.c1)=0 v(out3)=0
+ v(x14.x1.c1)=0 v(x14.c2)=0 v(x14.x2.c1)=0 v(x14.c4)=0 
+ v(x14.x3.c1)=0 v(x14.c6)=0 v(x14.x4.c1)=0 v(x14.c8)=0 
+ v(x14.x5.c1)=0 v(x14.c10)=0 v(x14.x6.c1)=0 v(x14.c12)=0 
+ v(x14.x7.c1)=0 v(x14.c14)=0 v(x14.x8.c1)=0 v(out4)=0

*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f\} \{tend\}
.save all
"}
C {devices/vsource.sym} -490 110 0 0 {name=Vin value="DC 0 PULSE (0 \{12u * f/1000000\} 1n 1n 1n \{2*duty_cycle*1/f\} \{tend\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -490 140 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 180 0 3 0 {name=l1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -160 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -450 80 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -340 20 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -340 50 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -340 -10 0 0 {name=l7 lab=VDD}
C {inv/inv.sym} 20 190 3 0 {name=X2}
C {devices/vsource.sym} -20 310 0 0 {name=Vphi_clk1 value="DC 0 PULSE (0 1.2 1n 1n 1n \{0.2*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 340 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 110 0 0 {name=l12 sig_type=std_logic lab=phi_clk}
C {devices/lab_pin.sym} 20 110 2 0 {name=l13 sig_type=std_logic lab=phi_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 0 0 0 0 {name=X1 W=5 L=10}
C {devices/vsource.sym} 280 310 0 0 {name=Vphi_clk2 value="DC 0 PULSE (0 1.2 1n 1n 1n \{0.2*1/f\} \{1/f\} 90"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 280 340 0 0 {name=l2 lab=GND}
C {inv/inv.sym} 340 190 3 0 {name=X3}
C {devices/lab_pin.sym} 280 140 0 0 {name=l8 sig_type=std_logic lab=phi_clk2}
C {devices/lab_pin.sym} 340 110 2 0 {name=l9 sig_type=std_logic lab=phi_clkb2}
C {devices/lab_pin.sym} 1970 0 3 0 {name=l29 sig_type=std_logic lab=out3}
C {inv/inv.sym} 1810 190 3 0 {name=X10}
C {devices/vsource.sym} 1770 310 0 0 {name=Vphi_clk7 value="DC 0 PULSE (0 1.2 1n 1n 1n \{0.2*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 1770 340 0 0 {name=l31 lab=GND}
C {devices/lab_pin.sym} 1770 110 0 0 {name=l32 sig_type=std_logic lab=phi_clk}
C {devices/lab_pin.sym} 1810 110 2 0 {name=l33 sig_type=std_logic lab=phi_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 1790 0 0 0 {name=X11 W=5 L=10}
C {devices/vsource.sym} 2070 310 0 0 {name=Vphi_clk8 value="DC 0 PULSE (0 1.2 1n 1n 1n \{0.2*1/f\} \{1/f\} 90"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 2070 340 0 0 {name=l34 lab=GND}
C {inv/inv.sym} 2130 190 3 0 {name=X12}
C {devices/lab_pin.sym} 2070 140 0 0 {name=l35 sig_type=std_logic lab=phi_clk2}
C {devices/lab_pin.sym} 2130 110 2 0 {name=l36 sig_type=std_logic lab=phi_clkb2}
C {devices/lab_pin.sym} 2540 0 2 0 {name=l37 sig_type=std_logic lab=out4}
C {inv/inv.sym} 2380 190 3 0 {name=X13}
C {devices/vsource.sym} 2340 310 0 0 {name=Vphi_clk9 value="DC 0 PULSE (0 1.2 1n 1n 1n \{0.2*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 2340 340 0 0 {name=l39 lab=GND}
C {devices/lab_pin.sym} 2340 110 0 0 {name=l40 sig_type=std_logic lab=phi_clk}
C {devices/lab_pin.sym} 2380 110 2 0 {name=l41 sig_type=std_logic lab=phi_clkb}
C {Switched_Caps/16switchcaps_2phi.sym} 2360 0 0 0 {name=X14 W=5 L=10}
C {devices/vsource.sym} 2640 310 0 0 {name=Vphi_clk10 value="DC 0 PULSE (0 1.2 1n 1n 1n \{0.2*1/f\} \{1/f\} 90"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 2640 340 0 0 {name=l42 lab=GND}
C {inv/inv.sym} 2700 190 3 0 {name=X15}
C {devices/lab_pin.sym} 2640 140 0 0 {name=l43 sig_type=std_logic lab=phi_clk2}
C {devices/lab_pin.sym} 2700 110 2 0 {name=l44 sig_type=std_logic lab=phi_clkb2}
