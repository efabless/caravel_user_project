v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -180 0 -180 20 { lab=in}
N 120 0 120 20 { lab=out}
N -180 130 -100 130 { lab=ctrl}
N -180 0 -50 0 { lab=in}
N 50 0 120 0 { lab=out}
N -0 40 0 130 { lab=#net1}
N -180 -0 -50 0 { lab=in}
N -100 -40 -100 130 { lab=ctrl}
N -100 -40 0 -40 { lab=ctrl}
C {devices/vsource.sym} -180 160 0 0 {name=Vphi value="DC 0 PULSE (1.2 0 1u 1u 1u \{T\} \{2*T\})"}
C {devices/gnd.sym} 120 80 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 120 0 2 0 {name=l1 sig_type=std_logic lab=out}
C {devices/code_shown.sym} -800 -350 0 0 {name=SPICE only_toplevel=false value="
.lib /home/sky/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.options abstol=1e-14 reltol=1e-4
*.tran 10n 250u
.param T=1m
*.tran 10u 2m

* from https://sourceforge.net/p/ngspice/ngspice/ci/master/tree/examples/Monte_Carlo/MonteCarlo.sp 

.control
let T_start = 5u
let T_stop = 10u
let T_step = 1u
let T_act = T_start

let run = 0
set curplot=new          $ create a new plot
set scratch=$curplot     $ store its name to 'scratch'
setplot $scratch         $ make 'scratch' the active plot

* loop
while T_act le T_stop
  alterparam T=T_act
  ac dec 100 10 20k

  set run = $&run             $ create a variable from the vector
  set dt = $curplot           $ store the current plot to dt
  setplot $scratch            $ make 'scratch' the active plot
  let vout\{$run\}=\{$dt\}.v(out) $ store the output vector to plot 'scratch'
  setplot $dt                 $ go back to the previous plot
  let run = run + 1
  let T_act = T_act + T_step
end

plot db(\{$scratch\}.allv) 

.endc
.save all
"}
C {devices/gnd.sym} -180 80 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -180 0 0 0 {name=l5 sig_type=std_logic lab=in}
C {devices/gnd.sym} -180 190 0 0 {name=l6 lab=GND}
C {sky130_fd_pr/cap_mim_m3_1.sym} 120 50 0 0 {name=C2 model=cap_mim_m3_1 W=20 L=20 MF=1 spiceprefix=X}
C {devices/vsource.sym} -180 50 0 0 {name=Vin value="DC 0 AC 1 SIN (0.6 0.6 1k)"}
C {transmission_gate/transmission_gate.sym} 0 0 0 0 {name=X1}
C {inv/inv.sym} -50 130 0 0 {name=X2}
C {devices/lab_pin.sym} -180 130 0 0 {name=l3 sig_type=std_logic lab=ctrl}
C {devices/gnd.sym} -180 -80 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} -180 -110 0 0 {name=VDD value="DC 1.2"}
C {devices/vdd.sym} -180 -140 0 0 {name=l8 lab=VDD}
