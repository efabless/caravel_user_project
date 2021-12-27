v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Filter clk for bank} -160 220 0 0 0.4 0.4 {}
N -160 140 -60 140 { lab=fclk}
N -350 20 -60 20 { lab=rstb}
N -240 120 -240 140 { lab=Vnb}
N -240 120 -60 120 { lab=Vnb}
N -310 100 -310 140 { lab=Vpb}
N -310 100 -60 100 { lab=Vpb}
N 40 20 550 20 { lab=phi1_0}
N 40 320 100 320 { lab=fclkdiv2}
N 40 140 40 320 { lab=fclkdiv2}
N 40 60 160 60 { lab=phi2_0}
N 160 60 160 100 { lab=phi2_0}
N 160 100 590 100 { lab=phi2_0}
N 200 200 550 200 { lab=phi1_1}
N 200 240 240 240 { lab=phi2_1}
N 240 240 240 280 { lab=phi2_1}
N 240 280 590 280 { lab=phi2_1}
N 200 500 260 500 { lab=fclkdiv4}
N 200 320 200 500 { lab=fclkdiv4}
N 360 380 550 380 { lab=phi1_2}
N 360 420 400 420 { lab=phi2_2}
N 400 420 400 460 { lab=phi2_2}
N 400 460 590 460 { lab=phi2_2}
N 800 -20 800 520 { lab=OEV}
N 780 -20 780 520 { lab=OPQ}
N 760 -20 760 520 { lab=OPI}
N 630 20 760 20 { lab=OPI}
N 630 40 780 40 { lab=OPQ}
N 630 60 800 60 { lab=OEV}
N 630 200 760 200 { lab=OPI}
N 630 220 780 220 { lab=OPQ}
N 630 240 800 240 { lab=OEV}
N 630 380 760 380 { lab=OPI}
N 630 400 780 400 { lab=OPQ}
N 630 420 800 420 { lab=OEV}
N 680 -20 680 520 { lab=anyACT}
N 630 80 680 80 { lab=anyACT}
N 630 260 680 260 { lab=anyACT}
N 630 440 680 440 { lab=anyACT}
N 500 -20 500 520 { lab=RST_drv}
N 500 80 550 80 { lab=RST_drv}
N 500 260 550 260 { lab=RST_drv}
N 500 440 550 440 { lab=RST_drv}
N 530 60 550 60 { lab=phi1_0}
N 530 20 530 60 { lab=phi1_0}
N 530 240 550 240 { lab=phi1_1}
N 530 200 530 240 { lab=phi1_1}
N 530 420 550 420 { lab=phi1_2}
N 530 380 530 420 { lab=phi1_2}
N 40 40 550 40 { lab=phi1b_0}
N 40 80 60 80 { lab=#net1}
N 40 100 60 100 { lab=#net2}
N 40 120 60 120 { lab=#net3}
N 200 220 550 220 { lab=phi1b_1}
N 200 260 220 260 { lab=#net4}
N 200 280 220 280 { lab=#net5}
N 200 300 220 300 { lab=#net6}
N 360 400 550 400 { lab=phi1b_2}
N 360 440 380 440 { lab=#net7}
N 360 460 380 460 { lab=#net8}
N 360 480 380 480 { lab=#net9}
N 360 500 380 500 { lab=#net10}
C {devices/vsource.sym} -350 50 0 0 {name=Vrstb value="DC 0 PWL(0 0 \{0.5/f\} 0 \{0.5/f +1n\} 1.2)"}
C {devices/vsource.sym} -360 -110 0 0 {name=VDD value=1.2}
C {devices/vdd.sym} -360 -140 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -360 -80 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -350 80 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -350 20 0 0 {name=l4 sig_type=std_logic lab=rstb}
C {devices/netlist.sym} -50 -150 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.param f=\{256*10k\}
.tran \{1/100/f\} \{4/f\}
.save all
"}
C {devices/vsource.sym} -310 170 0 0 {name=Vpb value=0.6}
C {devices/gnd.sym} -310 200 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -310 140 0 0 {name=l7 sig_type=std_logic lab=Vpb}
C {devices/vsource.sym} -240 170 0 0 {name=Vnb value=0.6}
C {devices/gnd.sym} -240 200 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -240 140 0 0 {name=l10 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 590 100 3 0 {name=l17 sig_type=std_logic lab=phi2_0}
C {devices/lab_pin.sym} 40 140 2 0 {name=l23 sig_type=std_logic lab=fclkdiv2}
C {devices/vsource.sym} -160 170 0 0 {name=Vclk value="DC 0 PULSE(0 1.2 1n 1n 1n \{1/2/f\} \{1/f\})"}
C {devices/gnd.sym} -160 200 0 0 {name=l24 lab=GND}
C {devices/lab_pin.sym} -160 140 0 0 {name=l25 sig_type=std_logic lab=fclk}
C {clkgen/filter_clkgen.sym} -10 80 0 0 {name=X1}
C {readout/CLR_ACT.sym} 590 60 0 0 {name=X2}
C {clkgen/filter_clkgen.sym} 150 260 0 0 {name=X4}
C {devices/lab_pin.sym} 100 280 0 0 {name=l5 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 100 300 0 0 {name=l8 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 100 200 0 0 {name=l11 sig_type=std_logic lab=rstb}
C {readout/CLR_ACT.sym} 590 240 0 0 {name=X5}
C {devices/lab_pin.sym} 590 280 3 0 {name=l14 sig_type=std_logic lab=phi2_1}
C {clkgen/filter_clkgen.sym} 310 440 0 0 {name=X6}
C {devices/lab_pin.sym} 260 460 0 0 {name=l12 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 260 480 0 0 {name=l13 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 260 380 0 0 {name=l15 sig_type=std_logic lab=rstb}
C {readout/CLR_ACT.sym} 590 420 0 0 {name=X7}
C {devices/lab_pin.sym} 590 460 3 0 {name=l16 sig_type=std_logic lab=phi2_2}
C {devices/lab_pin.sym} 200 320 2 0 {name=l18 sig_type=std_logic lab=fclkdiv4}
C {devices/lab_pin.sym} 500 -20 1 0 {name=l19 sig_type=std_logic lab=RST_drv}
C {devices/lab_pin.sym} 680 -20 1 0 {name=l20 sig_type=std_logic lab=anyACT}
C {devices/lab_pin.sym} 760 -20 1 0 {name=l21 sig_type=std_logic lab=OPI}
C {devices/lab_pin.sym} 780 -20 1 0 {name=l22 sig_type=std_logic lab=OPQ}
C {devices/lab_pin.sym} 800 -20 1 0 {name=l26 sig_type=std_logic lab=OEV}
C {devices/lab_pin.sym} 530 20 1 0 {name=l27 sig_type=std_logic lab=phi1_0}
C {devices/lab_pin.sym} 530 200 1 0 {name=l28 sig_type=std_logic lab=phi1_1}
C {devices/lab_pin.sym} 530 380 1 0 {name=l29 sig_type=std_logic lab=phi1_2}
C {devices/lab_pin.sym} 470 40 0 0 {name=l30 sig_type=std_logic lab=phi1b_0}
C {devices/lab_pin.sym} 460 220 0 0 {name=l31 sig_type=std_logic lab=phi1b_1}
C {devices/lab_pin.sym} 460 400 0 0 {name=l32 sig_type=std_logic lab=phi1b_2}
