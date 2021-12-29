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
C {devices/netlist.sym} -320 -460 0 0 {name=SPICE only_toplevel=false value="
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

*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f\} \{tend\}
.save all
"}
C {devices/vsource.sym} -490 110 0 0 {name=Vin value="DC 0 PULSE (0 \{12u * f/1000000\} 1n 1n 1n \{2*duty_cycle*1/f\} \{tend\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -490 140 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 180 0 2 0 {name=l1 sig_type=std_logic lab=out}
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
