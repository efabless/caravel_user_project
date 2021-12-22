v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {LO generation} -370 120 1 0 0.4 0.4 {}
T {Phi1/Phi2 generation} -280 300 1 0 0.4 0.4 {}
N 110 -40 160 -40 { lab=opi}
N 110 -20 160 -20 { lab=omi}
N 110 0 160 0 { lab=opq}
N 110 20 160 20 { lab=omq}
N -340 -20 -80 -20 { lab=inp}
N -260 20 -80 20 { lab=inm}
N -340 120 -50 120 { lab=loi}
N -50 70 -50 120 { lab=loi}
N -300 200 -20 200 { lab=loq}
N -20 70 -20 200 { lab=loq}
N 140 40 140 60 { lab=thresh}
N 110 40 140 40 { lab=thresh}
N -240 280 20 280 { lab=phi1}
N 20 70 20 280 { lab=phi1}
N -190 360 50 360 { lab=phi2}
N 50 70 50 360 { lab=phi2}
N 80 70 80 440 { lab=phi3}
N -140 440 80 440 { lab=phi3}
C {devices/netlist.sym} -240 -340 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
.param flo=\{256*10k\}
.param lo_dc = 0.5
* ratio of phi / lo clk:
.param r_phi_lo = 1
.param phi_dc = 0.25
.param fphi = \{flo*r_phi_lo\}
.param tau=\{(16^2)*1/fphi\}
.param tend=\{4*tau\}
*start all caps with 0 charge:
*.ic included in cap symbols
.tran \{1/fphi/100\} \{tend\}
.save all
"}
C {devices/vsource.sym} -340 10 0 0 {name=Vin value="DC 0 SIN(0.6 0.3 \{flo\})"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -340 40 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 160 -40 2 0 {name=l1 sig_type=std_logic lab=opi}
C {devices/lab_pin.sym} -340 -20 0 0 {name=l5 sig_type=std_logic lab=inp}
C {devices/vsource.sym} -340 -150 0 0 {name=VDD value="DC 1.2"}
C {devices/vdd.sym} -340 -180 0 0 {name=l7 lab=VDD}
C {devices/lab_pin.sym} 160 -20 2 0 {name=l2 sig_type=std_logic lab=omi}
C {devices/lab_pin.sym} 160 0 2 0 {name=l9 sig_type=std_logic lab=opq}
C {devices/lab_pin.sym} 160 20 2 0 {name=l14 sig_type=std_logic lab=omq}
C {devices/vsource.sym} -260 50 0 0 {name=Vin1 value="DC 0 SIN(0.6 -0.3 \{flo\})"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -260 80 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -260 20 0 0 {name=l11 sig_type=std_logic lab=inm}
C {devices/vsource.sym} -340 150 0 0 {name=Vlo_i value="DC 0 PULSE (0 1.2 1n 1n 1n \{lo_dc*1/flo\} \{1/flo\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -340 180 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -300 230 0 0 {name=Vlo_q value="DC 0 PULSE (0 1.2 1n 1n 1n \{lo_dc*1/flo\} \{1/flo\} 90"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -300 260 0 0 {name=l16 lab=GND}
C {devices/vsource.sym} -240 310 0 0 {name=Vphi1 value="DC 0 PULSE (0 1.2 1n 1n 1n \{phi_dc*1/fphi\} \{1/fphi\} 0"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -240 340 0 0 {name=l31 lab=GND}
C {devices/vsource.sym} -190 390 0 0 {name=Vphi2 value="DC 0 PULSE (0 1.2 1n 1n 1n \{phi_dc*1/fphi\} \{1/fphi\} 240"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -190 420 0 0 {name=l33 lab=GND}
C {devices/gnd.sym} -340 -120 0 0 {name=l38 lab=GND}
C {devices/vsource.sym} 140 90 0 0 {name=Vthresh value="DC 0.6 PWL (0 0.6 \{tau\} 0.6 \{3*tau\} 0.6 \{4*tau\} 1.2)"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} 140 120 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 140 40 2 0 {name=l10 sig_type=std_logic lab=thresh}
C {devices/vsource.sym} -140 470 0 0 {name=Vphi3 value="DC 0 PULSE (0 1.2 1n 1n 1n \{phi_dc*1/fphi\} \{1/fphi\} 120"
*SIN (0.6 0.6 1k)"}
C {devices/gnd.sym} -140 500 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} -50 110 0 0 {name=l13 sig_type=std_logic lab=loi}
C {devices/lab_pin.sym} -20 190 0 0 {name=l15 sig_type=std_logic lab=loq}
C {devices/lab_pin.sym} 20 270 0 0 {name=l17 sig_type=std_logic lab=phi1}
C {devices/lab_pin.sym} 50 350 0 0 {name=l18 sig_type=std_logic lab=phi2}
C {devices/lab_pin.sym} 80 430 0 0 {name=l19 sig_type=std_logic lab=phi3}
C {wavelet_channel/wavelet_iq_thresh.sym} 0 0 0 0 {name=X1 W=20 L=20}
