v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Stay ON through first phi1} -300 80 0 0 0.2 0.2 {}
N -160 0 -130 0 { lab=in}
N 150 0 180 0 { lab=out}
N -420 40 -380 40 { lab=in}
N 20 -130 20 -50 { lab=phi2b}
N 20 50 20 90 { lab=phi2}
N -20 50 -20 170 { lab=phi1}
N -20 -70 -20 -50 { lab=phi1b}
N 20 -130 70 -130 { lab=phi2b}
N 350 0 380 0 { lab=in2}
N 660 0 690 0 { lab=out2}
N 530 50 530 90 { lab=phi2}
N 490 50 490 90 { lab=phi1}
N 490 -70 490 -50 { lab=phi1b}
N 530 -70 530 -50 { lab=phi2b}
N 350 -0 350 50 { lab=in2}
C {devices/netlist.sym} -240 -400 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param fmax=2560k
.param f=\{fmax/1\}
*do we need to scale the input size with f/fmax?
.param input=\{1.2\}
.param duty_cycle=0.4
*number of 1/f cycles to sim
.param N=1000
.ic v(in2)=1.2
*.ic conditions are set inside cap sym
.tran \{1/f/100\} \{N*1/f\}
.save all
"}
C {devices/vsource.sym} -420 70 0 0 {name=Vin value="PULSE (0 input 1n 1n 1n \{(0.25+duty_cycle/2)*1/f\} \{N/f\}"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -420 100 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 180 0 2 0 {name=l1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -160 0 0 0 {name=l4 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -380 40 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/vsource.sym} -420 -140 0 0 {name=VDD value="DC 1.2"}
C {devices/gnd.sym} -420 -110 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} -420 -170 0 0 {name=l7 lab=VDD}
C {devices/vsource.sym} -20 200 0 0 {name=Vphi1 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 230 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} -20 70 0 0 {name=l12 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 20 70 2 0 {name=l13 sig_type=std_logic lab=phi2}
C {devices/vsource.sym} -20 -100 2 0 {name=Vphi1b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -20 -130 2 0 {name=l2 lab=GND}
C {devices/vsource.sym} 20 120 0 0 {name=Vphi2 value="PULSE (0 1.2 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 20 150 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 70 -100 0 0 {name=Vphi2b value="PULSE (1.2 0 1n 1n 1n \{duty_cycle*1/f\} \{1/f\} 180"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 70 -70 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} -20 -60 0 0 {name=l11 sig_type=std_logic lab=phi1b}
C {devices/lab_pin.sym} 70 -130 2 0 {name=l14 sig_type=std_logic lab=phi2b}
C {Switched_Caps/16switchcaps_2phi.sym} 0 0 0 0 {name=X1 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 690 0 2 0 {name=l15 sig_type=std_logic lab=out2}
C {devices/lab_pin.sym} 350 0 0 0 {name=l16 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 490 90 3 0 {name=l17 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 530 90 3 0 {name=l18 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 490 -70 1 0 {name=l19 sig_type=std_logic lab=phi1b}
C {Switched_Caps/16switchcaps_2phi.sym} 510 0 0 0 {name=X2 Wcap1=4 Lcap1=2.5 Wcap2=4 Lcap2=25
*name=X1 Wcap1=4 Lcap1=10 Wcap2=2.5 Lcap2=25
}
C {devices/lab_pin.sym} 530 -70 1 0 {name=l20 sig_type=std_logic lab=phi2b}
C {sky130_fd_pr/cap_mim_m3_1.sym} 350 80 0 0 {name=C1 model=cap_mim_m3_1 W=4 L=25 MF=1 spiceprefix=X}
C {devices/gnd.sym} 350 110 0 0 {name=l21 lab=GND}
