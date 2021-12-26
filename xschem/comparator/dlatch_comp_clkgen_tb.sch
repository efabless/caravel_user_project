v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 540 -80 720 -80 { lab=o2}
N 540 -100 540 -80 { lab=o2}
N 540 50 720 50 { lab=o2d}
N 540 30 540 50 { lab=o2d}
N 80 260 120 260 { lab=clk}
N 20 220 120 220 { lab=Vbias}
N 100 240 120 240 { lab=Vbias}
N 100 220 100 240 { lab=Vbias}
N 100 140 120 140 { lab=VDD}
N 220 140 260 140 { lab=phi1}
N 220 160 260 160 { lab=phi1b}
N 220 180 260 180 { lab=phi2}
N 220 200 260 200 { lab=phi2b}
N 220 220 240 220 { lab=#net1}
N 220 240 240 240 { lab=#net2}
N 220 260 240 260 { lab=#net3}
C {comparator/doubletaillatch.sym} 260 -30 0 0 {name=X1}
C {devices/code_shown.sym} 30 -425 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.tran 10u 1m
.save all
"}
C {devices/vsource.sym} 80 290 0 0 {name=V6 value=PULSE(0,1,0,1n,1n,2u,4u)}
C {devices/vsource.sym} 60 -170 0 0 {name=V8 value=sin(0.6,0.1,5000)}
C {devices/vsource.sym} 60 -70 0 0 {name=V9 value=0.55}
C {devices/vsource.sym} 500 -260 0 0 {name=vdd value=1.2}
C {devices/vdd.sym} 500 -290 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 500 -230 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 60 -40 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 60 -100 0 0 {name=l4 sig_type=std_logic lab=Vinm}
C {devices/lab_pin.sym} 60 -200 0 0 {name=l5 sig_type=std_logic lab=Vinp}
C {devices/lab_pin.sym} 80 260 0 0 {name=l7 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 80 320 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 60 -140 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 310 -30 0 0 {name=l13 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 310 -130 0 0 {name=l14 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 920 -100 0 1 {name=l19 sig_type=std_logic lab=out}
C {sky130_stdcells/xor2_1.sym} 780 -100 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 260 -100 0 0 {name=l11 sig_type=std_logic lab=Vinp}
C {devices/lab_pin.sym} 260 -60 0 0 {name=l12 sig_type=std_logic lab=Vinm}
C {sky130_stdcells/dfxtp_1.sym} 450 -90 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 630 -110 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 540 -120 1 0 {name=l17 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 360 -80 1 1 {name=l20 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 540 -80 1 1 {name=l21 sig_type=std_logic lab=o2}
C {devices/lab_pin.sym} 720 -120 3 1 {name=l22 sig_type=std_logic lab=o3}
C {devices/lab_pin.sym} 360 -100 1 0 {name=l25 sig_type=std_logic lab=phi1b}
C {sky130_stdcells/buf_1.sym} 880 -100 0 0 {name=x6 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 920 30 0 1 {name=l15 sig_type=std_logic lab=outd}
C {sky130_stdcells/xor2_1.sym} 780 30 0 0 {name=x4 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 450 40 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 630 20 0 0 {name=x7 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 540 10 1 0 {name=l16 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 180 50 2 1 {name=l18 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 540 50 1 1 {name=l23 sig_type=std_logic lab=o2d}
C {devices/lab_pin.sym} 720 10 3 1 {name=l24 sig_type=std_logic lab=o3d}
C {devices/lab_pin.sym} 360 30 1 0 {name=l26 sig_type=std_logic lab=phi2}
C {sky130_stdcells/buf_1.sym} 880 30 0 0 {name=x8 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dlxtp_1.sym} 270 60 0 0 {name=x9 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 180 70 0 0 {name=l27 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 360 50 1 1 {name=l28 sig_type=std_logic lab=o1d}
C {clkgen/filter_clkgen.sym} 170 200 0 0 {name=X2}
C {devices/vsource.sym} 20 250 0 0 {name=V1 value=0.6}
C {devices/gnd.sym} 20 280 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 20 220 0 0 {name=l8 sig_type=std_logic lab=Vbias}
C {devices/vdd.sym} 100 140 0 0 {name=l29 lab=VDD}
C {devices/lab_pin.sym} 260 140 2 0 {name=l30 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 260 160 2 0 {name=l31 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 260 180 2 0 {name=l32 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 260 200 2 0 {name=l33 sig_type=std_logic lab=phi2b}
