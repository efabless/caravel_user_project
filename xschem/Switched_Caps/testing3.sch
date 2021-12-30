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
N 670 0 710 0 { lab=out1}
N 180 0 270 -0 { lab=out}
N 330 -0 390 -0 { lab=out}
N 1060 0 1100 0 { lab=out2}
N 710 -0 720 -0 { lab=out1}
N 270 -0 330 -0 { lab=out}
N 720 -0 780 -0 { lab=out1}
C {devices/netlist.sym} -610 -710 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.param tau=\{(48^2)*1/f\}
.param tend=\{4*tau\}

*start all caps with 0 charge
.ic v(x1.x1.c1)=0 v(x1.c2)=0 v(x1.x2.c1)=0 v(x1.c4)=0 
+ v(x1.x3.c1)=0 v(x1.c6)=0 v(x1.x4.c1)=0 v(x1.c8)=0 
+ v(x1.x5.c1)=0 v(x1.c10)=0 v(x1.x6.c1)=0 v(x1.c12)=0 
+ v(x1.x7.c1)=0 v(x1.c14)=0 v(x1.x8.c1)=0 v(out)=0
+ v(x4.x1.c1)=0 v(x4.c2)=0 v(x4.x2.c1)=0 v(x4.c4)=0 
+ v(x4.x3.c1)=0 v(x4.c6)=0 v(x4.x4.c1)=0 v(x4.c8)=0 
+ v(x4.x5.c1)=0 v(x4.c10)=0 v(x4.x6.c1)=0 v(x4.c12)=0 
+ v(x4.x7.c1)=0 v(x4.c14)=0 v(x4.x8.c1)=0 v(out1)=0


*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f\} \{tend\}
.save all
"}
C {devices/vsource.sym} -490 110 0 0 {name=Vin value="DC 0 PULSE (0 \{12u * f\} 1n 1n 1n \{2*duty_cycle*1/f\} \{tend\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -490 140 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 180 0 3 0 {name=l1 sig_type=std_logic lab=out}
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
C {Switched_Caps/16switchcaps_2phi.sym} 520 0 0 0 {name=X4 W=5 L=10}
C {devices/lab_pin.sym} 500 50 0 0 {name=l11 sig_type=std_logic lab=phi_clk}
C {devices/lab_pin.sym} 500 -50 0 0 {name=l14 sig_type=std_logic lab=phi_clkb}
C {devices/lab_pin.sym} 540 50 2 0 {name=l15 sig_type=std_logic lab=phi_clk2}
C {devices/lab_pin.sym} 540 -50 2 0 {name=l16 sig_type=std_logic lab=phi_clkb2}
C {devices/lab_pin.sym} 700 0 3 0 {name=l17 sig_type=std_logic lab=out1}
C {devices/lab_pin.sym} -160 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {Switched_Caps/16switchcaps_2phi.sym} 910 0 0 0 {name=X5 W=5 L=10}
C {devices/lab_pin.sym} 890 50 0 0 {name=l18 sig_type=std_logic lab=phi_clk}
C {devices/lab_pin.sym} 890 -50 0 0 {name=l19 sig_type=std_logic lab=phi_clkb}
C {devices/lab_pin.sym} 930 50 2 0 {name=l20 sig_type=std_logic lab=phi_clk2}
C {devices/lab_pin.sym} 930 -50 2 0 {name=l21 sig_type=std_logic lab=phi_clkb2}
C {devices/lab_pin.sym} 1090 0 3 0 {name=l22 sig_type=std_logic lab=out2}
