v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
C {devices/code_shown.sym} 30 -605 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 1m
.save all
"}
C {devices/vsource.sym} 60 -450 0 0 {name=V6 value=PULSE(0,1,0,1n,1n,8u,20u)}
C {devices/vsource.sym} 280 -450 0 0 {name=V7 value=PULSE(0,1,0,1n,1n,8u,20u,180)}
C {devices/vsource.sym} 60 -350 0 0 {name=V8 value=sin(0.6,0.01,5000)}
C {devices/vsource.sym} 60 -250 0 0 {name=V9 value=0.6}
C {devices/vsource.sym} 500 -440 0 0 {name=V10 value=1}
C {devices/vdd.sym} 500 -470 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 500 -410 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 60 -220 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 60 -280 0 0 {name=l4 sig_type=std_logic lab=Vinm}
C {devices/lab_pin.sym} 60 -380 0 0 {name=l5 sig_type=std_logic lab=Vinp}
C {devices/lab_pin.sym} 280 -480 0 0 {name=l6 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 60 -480 0 0 {name=l7 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 280 -420 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 60 -420 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 60 -320 0 0 {name=l10 lab=GND}
C {/home/sky/cochlea_sky130/xschem/comparator/doubletaillatch.sym} 280 -220 0 0 {name=X5}
C {devices/lab_pin.sym} 330 -320 0 0 {name=l46 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 330 -220 0 0 {name=l47 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 280 -290 0 0 {name=l53 sig_type=std_logic lab=Vinp}
C {devices/lab_pin.sym} 280 -250 0 0 {name=l54 sig_type=std_logic lab=Vinm}
C {devices/lab_pin.sym} 380 -270 0 1 {name=l55 sig_type=std_logic lab=oo}
