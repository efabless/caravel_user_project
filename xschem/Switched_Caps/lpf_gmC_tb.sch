v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Stay ON through first phi1} -300 80 0 0 0.2 0.2 {}
N -460 40 -420 40 { lab=in}
C {devices/netlist.sym} -240 -400 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param fmax=2560k
.param f=\{fmax/(2^7)\}
*do we need to scale the input size with f/fmax?
.param input=\{1.2\}
*.param input=\{1.2*10\}
.param duty_cycle=0.4
*number of 1/f cycles to sim
.param N=1000
.ic v(in2)=1.2 v(in3)=1.2
*.ic conditions are set inside cap sym
.tran \{1/f/100\} \{N*1/f\}
.save all
"}
C {devices/vsource.sym} -460 70 0 0 {name=Vin value="PULSE (0 input 1n 1n 1n \{(0.25+duty_cycle/2)*1/f\} \{N/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -460 100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -420 40 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -460 -140 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -460 -110 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -460 -170 0 0 {name=l7 lab=VDD}
