v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 3040 -1290 3040 -1250 { lab=#net1}
N 3040 -1290 3500 -1290 { lab=#net1}
N 3500 -1290 3500 -1210 { lab=#net1}
N 2820 -1200 2940 -1200 { lab=RST}
N 2940 -1400 2940 -1200 { lab=RST}
N 2940 -1400 2990 -1400 { lab=RST}
N 2940 -1000 3020 -1000 { lab=#net2}
N 2940 -1210 3040 -1210 { lab=RST}
N 2940 -1200 2940 -1160 { lab=RST}
N 2940 -1080 2940 -1000 { lab=#net2}
N 3160 -1190 3160 -1000 { lab=#net2}
N 3020 -1040 4210 -1040 { lab=Clk}
N 3510 -1250 3530 -1250 { lab=RST}
N 3510 -1400 3510 -1250 { lab=RST}
N 3530 -1320 3530 -1290 { lab=#net3}
N 3530 -1320 3890 -1320 { lab=#net3}
N 3650 -1270 3650 -1230 { lab=#net4}
N 3620 -1190 3650 -1190 { lab=#net5}
N 3890 -1320 3990 -1320 { lab=#net3}
N 3990 -1320 3990 -1210 { lab=#net3}
N 3500 -1360 3500 -1290 { lab=#net1}
N 3500 -1360 3990 -1360 { lab=#net1}
N 4210 -1040 4460 -1040 { lab=Clk}
N 4110 -1340 4110 -1220 { lab=#net6}
N 4110 -1180 4110 -1000 { lab=#net2}
N 4130 -1400 4130 -1270 { lab=RST}
N 4130 -1270 4160 -1270 { lab=RST}
N 4160 -1340 4160 -1310 { lab=Q2}
N 4160 -1340 4570 -1340 { lab=Q2}
N 4230 -1200 4230 -1190 { lab=#net7}
N 4230 -1190 4280 -1190 { lab=#net7}
N 4280 -1290 4280 -1230 { lab=#net8}
N 4570 -1340 4620 -1340 { lab=Q2}
N 4620 -1340 4620 -1210 { lab=Q2}
N 4460 -1040 4510 -1040 { lab=Clk}
N 3020 -1000 4110 -1000 { lab=#net2}
N 2990 -1400 4130 -1400 { lab=RST}
N 3480 -1230 3500 -1230 { lab=#net1}
N 3480 -1230 3480 -960 { lab=#net1}
N 3750 -960 3990 -960 { lab=#net3}
N 3990 -960 4320 -960 { lab=#net3}
N 4360 -960 4610 -960 { lab=Q2}
N 4610 -960 4620 -960 { lab=Q2}
N 3740 -960 3750 -960 { lab=#net3}
N 4350 -960 4360 -960 { lab=Q2}
N 3990 -1210 4010 -1210 { lab=#net3}
N 4010 -1210 4010 -960 { lab=#net3}
N 4620 -1210 4640 -1210 { lab=Q2}
N 4640 -1210 4640 -960 { lab=Q2}
N 4620 -960 4640 -960 { lab=Q2}
N 4620 -960 4620 -900 { lab=Q2}
N 3480 -960 3710 -960 { lab=#net1}
N 3500 -1170 3500 -1140 { lab=#net2}
N 3500 -1140 3520 -1140 { lab=#net2}
N 3520 -1140 3520 -1000 { lab=#net2}
C {sky130_stdcells/or2_1.sym} 3710 -1210 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 4050 -1340 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 3100 -1230 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/or2_1.sym} 3220 -1210 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/inv_1.sym} 2940 -1120 1 0 {name=x7 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 3560 -1190 0 0 {name=x8 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 3590 -1270 0 0 {name=x9 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 4170 -1200 0 0 {name=x10 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/and2_1.sym} 4220 -1290 0 0 {name=x11 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 2820 -1200 0 0 {name=l1 sig_type=std_logic lab=RST}
C {devices/lab_pin.sym} 4340 -830 3 0 {name=l4 sig_type=std_logic lab=Q1}
C {devices/lab_pin.sym} 4620 -900 3 0 {name=l5 sig_type=std_logic lab=Q2}
C {sky130_stdcells/or2_1.sym} 4340 -1210 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 3730 -830 3 0 {name=l6 sig_type=std_logic lab=Q0}
C {devices/vsource.sym} 2670 -1360 0 0 {name=V1 value=1.2}
C {devices/vdd.sym} 2670 -1390 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 2670 -1330 0 0 {name=l7 lab=GND}
C {devices/netlist.sym} 4760 -1560 0 0 {name=SPICE value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{40/f\}
.save all
"}
C {devices/gnd.sym} 3020 -980 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 3020 -1010 0 0 {name=V3 value="DC 0 PULSE(0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 3020 -1040 0 0 {name=l9 sig_type=std_logic lab=Clk}
C {devices/vsource.sym} 2820 -1170 0 0 {name=V2 value="DC 0 PWL(0 1.2 6u 1.2 6.1u 0 40u 0)"}
C {devices/gnd.sym} 2820 -1140 0 0 {name=l2 lab=GND}
C {exor_gate/exor_gate.sym} 3630 -1470 1 0 {name=X4}
C {exor_gate/exor_gate.sym} 4240 -1470 1 0 {name=X5}
C {T_flip_flop/T_flip_flop.sym} 3790 -910 0 0 {name=X6}
C {T_flip_flop/T_flip_flop.sym} 4420 -910 0 0 {name=X1}
C {T_flip_flop/T_flip_flop.sym} 3300 -910 0 0 {name=X2}
