v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {2x duty cycle
10x period} -120 170 0 0 0.2 0.2 {}
N 10 0 40 0 { lab=in}
N 180 0 210 0 { lab=out}
N -310 120 -270 120 { lab=in}
N 130 -80 130 -60 { lab=phi1_clk}
N 130 80 130 100 { lab=phi1_clkb}
N 90 80 90 200 { lab=phi1_clk}
N 90 200 130 200 { lab=phi1_clk}
N 130 80 270 80 { lab=phi1_clkb}
N 90 -80 90 -60 { lab=phi1_clkb}
N 90 -80 130 -120 { lab=phi1_clkb}
N 130 -120 270 -120 { lab=phi1_clkb}
N 270 -120 270 80 { lab=phi1_clkb}
N 90 -120 130 -80 { lab=phi1_clk}
N -50 -120 90 -120 { lab=phi1_clk}
N -50 -120 -50 80 { lab=phi1_clk}
N -50 80 90 80 { lab=phi1_clk}
C {devices/netlist.sym} -240 -330 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=100k
.param duty_cycle=0.5
.ic v(x1.c1)=0 v(out)=0
*.ac DEC 100 10 20k *doesn't seem to work, get 0s out
.tran \{1/f/100\} \{5*1/f\}
.save all
"}
C {devices/vsource.sym} -310 150 0 0 {name=Vin value="PULSE (0 1.2 1n 1n 1n \{2*duty_cycle*1/f\} \{10/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -310 180 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 210 0 2 0 {name=l1 sig_type=std_logic lab=out}
C {Switched_Caps/2switchcaps.sym} 110 0 0 0 {name=X1 Wcap=20 Lcap=20}
C {devices/lab_pin.sym} 10 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -270 120 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -310 -50 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -310 -20 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -310 -80 0 0 {name=l7 lab=VDD}
C {inv/inv.sym} 130 150 3 0 {name=X2}
C {devices/vsource.sym} 90 230 0 0 {name=Vphi1_clk_p value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 90 260 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -50 80 0 0 {name=l12 sig_type=std_logic lab=phi1_clk}
C {devices/lab_pin.sym} 270 80 2 0 {name=l13 sig_type=std_logic lab=phi1_clkb}
