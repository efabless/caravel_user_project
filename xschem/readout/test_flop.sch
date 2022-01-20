v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2065 -1310 2065 -1290 { lab=clk}
N 2190 -1310 2250 -1310 { lab=clk}
N 2215 -1285 2215 -1180 { lab=d}
N 2215 -1290 2215 -1285 { lab=d}
N 2215 -1290 2250 -1290 { lab=d}
N 2430 -1310 2455 -1310 { lab=out}
N 2065 -1310 2090 -1310 { lab=clk}
N 2090 -1310 2190 -1310 { lab=clk}
N 2230 -1270 2250 -1270 { lab=#net1}
N 2130 -1310 2130 -1270 { lab=clk}
C {devices/vsource.sym} 2295 -1415 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 2295 -1385 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 2295 -1445 0 0 {name=l15 lab=VDD}
C {devices/lab_pin.sym} 2065 -1310 0 0 {name=l3 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 2065 -1230 0 0 {name=l89 lab=GND}
C {devices/vsource.sym} 2065 -1260 0 1 {name=V10 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} 2215 -1150 0 0 {name=V1 value=1.2}
C {devices/gnd.sym} 2215 -1120 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 2455 -1310 2 0 {name=l2 sig_type=std_logic lab=out}
C {devices/netlist.sym} 2375 -1525 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {devices/lab_pin.sym} 2215 -1180 0 0 {name=l4 sig_type=std_logic lab=d}
C {sky130_stdcells/dfrtn_1.sym} 2340 -1290 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {inv/inv.sym} 2180 -1270 0 0 {name=X1 Wpmos=6 Lpmos=0.15 Wnmos=2 Lnmos=0.15}
