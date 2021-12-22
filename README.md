# Cochlea-inspired wavelet filterbank in sky130

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

---

This project implements a wavelet filterbank using switched capacitor techniques, as an extension of Tim Edwards's [dissertation work](http://opencircuitdesign.com/~tim/dissertation.html) (1999). 
The filterbank will be embedded inside efabless's Caravel frame in the nearest tapeout, and is derived from the [cochlea_sky130 repo](https://github.com/3x10e8/cochlea_sky130), so that this design can be embedded into Caravel (and not Caravan).

This work began as a class project for UCSD's [BENG 207](https://isn.ucsd.edu/courses/beng207/index.html) Integrated Neuromorphic Bioelectronics (fall 2021).

All design and simulation was done using the sky1 virtual machine made by Karthi Srinivasan, shared during Telluride 2021.

More documentation to follow!
