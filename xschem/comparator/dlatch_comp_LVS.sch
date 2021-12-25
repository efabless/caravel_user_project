v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 340 -90 520 -90 { lab=#net1}
N 340 -110 340 -90 { lab=#net1}
C {/home/sky/fossi_cochlea/xschem/comparator/doubletaillatch.sym} 60 -40 0 0 {name=X1}
C {sky130_stdcells/xor2_1.sym} 580 -110 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 250 -100 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfxtp_1.sym} 430 -120 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/lab_pin.sym} 340 -130 0 0 {name=l17 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 160 -90 1 1 {name=l20 sig_type=std_logic lab=o1}
C {devices/lab_pin.sym} 160 -110 0 0 {name=l25 sig_type=std_logic lab=clkbar}
C {devices/ipin.sym} 60 -110 0 0 {name=p1 lab=vref1}
C {devices/opin.sym} 640 -110 0 0 {name=p2 lab=out}
C {devices/ipin.sym} 110 -140 0 0 {name=p3 lab=clk}
C {devices/ipin.sym} 110 -40 0 0 {name=p4 lab=clkbar}
C {devices/ipin.sym} 60 -70 0 0 {name=p5 lab=vref2}
