v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1180 -860 1180 -170 { lab=#net1}
N 1180 -170 1180 -160 { lab=#net1}
N 1100 -160 1180 -160 { lab=#net1}
N 1180 -220 1250 -220 { lab=#net1}
N 1100 -280 1180 -280 { lab=#net1}
N 1180 -340 1250 -340 { lab=#net1}
N 1100 -400 1180 -400 { lab=#net1}
N 1180 -460 1250 -460 { lab=#net1}
N 1100 -520 1180 -520 { lab=#net1}
N 1180 -580 1250 -580 { lab=#net1}
N 1100 -640 1180 -640 { lab=#net1}
N 1180 -700 1250 -700 { lab=#net1}
N 1100 -760 1180 -760 { lab=#net1}
N 1180 -820 1250 -820 { lab=#net1}
N 1020 -760 1020 -80 { lab=ctrl}
N 1020 -80 1320 -80 { lab=ctrl}
N 1320 -740 1320 -80 { lab=ctrl}
N 1250 -740 1320 -740 { lab=ctrl}
N 1020 -680 1100 -680 { lab=ctrl}
N 1020 -560 1100 -560 { lab=ctrl}
N 1020 -440 1100 -440 { lab=ctrl}
N 1020 -200 1100 -200 { lab=ctrl}
N 1020 -320 1100 -320 { lab=ctrl}
N 1250 -140 1320 -140 { lab=ctrl}
N 1250 -260 1320 -260 { lab=ctrl}
N 1250 -380 1320 -380 { lab=ctrl}
N 1250 -500 1320 -500 { lab=ctrl}
N 1250 -620 1320 -620 { lab=ctrl}
N 1020 -860 1080 -860 { lab=ctrl}
N 1020 -860 1020 -760 { lab=ctrl}
N 940 -780 1200 -780 { lab=e1}
N 940 -860 1020 -860 { lab=ctrl}
N 940 -720 1050 -720 { lab=p1}
N 940 -660 1200 -660 { lab=e2}
N 940 -600 1050 -600 { lab=p2}
N 940 -540 1200 -540 { lab=e3}
N 940 -480 1050 -480 { lab=p3}
N 940 -420 1200 -420 { lab=e4}
N 940 -360 1050 -360 { lab=p4}
N 940 -300 1200 -300 { lab=e5}
N 940 -240 1050 -240 { lab=p5}
N 940 -180 1200 -180 { lab=e6}
N 940 -120 1050 -120 { lab=p6}
N 1150 -120 1380 -120 { lab=p6_o}
N 1300 -180 1380 -180 { lab=e6_o}
N 1300 -300 1380 -300 { lab=e5_o}
N 1150 -240 1380 -240 { lab=p5_o}
N 1150 -360 1380 -360 { lab=p4_o}
N 1300 -420 1380 -420 { lab=e4_o}
N 1150 -480 1380 -480 { lab=p3_o}
N 1300 -540 1380 -540 { lab=e3_o}
N 1150 -600 1380 -600 { lab=p2_o}
N 1300 -660 1380 -660 { lab=e2_o}
N 1150 -720 1380 -720 { lab=p1_o}
N 1300 -780 1380 -780 { lab=e1_o}
C {transmission_gate/transmission_gate.sym} 1250 -780 0 0 {name=X12 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {inv/inv.sym} 1130 -860 0 0 {name=X13 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18}
C {devices/ipin.sym} 950 -860 0 0 {name=p1 lab=ctrl}
C {devices/ipin.sym} 950 -780 0 0 {name=p2 lab=e1}
C {devices/ipin.sym} 950 -660 0 0 {name=p3 lab=e2}
C {devices/ipin.sym} 950 -540 0 0 {name=p4 lab=e3}
C {devices/ipin.sym} 950 -420 0 0 {name=p5 lab=e4}
C {devices/ipin.sym} 950 -300 0 0 {name=p6 lab=e5}
C {devices/ipin.sym} 950 -180 0 0 {name=p7 lab=e6}
C {devices/ipin.sym} 950 -720 0 0 {name=p8 lab=p1}
C {devices/ipin.sym} 950 -600 0 0 {name=p9 lab=p2}
C {devices/ipin.sym} 950 -480 0 0 {name=p10 lab=p3}
C {devices/ipin.sym} 950 -360 0 0 {name=p11 lab=p4}
C {devices/ipin.sym} 950 -240 0 0 {name=p12 lab=p5}
C {devices/ipin.sym} 950 -120 0 0 {name=p13 lab=p6}
C {devices/opin.sym} 1370 -780 0 0 {name=p14 lab=e1_o}
C {devices/opin.sym} 1370 -660 0 0 {name=p15 lab=e2_o}
C {devices/opin.sym} 1370 -540 0 0 {name=p16 lab=e3_o}
C {devices/opin.sym} 1370 -420 0 0 {name=p17 lab=e4_o}
C {devices/opin.sym} 1370 -300 0 0 {name=p18 lab=e5_o}
C {devices/opin.sym} 1370 -180 0 0 {name=p19 lab=e6_o}
C {devices/opin.sym} 1370 -720 0 0 {name=p20 lab=p1_o}
C {devices/opin.sym} 1370 -600 0 0 {name=p21 lab=p2_o}
C {devices/opin.sym} 1370 -480 0 0 {name=p22 lab=p3_o}
C {devices/opin.sym} 1370 -360 0 0 {name=p23 lab=p4_o}
C {devices/opin.sym} 1370 -240 0 0 {name=p24 lab=p5_o}
C {devices/opin.sym} 1370 -120 0 0 {name=p25 lab=p6_o}
C {transmission_gate/transmission_gate.sym} 1250 -660 0 0 {name=X1 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1250 -540 0 0 {name=X2 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1250 -420 0 0 {name=X3 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1250 -300 0 0 {name=X4 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1250 -180 0 0 {name=X5 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1100 -120 0 0 {name=X6 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1100 -240 0 0 {name=X7 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1100 -360 0 0 {name=X8 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1100 -480 0 0 {name=X9 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1100 -600 0 0 {name=X10 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
C {transmission_gate/transmission_gate.sym} 1100 -720 0 0 {name=X11 Wpmos=3 Lpmos=0.18 Wnmos=1 Lnmos=0.18
}
