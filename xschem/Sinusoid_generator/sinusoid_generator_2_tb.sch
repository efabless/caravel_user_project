v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
T {ROM} 3985 8665 0 0 0.6 0.6 {}
T {Sparse Decoder} 3305 8660 0 0 0.6 0.6 {}
T {Gray Counter} 2920 8660 0 0 0.6 0.6 {}
N 3145 8780 3265 8780 { lab=A0}
N 3145 8800 3265 8800 { lab=A1}
N 3145 8820 3265 8820 { lab=A2}
N 3145 8840 3265 8840 { lab=A3}
N 3145 8860 3265 8860 { lab=A4}
N 3145 8880 3265 8880 { lab=A5}
N 3145 8900 3175 8900 { lab=#net1}
N 3145 8920 3175 8920 { lab=#net2}
N 3035 8970 3035 8990 { lab=Clk}
N 3585 8780 3905 8780 { lab=s2}
N 3585 8800 3905 8800 { lab=s3}
N 3585 8820 3905 8820 { lab=s4}
N 3585 8840 3905 8840 { lab=s9}
N 3585 8860 3905 8860 { lab=s10}
N 3585 8880 3905 8880 { lab=s13}
N 3585 8900 3905 8900 { lab=s17}
N 3585 8920 3905 8920 { lab=s21}
N 3585 8940 3905 8940 { lab=s23}
N 3585 8980 3850 8980 { lab=s32}
N 3850 8960 3850 8980 { lab=s32}
N 3850 8960 3905 8960 { lab=s32}
N 3585 9000 3865 9000 { lab=s40}
N 3865 8980 3865 9000 { lab=s40}
N 3865 8980 3905 8980 { lab=s40}
N 3810 8940 3810 9010 { lab=s23}
N 3810 9010 3810 9015 { lab=s23}
N 3810 9015 3905 9015 { lab=s23}
N 3585 8960 3805 8960 { lab=s31}
N 3805 8960 3805 9030 { lab=s31}
N 3805 9030 3805 9035 { lab=s31}
N 3805 9035 3905 9035 { lab=s31}
N 3800 9000 3800 9055 { lab=s40}
N 3800 9055 3905 9055 { lab=s40}
N 3585 9020 3785 9020 { lab=s42}
N 3790 9075 3905 9075 { lab=s42}
N 3790 9020 3790 9075 { lab=s42}
N 3785 9020 3790 9020 { lab=s42}
N 3585 9040 3775 9040 { lab=s46}
N 3775 9040 3775 9095 { lab=s46}
N 3775 9095 3905 9095 { lab=s46}
N 3765 9115 3905 9115 { lab=s50}
N 3765 9060 3765 9115 { lab=s50}
N 3585 9060 3765 9060 { lab=s50}
N 3585 9080 3755 9080 { lab=s53}
N 3755 9080 3755 9135 { lab=s53}
N 3755 9135 3905 9135 { lab=s53}
N 3585 9100 3745 9100 { lab=s54}
N 3745 9100 3745 9155 { lab=s54}
N 3745 9155 3905 9155 { lab=s54}
N 3585 9120 3730 9120 { lab=s59}
N 3730 9120 3735 9120 { lab=s59}
N 3735 9120 3735 9170 { lab=s59}
N 3735 9170 3735 9175 { lab=s59}
N 3735 9175 3905 9175 { lab=s59}
N 3585 9140 3725 9140 { lab=s60}
N 3725 9140 3725 9195 { lab=s60}
N 3725 9195 3905 9195 { lab=s60}
N 3585 9160 3715 9160 { lab=s61}
N 3715 9160 3715 9215 { lab=s61}
N 3715 9215 3905 9215 { lab=s61}
N 4265 8880 4325 8880 { lab=#net3}
N 4265 9115 4325 9115 { lab=#net4}
N 3175 8900 3260 8900 { lab=#net1}
N 3260 8900 3260 9230 { lab=#net1}
N 3260 9230 4275 9230 { lab=#net1}
N 4275 9155 4275 9230 { lab=#net1}
N 4275 9155 4325 9155 { lab=#net1}
N 3175 8920 3235 8920 { lab=#net2}
N 3235 8920 3235 9255 { lab=#net2}
N 3235 9255 4465 9255 { lab=#net2}
N 4325 8880 4485 8880 { lab=#net3}
N 4325 9115 4520 9115 { lab=#net4}
N 4325 9155 4520 9155 { lab=#net1}
N 4485 8880 4520 8880 { lab=#net3}
N 4475 8920 4520 8920 { lab=#net2}
N 4475 8920 4475 9255 { lab=#net2}
N 4470 9255 4475 9255 { lab=#net2}
N 4465 9255 4470 9255 { lab=#net2}
N 2915 8715 3345 8715 { lab=GND}
N 3345 8715 3345 8740 { lab=GND}
N 3495 8675 3495 8740 { lab=VDD}
N 2915 8675 3495 8675 { lab=VDD}
N 2988.75 8715 2988.75 8730 { lab=GND}
N 3088.75 8675 3088.75 8730 { lab=VDD}
C {devices/netlist.sym} 5040 8585 0 0 {name=SPICE1 value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /home/sky/sky130A/libs.ref/sky130_fd_sc_lp/spice/sky130_fd_sc_lp.spice
.options abstol=1e-14 reltol=1e-4
.param f=2560k
.param duty_cycle=0.5
*.ic v(Q)=0 v(Q_inv)=1 v(x1.net1)=0
.tran \{(1/100)*(1/f)\} \{256/f\}
.save all
"}
C {devices/lab_pin.sym} 3585 8780 2 0 {name=l21 sig_type=std_logic lab=s2}
C {devices/lab_pin.sym} 3585 8800 2 0 {name=l22 sig_type=std_logic lab=s3}
C {devices/lab_pin.sym} 3585 8820 2 0 {name=l23 sig_type=std_logic lab=s4}
C {devices/lab_pin.sym} 3585 8840 2 0 {name=l24 sig_type=std_logic lab=s9}
C {devices/lab_pin.sym} 3585 8860 2 0 {name=l25 sig_type=std_logic lab=s10}
C {devices/lab_pin.sym} 3585 8880 2 0 {name=l26 sig_type=std_logic lab=s13}
C {devices/lab_pin.sym} 3585 8900 2 0 {name=l27 sig_type=std_logic lab=s17}
C {devices/lab_pin.sym} 3585 8920 2 0 {name=l28 sig_type=std_logic lab=s21}
C {devices/lab_pin.sym} 3585 8940 2 0 {name=l29 sig_type=std_logic lab=s23}
C {devices/lab_pin.sym} 3585 8960 2 0 {name=l30 sig_type=std_logic lab=s31}
C {devices/lab_pin.sym} 3585 8980 2 0 {name=l31 sig_type=std_logic lab=s32}
C {devices/lab_pin.sym} 3585 9000 2 0 {name=l32 sig_type=std_logic lab=s40}
C {devices/lab_pin.sym} 3585 9020 2 0 {name=l33 sig_type=std_logic lab=s42}
C {devices/lab_pin.sym} 3585 9040 2 0 {name=l34 sig_type=std_logic lab=s46}
C {devices/lab_pin.sym} 3585 9060 2 0 {name=l35 sig_type=std_logic lab=s50}
C {devices/lab_pin.sym} 3585 9080 2 0 {name=l36 sig_type=std_logic lab=s53}
C {devices/lab_pin.sym} 3585 9100 2 0 {name=l37 sig_type=std_logic lab=s54}
C {devices/lab_pin.sym} 3585 9120 2 0 {name=l38 sig_type=std_logic lab=s59}
C {devices/lab_pin.sym} 3585 9140 2 0 {name=l39 sig_type=std_logic lab=s60}
C {devices/lab_pin.sym} 3585 9160 2 0 {name=l40 sig_type=std_logic lab=s61}
C {devices/vsource.sym} 2725 8830 0 0 {name=V2 value=1.2}
C {devices/gnd.sym} 2725 8860 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 2725 8800 0 0 {name=l15 lab=VDD}
C {devices/lab_pin.sym} 3265 8880 0 0 {name=l14 sig_type=std_logic lab=A5}
C {devices/lab_pin.sym} 3265 8860 0 0 {name=l16 sig_type=std_logic lab=A4}
C {devices/lab_pin.sym} 3265 8840 0 0 {name=l17 sig_type=std_logic lab=A3}
C {devices/lab_pin.sym} 3265 8820 0 0 {name=l18 sig_type=std_logic lab=A2}
C {devices/lab_pin.sym} 3265 8800 0 0 {name=l19 sig_type=std_logic lab=A1}
C {devices/lab_pin.sym} 3265 8780 0 0 {name=l20 sig_type=std_logic lab=A0}
C {devices/vsource.sym} 2915 8830 0 0 {name=V8 value=1.2}
C {devices/gnd.sym} 2915 8860 0 0 {name=l85 lab=GND}
C {devices/lab_pin.sym} 2915 8800 0 0 {name=l86 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 2915 8895 0 0 {name=l87 sig_type=std_logic lab=RST_bar}
C {devices/vsource.sym} 2915 8925 0 1 {name=V9 value="DC 0 PWL(0 0 2u 0 2.01u 1.2 10u 1.2)"}
C {devices/gnd.sym} 2915 8955 0 0 {name=l88 lab=GND}
C {devices/gnd.sym} 3035 9050 0 0 {name=l89 lab=GND}
C {devices/vsource.sym} 3035 9020 0 1 {name=V10 value="DC 0 PULSE(0 1.2 \{2/f\} 1n 1n \{duty_cycle*1/f\} \{1/f\})"}
C {devices/lab_pin.sym} 3035 8990 0 0 {name=l90 sig_type=std_logic lab=Clk}
C {Asyn_rst_gray_counter/asyn_rst_gray_counter.sym} 8808.75 9175 0 0 {name=X1}
C {sparse_nor/sparse_nor.sym} 4805 2895 0 0 {name=X2}
C {sparse_nor/sparse_nor.sym} 4805 2660 0 0 {name=X3}
C {devices/lab_pin.sym} 4640 8900 2 0 {name=l1 sig_type=std_logic lab=sin_out}
C {devices/lab_pin.sym} 4640 9135 2 0 {name=l2 sig_type=std_logic lab=cos_out}
C {sky130_stdcells/xor2_1.sym} 4580 8900 0 0 {name=x3 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sky130_stdcells/xor2_1.sym} 4580 9135 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_lp__ }
C {sparse_decoder/sparse_decoder_crude.sym} 695 5930 0 0 {name=X4}
C {devices/lab_pin.sym} 2915 8675 0 0 {name=l3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2915 8715 0 0 {name=l4 sig_type=std_logic lab=GND}
