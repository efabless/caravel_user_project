v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -90 0 -50 0 { lab=fclk}
N -340 30 -320 30 { lab=fclk}
N 40 20 80 20 { lab=fclkb}
N 40 -20 80 -20 { lab=fclka}
C {devices/netlist.sym} -230 -270 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param fclk=\{256*10k\}
.param period=\{1/fclk\}
.param tend=\{4*period\}
.param fclk_dc=0.5
.tran \{1/fclk/100\} \{tend\}
.save all
"}
C {devices/vsource.sym} -340 -150 0 0 {name=VDD value="DC 1.2"}
C {devices/vdd.sym} -340 -180 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} -340 -120 0 0 {name=l38 lab=GND}
C {devices/vsource.sym} -340 60 0 0 {name=Vfclk value="DC 0 PULSE (0 1.2 1n 1n 1n \{fclk_dc*1/fclk\} \{1/fclk\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -340 90 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} -340 30 0 0 {name=l19 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} -90 0 0 0 {name=l1 sig_type=std_logic lab=fclk}
C {devices/lab_pin.sym} 80 -20 2 0 {name=l2 sig_type=std_logic lab=fclka}
C {devices/lab_pin.sym} 80 20 2 0 {name=l3 sig_type=std_logic lab=fclkb}
C {clkgen/comp_clks.sym} 0 0 0 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
