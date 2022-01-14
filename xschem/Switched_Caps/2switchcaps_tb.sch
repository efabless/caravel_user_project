v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Stay ON through first phi1} -280 0 0 0 0.2 0.2 {}
N -100 0 -70 0 { lab=in}
N 70 0 100 0 { lab=out}
N -410 -50 -370 -50 { lab=in}
N 20 -140 20 -60 { lab=phi2b}
N 20 80 20 120 { lab=phi2}
N -20 80 -20 200 { lab=phi1}
N -20 -80 -20 -60 { lab=phi1b}
N 20 -140 70 -140 { lab=phi2b}
C {devices/netlist.sym} -240 -400 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param fmax=2560k
.param f=\{fmax/1\}
*do we need to scale the input size with f/fmax?
.param input=1.2
.param duty_cycle=0.4
*number of 1/f cycles to sim
.param N=20 
*.ic conditions are set inside cap sym
.tran \{1/f/100\} \{N*1/f\}
.save all
"}
C {devices/vsource.sym} -410 -20 0 0 {name=Vin value="PULSE (0 input 1n 1n 1n \{(0.25+duty_cycle/2)*1/f\} \{N/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -410 10 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 100 0 2 0 {name=l1 sig_type=std_logic lab=out}
C {Switched_Caps/2switchcaps.sym} 0 0 0 0 {name=X1 Wcap=20 Lcap=20}
C {devices/lab_pin.sym} -100 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -370 -50 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -410 -170 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -410 -140 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -410 -200 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -20 230 0 0 {name=Vphi1 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 260 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 100 0 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 100 2 0 {name=l13 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} -20 -110 2 0 {name=Vphi1b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 -140 2 0 {name=l2 lab=GND}
C {devices/vsource.sym} 20 150 0 0 {name=Vphi2 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 20 180 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 70 -110 0 0 {name=Vphi2b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 70 -80 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -20 -70 0 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 70 -140 2 0 {name=l14 sig_type=std_logic lab=phi2b}
