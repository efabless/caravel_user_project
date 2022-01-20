v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 860 -1210 890 -1210 { lab=VDD}
N 860 -1230 890 -1230 { lab=GND}
N 1220 -1185 1250 -1185 { lab=#net1}
N 1220 -1245 1220 -1185 { lab=#net1}
N 1220 -1245 1460 -1245 { lab=#net1}
N 1460 -1245 1460 -1185 { lab=#net1}
N 1430 -1185 1460 -1185 { lab=#net1}
N 1190 -1205 1250 -1205 { lab=f_clk}
N 1100 -1165 1250 -1165 { lab=rstb}
N 1430 -1205 1450 -1205 { lab=f_2}
N 1450 -1205 1450 -1135 { lab=f_2}
N 1250 -1135 1450 -1135 { lab=f_2}
N 1250 -1135 1250 -1105 { lab=f_2}
N 1430 -1085 1430 -1035 { lab=#net2}
N 1230 -1035 1430 -1035 { lab=#net2}
N 1230 -1085 1230 -1035 { lab=#net2}
N 1230 -1085 1250 -1085 { lab=#net2}
N 1120 -1165 1120 -1065 { lab=rstb}
N 1120 -1065 1250 -1065 { lab=rstb}
N 1430 -1105 1490 -1105 { lab=f_4}
N 1430 -965 1430 -915 { lab=#net3}
N 1230 -915 1430 -915 { lab=#net3}
N 1230 -965 1230 -915 { lab=#net3}
N 1230 -965 1250 -965 { lab=#net3}
N 1470 -1105 1470 -1015 { lab=f_4}
N 1250 -1015 1470 -1015 { lab=f_4}
N 1250 -1015 1250 -985 { lab=f_4}
N 1120 -1065 1120 -945 { lab=rstb}
N 1120 -945 1250 -945 { lab=rstb}
N 1430 -835 1430 -785 { lab=#net4}
N 1230 -785 1430 -785 { lab=#net4}
N 1230 -835 1230 -785 { lab=#net4}
N 1230 -835 1250 -835 { lab=#net4}
N 1250 -885 1470 -885 { lab=f_8}
N 1250 -885 1250 -855 { lab=f_8}
N 1120 -815 1250 -815 { lab=rstb}
N 1470 -985 1470 -885 { lab=f_8}
N 1430 -855 1490 -855 { lab=f_16}
N 1450 -1205 1490 -1205 { lab=f_2}
N 1430 -985 1490 -985 { lab=f_8}
N 1180 -1205 1190 -1205 { lab=f_clk}
N 1490 -855 1500 -855 { lab=f_16}
N 1120 -945 1120 -815 {}
C {devices/iopin.sym} 870 -1210 2 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 870 -1230 2 0 {name=p4 lab=GND}
C {sky130_stdcells/dfrbp_1.sym} 1340 -1185 0 0 {name=x2 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrbp_1.sym} 1340 -1085 0 0 {name=x4 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrbp_1.sym} 1340 -965 0 0 {name=x1 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrbp_1.sym} 1340 -835 0 0 {name=x6 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/ipin.sym} 1110 -1165 0 0 {name=p2 lab=rstb}
C {devices/opin.sym} 1480 -1205 0 0 {name=p6 lab=f_2}
C {devices/opin.sym} 1480 -1105 0 0 {name=p7 lab=f_4}
C {devices/opin.sym} 1480 -985 0 0 {name=p8 lab=f_8}
C {devices/opin.sym} 1490 -855 0 0 {name=p9 lab=f_16}
C {devices/ipin.sym} 1190 -1205 0 0 {name=p1 lab=f_clk}
