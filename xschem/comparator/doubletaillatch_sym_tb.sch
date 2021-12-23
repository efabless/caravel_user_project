v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 490 -70 530 -70 { lab=o1}
N 490 -70 490 20 { lab=o1}
N 490 20 730 20 { lab=o1}
N 730 -30 730 20 { lab=o1}
C {devices/code_shown.sym} 0 -375 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 5m
.save all
"}
C {/home/sky/cochlea_sky130/xschem/comparator/doubletaillatch.sym} 190 -20 0 0 {name=X2}
C {devices/vsource.sym} 30 -220 0 0 {name=V6 value=PULSE(0,1,0,1n,1n,10u,20u)}
C {devices/vsource.sym} 250 -220 0 0 {name=V7 value=PULSE(1,0,0,1n,1n,10u,20u)}
C {devices/vsource.sym} 30 -120 0 0 {name=V8 value=sin(0.6,0.1,5000)}
C {devices/vsource.sym} 30 -20 0 0 {name=V9 value=0.6}
C {devices/vsource.sym} 470 -210 0 0 {name=V10 value=1}
C {devices/vdd.sym} 470 -240 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 470 -180 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 30 10 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 30 -50 0 0 {name=l4 sig_type=std_logic lab=Vinm}
C {devices/lab_pin.sym} 30 -150 0 0 {name=l5 sig_type=std_logic lab=Vinp}
C {devices/lab_pin.sym} 250 -250 0 0 {name=l6 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 30 -250 0 0 {name=l7 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 250 -190 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 30 -190 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 30 -90 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 190 -90 0 0 {name=l11 sig_type=std_logic lab=Vinp}
C {devices/lab_pin.sym} 190 -50 0 0 {name=l12 sig_type=std_logic lab=Vinm}
C {devices/lab_pin.sym} 240 -120 0 0 {name=l13 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 240 -20 0 0 {name=l14 sig_type=std_logic lab=clkbar}
C {devices/vsource.sym} 580 -230 0 0 {name=V1 value=PULSE(0,1,3u,10n,10n,15u,30u)}
C {devices/lab_pin.sym} 580 -260 0 0 {name=l17 sig_type=std_logic lab=D}
C {devices/gnd.sym} 580 -200 0 0 {name=l18 lab=GND}
C {/home/sky/cochlea_sky130/xschem/comparator/latchnorandinv.sym} 290 -10 0 0 {name=x3}
C {devices/lab_pin.sym} 340 -10 0 0 {name=l16 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 930 -50 0 1 {name=l19 sig_type=std_logic lab=out}
C {/home/sky/cochlea_sky130/xschem/comparator/latchnorandinv.sym} 390 -10 0 0 {name=x1}
C {devices/lab_pin.sym} 440 -10 0 0 {name=l15 sig_type=std_logic lab=clkbar}
C {sky130_stdcells/xor2_1.sym} 790 -50 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {/home/sky/cochlea_sky130/xschem/comparator/latchnorandinv.sym} 530 -10 0 0 {name=x4}
C {devices/lab_pin.sym} 580 -10 0 0 {name=l20 sig_type=std_logic lab=clk}
C {/home/sky/cochlea_sky130/xschem/comparator/latchnorandinv.sym} 630 -10 0 0 {name=x5}
C {devices/lab_pin.sym} 680 -10 0 0 {name=l21 sig_type=std_logic lab=clkbar}
C {devices/lab_pin.sym} 490 -70 3 1 {name=l22 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 730 -70 3 1 {name=l23 sig_type=std_logic lab=o2}
C {sky130_stdcells/buf_1.sym} 890 -50 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
