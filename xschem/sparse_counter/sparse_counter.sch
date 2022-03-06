v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {Setup Violation chances are meagre as the clock period is very large, so enough margin for setup violations to occur.
However, chances of hold violation are still there, though less than that of the clock tree.} -141070 -31930 0 0 0.4 0.4 {}
N -141620 -32070 -141600 -32070 { lab=rstb}
N -141620 -32070 -141620 -31370 { lab=rstb}
N -141620 -31370 -141600 -31370 { lab=rstb}
N -141690 -32070 -141620 -32070 { lab=rstb}
N -141420 -32110 -141390 -32110 { lab=o1}
N -141420 -32010 -141390 -32010 { lab=o2}
N -141420 -31910 -141390 -31910 { lab=o3}
N -141420 -31810 -141390 -31810 { lab=o4}
N -141420 -31710 -141390 -31710 { lab=o5}
N -141420 -31610 -141390 -31610 { lab=o6}
N -141420 -31510 -141390 -31510 { lab=o7}
N -141420 -31410 -141390 -31410 { lab=o8}
N -141620 -31970 -141600 -31970 { lab=rstb}
N -141620 -31870 -141600 -31870 { lab=rstb}
N -141620 -31770 -141600 -31770 { lab=rstb}
N -141620 -31670 -141600 -31670 { lab=rstb}
N -141620 -31570 -141600 -31570 { lab=rstb}
N -141620 -31470 -141600 -31470 { lab=rstb}
N -141640 -32110 -141600 -32110 { lab=clk1}
N -141640 -32090 -141600 -32090 { lab=d1}
N -141640 -32010 -141600 -32010 { lab=clk2}
N -141640 -31990 -141600 -31990 { lab=d2}
N -141640 -31910 -141600 -31910 { lab=clk3}
N -141640 -31890 -141600 -31890 { lab=d3}
N -141640 -31810 -141600 -31810 { lab=clk4}
N -141640 -31790 -141600 -31790 { lab=d4}
N -141640 -31710 -141600 -31710 { lab=clk5}
N -141640 -31690 -141600 -31690 { lab=d5}
N -141640 -31610 -141600 -31610 { lab=clk6}
N -141640 -31590 -141600 -31590 { lab=d6}
N -141640 -31510 -141600 -31510 { lab=clk7}
N -141640 -31490 -141600 -31490 { lab=d7}
N -141640 -31410 -141600 -31410 { lab=clk8}
N -141640 -31390 -141600 -31390 { lab=d8}
N -141890 -32180 -141860 -32180 { lab=GND}
N -141890 -32150 -141860 -32150 { lab=VDD}
C {sky130_stdcells/dfrtp_1.sym} -141510 -32090 0 0 {name=x20 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31990 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31890 0 0 {name=x5 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31790 0 0 {name=x10 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31690 0 0 {name=x11 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31590 0 0 {name=x12 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31490 0 0 {name=x13 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/dfrtp_1.sym} -141510 -31390 0 0 {name=x16 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {devices/iopin.sym} -141880 -32150 2 0 {name=p1 lab=VDD}
C {devices/iopin.sym} -141880 -32180 2 0 {name=p2 lab=GND}
C {devices/ipin.sym} -141680 -32070 0 0 {name=p3 lab=rstb}
C {devices/ipin.sym} -141630 -32110 0 0 {name=p4 lab=clk1}
C {devices/ipin.sym} -141630 -32090 0 0 {name=p5 lab=d1}
C {devices/ipin.sym} -141630 -32010 0 0 {name=p6 lab=clk2}
C {devices/ipin.sym} -141630 -31910 0 0 {name=p7 lab=clk3}
C {devices/ipin.sym} -141630 -31810 0 0 {name=p8 lab=clk4}
C {devices/ipin.sym} -141630 -31710 0 0 {name=p9 lab=clk5}
C {devices/ipin.sym} -141630 -31610 0 0 {name=p10 lab=clk6}
C {devices/ipin.sym} -141630 -31510 0 0 {name=p11 lab=clk7}
C {devices/ipin.sym} -141630 -31410 0 0 {name=p12 lab=clk8}
C {devices/ipin.sym} -141630 -31990 0 0 {name=p13 lab=d2}
C {devices/ipin.sym} -141630 -31890 0 0 {name=p14 lab=d3}
C {devices/ipin.sym} -141630 -31790 0 0 {name=p15 lab=d4}
C {devices/ipin.sym} -141630 -31690 0 0 {name=p16 lab=d5}
C {devices/ipin.sym} -141630 -31590 0 0 {name=p17 lab=d6}
C {devices/ipin.sym} -141630 -31490 0 0 {name=p18 lab=d7}
C {devices/ipin.sym} -141630 -31390 0 0 {name=p19 lab=d8}
C {devices/opin.sym} -141400 -32110 0 0 {name=p20 lab=o1}
C {devices/opin.sym} -141400 -32010 0 0 {name=p21 lab=o2}
C {devices/opin.sym} -141400 -31910 0 0 {name=p22 lab=o3}
C {devices/opin.sym} -141400 -31810 0 0 {name=p23 lab=o4}
C {devices/opin.sym} -141400 -31710 0 0 {name=p24 lab=o5}
C {devices/opin.sym} -141400 -31610 0 0 {name=p25 lab=o6}
C {devices/opin.sym} -141400 -31510 0 0 {name=p26 lab=o7}
C {devices/opin.sym} -141400 -31410 0 0 {name=p27 lab=o8}
