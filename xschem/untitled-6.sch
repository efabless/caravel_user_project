v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {http://ngspice.sourceforge.net/docs/ngspice-html-manual/manual.xhtml#magicparlabel-4894} -480 370 0 0 0.2 0.2 {}
N -60 70 -30 70 { lab=in}
N 250 70 280 70 { lab=out}
N -240 190 -200 190 { lab=in}
N 80 320 120 320 { lab=phi_clk}
N 80 120 80 320 { lab=phi_clk}
N 120 120 120 180 { lab=#net1}
N 120 280 120 320 { lab=phi_clk}
C {devices/netlist.sym} -140 -320 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=100
.param duty_cycle=0.5
.param tau=\{(16^2)*1/f\}
.param tend=\{4*tau\}

*start all caps with 0 charge
.ic v(x1.x1.c1)=0 v(x1.c2)=0 v(x1.x2.c1)=0 v(x1.c4)=0 
+ v(x1.x3.c1)=0 v(x1.c6)=0 v(x1.x4.c1)=0 v(x1.c8)=0 
+ v(x1.x5.c1)=0 v(x1.c10)=0 v(x1.x6.c1)=0 v(x1.c12)=0 
+ v(x1.x7.c1)=0 v(x1.c14)=0 v(x1.x8.c1)=0 v(out)=0

*.ac DEC 30 1 2k 
*doesn't seem to work, get 0s out
.tran 2m 2
.save all
"}
C {devices/vsource.sym} -240 220 0 0 {name=Vin value="SIN (0.6 0.6 1k)"
*uniform source, duration of each sample, time delay, amp 0.6V, offset 0.6V

*white noise
*"DC 0.6 TRNOISE(0.6 \{1/f/100\} 0 0)"

*"DC 0 PULSE (0 0.6 1n 1n 1n \{2*duty_cycle*1/f\} \{tend\}"
*SIN (0.6 0.6 1k)"
*DC 0.6 SIN(0 1.2 f)}
C {devices/gnd.sym} -240 250 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 280 70 2 0 {name=l1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -60 70 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -200 190 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -240 90 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -240 120 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -240 60 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} 80 350 0 0 {name=Vphi_clk value="DC 0 PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 80 380 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 80 150 0 0 {name=l12 sig_type=std_logic lab=phi_clk}
C {Switched_Caps/16switchcaps.sym} 100 70 0 0 {name=X1 W=20 L=20}
C {inv/inv.sym} 120 230 3 0 {name=X2 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
