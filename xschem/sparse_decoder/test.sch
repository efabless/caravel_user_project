v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -2760 -632.5 -2760 -612.5 { lab=#net1}
N -2800 -760 -2800 -740 { lab=#net2}
N -2760 -760 -2760 -740 { lab=#net3}
N -2740 -780 -2720 -780 { lab=#net4}
N -2740 -820 -2720 -820 { lab=#net4}
N -2740 -860 -2720 -860 { lab=#net5}
N -2760 -900 -2760 -880 { lab=#net6}
N -2800 -900 -2800 -880 { lab=#net7}
N -2870 -780 -2820 -780 { lab=GND}
N -2840 -820 -2820 -820 { lab=#net8}
N -2880 -860 -2820 -860 { lab=VDD}
N -2580 -820 -2540 -820 { lab=out}
N -2720 -820 -2680 -820 { lab=#net4}
N -2690 -820 -2690 -760 { lab=#net4}
N -2720 -760 -2690 -760 { lab=#net4}
N -2720 -780 -2720 -760 { lab=#net4}
N -2880 -890 -2880 -860 { lab=VDD}
N -2880 -780 -2870 -780 { lab=GND}
N -2880 -780 -2880 -750 { lab=GND}
C {devices/netlist.sym} -2555 -1060 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
*.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
*.ic v(gnd)=0 
.tran 0.1 100
.save all
"}
C {devices/vsource.sym} -2690 -1000 0 0 {name=V1 value=1.2}
C {devices/vdd.sym} -2690 -1030 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} -2690 -970 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -2760 -582.5 0 1 {name=V2 value="DC 0 PWL(0 1.2 100 1.2)"}
C {devices/gnd.sym} -2760 -552.5 0 1 {name=l7 lab=GND}
C {decoder/decoder_cell_0.sym} -2900 -730 0 0 {name=X1}
C {decoder/bottom_peripheral_cell.sym} -2990 -740 0 0 {name=X2}
C {devices/lab_pin.sym} -2540 -820 2 0 {name=l2 sig_type=std_logic lab=out}
C {inv/inv.sym} -2630 -820 0 0 {name=X3 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/gnd.sym} -2880 -750 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} -2880 -890 0 0 {name=l3 lab=VDD}
