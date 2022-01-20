v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 6000 -1005 6195 -1005 { lab=pol}
N 6065 -985 6195 -985 { lab=event}
N 6140 -965 6195 -965 { lab=fclk}
N 6175 -945 6195 -945 { lab=rstb}
N 6225 -1055 6225 -1035 { lab=VDD}
N 6265 -1055 6265 -1035 { lab=GND}
N 6295 -1005 6310 -1005 { lab=ro_p}
N 6295 -985 6310 -985 { lab=ro_e}
N 6115 -965 6140 -965 { lab=fclk}
N 6115 -965 6115 -895 { lab=fclk}
C {readout/ro_cell.sym} 3165 -485 0 0 {name=X1}
C {devices/vsource.sym} 6115 -870 0 1 {name=V1 value="DC 0 PULSE(0 1.2 1n 1n 1n \{1/(2*f)\} \{1/f\})"}
C {devices/vsource.sym} 6175 -915 0 0 {name=V2 value="DC 0 PWL(0 0 0.99u 0 1u 1.2 2u 1.2 2.01u 0 1000u 0)"}
C {devices/vsource.sym} 6065 -955 0 1 {name=V3 value=1.2}
C {devices/vsource.sym} 6000 -975 0 1 {name=V4 value=1.2}
C {devices/gnd.sym} 6175 -885 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 6115 -840 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 6065 -925 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 6000 -945 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 5915 -1035 0 0 {name=V5 value=1.2}
C {devices/gnd.sym} 5915 -1005 0 0 {name=l5 lab=GND}
C {devices/vdd.sym} 5915 -1065 0 0 {name=l6 lab=VDD}
C {devices/lab_pin.sym} 6000 -1005 0 0 {name=l7 sig_type=std_logic lab=pol}
C {devices/lab_pin.sym} 6065 -985 0 0 {name=l8 sig_type=std_logic lab=event}
C {devices/lab_pin.sym} 6115 -900 0 0 {name=l9 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} 6175 -945 0 0 {name=l10 sig_type=std_logic lab=rstb}
C {devices/lab_pin.sym} 6225 -1055 0 0 {name=l11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 6265 -1055 2 0 {name=l12 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 6310 -1005 2 0 {name=l13 sig_type=std_logic lab=ro_p}
C {devices/lab_pin.sym} 6310 -985 2 0 {name=l14 sig_type=std_logic lab=ro_e}
C {devices/netlist.sym} 6265 -1220 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
