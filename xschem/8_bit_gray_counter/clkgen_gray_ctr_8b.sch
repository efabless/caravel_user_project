v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Filter clk for bank} -160 220 0 0 0.4 0.4 {}
N -160 140 100 140 { lab=fclk}
N -350 20 100 20 { lab=rstb}
N -240 120 -240 140 { lab=Vnb}
N -240 120 100 120 { lab=Vnb}
N -310 100 -310 140 { lab=Vpb}
N -310 100 100 100 { lab=Vpb}
N 200 20 220 20 { lab=#net1}
N 200 60 220 60 { lab=#net2}
N 200 40 220 40 { lab=#net3}
N 200 80 220 80 { lab=#net4}
N 200 100 220 100 { lab=#net5}
N 200 120 220 120 { lab=#net6}
N 500 80 520 80 { lab=#net7}
N 500 100 520 100 { lab=#net8}
N 500 120 520 120 { lab=#net9}
N 500 60 520 60 { lab=#net10}
N 500 40 520 40 { lab=#net11}
N 500 20 520 20 { lab=#net12}
N 200 140 400 140 { lab=fclkdiv2}
N 800 80 820 80 { lab=#net13}
N 800 100 820 100 { lab=#net14}
N 800 120 820 120 { lab=#net15}
N 800 60 820 60 { lab=#net16}
N 800 40 820 40 { lab=#net17}
N 800 20 820 20 { lab=#net18}
N 500 140 700 140 { lab=fclkdiv4}
N 1100 80 1120 80 { lab=#net19}
N 1100 100 1120 100 { lab=#net20}
N 1100 120 1120 120 { lab=#net21}
N 1100 60 1120 60 { lab=#net22}
N 1100 40 1120 40 { lab=#net23}
N 1100 20 1120 20 { lab=#net24}
N 800 140 1000 140 { lab=fclkdiv8}
N 1400 80 1420 80 { lab=#net25}
N 1400 100 1420 100 { lab=#net26}
N 1400 120 1420 120 { lab=#net27}
N 1400 60 1420 60 { lab=#net28}
N 1400 40 1420 40 { lab=#net29}
N 1400 20 1420 20 { lab=#net30}
N 1100 140 1300 140 { lab=fclkdiv16}
N 1700 80 1720 80 { lab=#net31}
N 1700 100 1720 100 { lab=#net32}
N 1700 120 1720 120 { lab=#net33}
N 1700 60 1720 60 { lab=#net34}
N 1700 40 1720 40 { lab=#net35}
N 1700 20 1720 20 { lab=#net36}
N 1400 140 1600 140 { lab=fclkdiv32}
N 2000 80 2020 80 { lab=#net37}
N 2000 100 2020 100 { lab=#net38}
N 2000 120 2020 120 { lab=#net39}
N 2000 60 2020 60 { lab=#net40}
N 2000 40 2020 40 { lab=#net41}
N 2000 20 2020 20 { lab=#net42}
N 1700 140 1900 140 { lab=fclkdiv64}
N 40 450 190 450 { lab=fclk}
N 40 140 40 450 { lab=fclk}
N 340 450 490 450 { lab=fclkdiv2}
N 340 140 340 450 { lab=fclkdiv2}
N 640 450 790 450 { lab=fclkdiv4}
N 640 140 640 450 { lab=fclkdiv4}
N 940 450 1090 450 { lab=fclkdiv8}
N 940 140 940 450 { lab=fclkdiv8}
N 1240 450 1390 450 { lab=fclkdiv16}
N 1240 140 1240 450 { lab=fclkdiv16}
N 1540 450 1690 450 { lab=fclkdiv32}
N 1540 140 1540 450 { lab=fclkdiv32}
N 1840 450 1990 450 { lab=fclkdiv64}
N 1840 140 1840 450 { lab=fclkdiv64}
N 300 280 300 620 { lab=q0}
N 300 620 2460 620 { lab=q0}
N 600 280 600 600 { lab=q1}
N 600 600 2460 600 { lab=q1}
N 900 280 900 580 { lab=q2}
N 900 580 2460 580 { lab=q2}
N 1200 280 1200 560 { lab=q3}
N 1200 560 2460 560 { lab=q3}
N 1500 280 1500 540 { lab=q4}
N 1500 540 2460 540 { lab=q4}
N 1800 280 1800 520 { lab=q5}
N 2100 280 2100 500 { lab=q6}
N 2140 450 2290 450 { lab=fclkdiv128}
N 2140 140 2140 450 { lab=fclkdiv128}
N 2000 140 2140 140 { lab=fclkdiv128}
N 2400 280 2400 480 { lab=q7}
N 2400 480 2460 480 { lab=q7}
N 2100 500 2460 500 { lab=q6}
N 1800 520 2460 520 { lab=q5}
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
.tran \{1/100/f\} \{64/f\}
.save all
"}
C {devices/vsource.sym} -310 170 0 0 {name=Vpb value=0.6}
C {devices/gnd.sym} -310 200 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} -310 140 0 0 {name=l7 sig_type=std_logic lab=Vpb}
C {devices/vsource.sym} -240 170 0 0 {name=Vnb value=0.6}
C {devices/gnd.sym} -240 200 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -240 140 0 0 {name=l10 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 200 140 3 0 {name=l23 sig_type=std_logic lab=fclkdiv2}
C {devices/vsource.sym} -160 170 0 0 {name=Vclk value="DC 0 PULSE(0 1.2 1n 1n 1n \{1/2/f\} \{1/f\})"}
C {devices/gnd.sym} -160 200 0 0 {name=l24 lab=GND}
C {devices/lab_pin.sym} -160 140 0 0 {name=l25 sig_type=std_logic lab=fclk}
C {clkgen/filter_clkgen.sym} 150 80 0 0 {name=X1}
C {clkgen/filter_clkgen.sym} 450 80 0 0 {name=X4}
C {devices/lab_pin.sym} 400 100 0 0 {name=l5 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 400 120 0 0 {name=l8 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 400 20 0 0 {name=l11 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 500 140 3 0 {name=l18 sig_type=std_logic lab=fclkdiv4}
C {clkgen/filter_clkgen.sym} 750 80 0 0 {name=X2}
C {devices/lab_pin.sym} 700 100 0 0 {name=l12 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 700 120 0 0 {name=l13 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 700 20 0 0 {name=l14 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 800 140 3 0 {name=l15 sig_type=std_logic lab=fclkdiv8}
C {clkgen/filter_clkgen.sym} 1050 80 0 0 {name=X5}
C {devices/lab_pin.sym} 1000 100 0 0 {name=l16 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 1000 120 0 0 {name=l22 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 1000 20 0 0 {name=l26 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1100 140 3 0 {name=l27 sig_type=std_logic lab=fclkdiv16}
C {clkgen/filter_clkgen.sym} 1350 80 0 0 {name=X6}
C {devices/lab_pin.sym} 1300 100 0 0 {name=l28 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 1300 120 0 0 {name=l29 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 1300 20 0 0 {name=l30 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1400 140 3 0 {name=l31 sig_type=std_logic lab=fclkdiv32}
C {clkgen/filter_clkgen.sym} 1650 80 0 0 {name=X7}
C {devices/lab_pin.sym} 1600 100 0 0 {name=l32 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 1600 120 0 0 {name=l33 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 1600 20 0 0 {name=l34 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 1700 140 3 0 {name=l35 sig_type=std_logic lab=fclkdiv64}
C {clkgen/filter_clkgen.sym} 1950 80 0 0 {name=X8}
C {devices/lab_pin.sym} 1900 100 0 0 {name=l36 sig_type=std_logic lab=Vpb}
C {devices/lab_pin.sym} 1900 120 0 0 {name=l37 sig_type=std_logic lab=Vnb}
C {devices/lab_pin.sym} 1900 20 0 0 {name=l38 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 2000 140 3 0 {name=l39 sig_type=std_logic lab=fclkdiv128}
C {T_flip_flop/t_ff_sc_lp.sym} 190 320 0 0 {name=X3}
C {devices/vdd.sym} 80 280 0 0 {name=l17 lab=VDD}
C {T_flip_flop/t_ff_sc_lp.sym} 490 320 0 0 {name=X9}
C {devices/vdd.sym} 380 280 0 0 {name=l19 lab=VDD}
C {T_flip_flop/t_ff_sc_lp.sym} 790 320 0 0 {name=X10}
C {T_flip_flop/t_ff_sc_lp.sym} 1090 320 0 0 {name=X11}
C {T_flip_flop/t_ff_sc_lp.sym} 1390 320 0 0 {name=X12}
C {T_flip_flop/t_ff_sc_lp.sym} 1690 320 0 0 {name=X13}
C {T_flip_flop/t_ff_sc_lp.sym} 1990 320 0 0 {name=X14}
C {devices/vdd.sym} 680 280 0 0 {name=l20 lab=VDD}
C {devices/vdd.sym} 980 280 0 0 {name=l21 lab=VDD}
C {devices/vdd.sym} 1280 280 0 0 {name=l40 lab=VDD}
C {devices/vdd.sym} 1580 280 0 0 {name=l41 lab=VDD}
C {devices/vdd.sym} 1880 280 0 0 {name=l42 lab=VDD}
C {devices/lab_pin.sym} 2460 480 2 0 {name=l43 sig_type=std_logic lab=q7}
C {devices/lab_pin.sym} 2460 500 2 0 {name=l44 sig_type=std_logic lab=q6}
C {devices/lab_pin.sym} 2460 520 2 0 {name=l45 sig_type=std_logic lab=q5}
C {devices/lab_pin.sym} 2460 540 2 0 {name=l46 sig_type=std_logic lab=q4}
C {devices/lab_pin.sym} 2460 560 2 0 {name=l47 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 2460 580 2 0 {name=l48 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 2460 600 2 0 {name=l49 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 2460 620 2 0 {name=l50 sig_type=std_logic lab=q0}
C {devices/vdd.sym} 2180 280 0 0 {name=l51 lab=VDD}
C {T_flip_flop/t_ff_sc_lp.sym} 2290 320 0 0 {name=X15}
