v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 320 -30 320 -10 { lab=Clk}
N 190 -200 220 -200 { lab=D}
C {devices/vsource.sym} 50 -70 0 0 {name=V1 value=1.2}
C {devices/vdd.sym} 50 -100 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 50 -40 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 190 -170 0 1 {name=V2 value="DC 0 PWL(0 0 \{(2/f)+1/(2*f)\} 0 \{(2/f)+1/(2*f)+0.1u\} 1.2 \{(2/f)+4/(2*f)\} 1.2 \{(2/f)+4/(2*f)+0.1u\} 0)"}
C {devices/gnd.sym} 190 -140 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 320 50 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 420 -200 2 0 {name=l5 sig_type=std_logic lab=Q}
C {devices/netlist.sym} 480 -270 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param f=80k
.param duty_cycle=0.5
.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{10/f\}
.save all
"}
C {devices/vsource.sym} 320 20 0 0 {name=V3 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 220 -200 2 0 {name=l7 sig_type=std_logic lab=D}
C {devices/lab_pin.sym} 320 -30 2 1 {name=l8 sig_type=std_logic lab=Clk}
C {D_flip_flop/d_flip_flop.sym} 210 -60 0 0 {name=X1}
C {devices/lab_pin.sym} 420 -100 2 0 {name=l6 sig_type=std_logic lab=Q_inv}
