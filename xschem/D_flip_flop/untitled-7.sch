v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1150 -1340 1180 -1340 { lab=d}
N 1360 -1360 1390 -1360 { lab=q}
N 1360 -1340 1390 -1340 { lab=#net1}
N 1180 -1320 1180 -1275 { lab=#net2}
N 1180 -1275 1205 -1275 { lab=#net2}
C {sky130_stdcells/dfrbp_1.sym} 1270 -1340 0 0 {name=x15 VGND=gnd VNB=gnd VPB=vdd VPWR=vdd prefix=sky130_fd_sc_lp__ }
C {devices/gnd.sym} 1180 -1420 2 0 {name=l89 lab=GND}
C {devices/vsource.sym} 1180 -1390 2 1 {name=V10 value="DC 0 PULSE(0 1.2 0 0 0 \{duty_cycle*1/f\} \{1/f\})"}
C {devices/vsource.sym} 1150 -1310 0 1 {name=V9 value="DC 0 PWL(0 1.2 2.700u 1.2 2.7001u 0 195.32u 0 500u 0)"

}
C {devices/gnd.sym} 1150 -1280 0 0 {name=l1 lab=GND}
C {devices/netlist.sym} 1375 -1560 0 0 {name=s1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-18 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {devices/lab_pin.sym} 1150 -1340 0 0 {name=l2 sig_type=std_logic lab=d}
C {devices/lab_pin.sym} 1180 -1360 0 0 {name=l3 sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1390 -1360 2 0 {name=l4 sig_type=std_logic lab=q}
C {devices/vsource.sym} 1205 -1245 0 1 {name=V1 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {devices/gnd.sym} 1205 -1215 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 870 -1350 0 1 {name=V2 value=1.2
*"DC 0 PWL(0 1.2 2.1571u 1.2 2.1574u 0 195.32u 0 500u 0)"
}
C {devices/gnd.sym} 870 -1320 0 0 {name=l6 lab=GND}
C {devices/vdd.sym} 870 -1380 0 0 {name=l7 lab=VDD}
