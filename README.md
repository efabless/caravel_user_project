# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![CI](https://github.com/Cal-Poly-RAMP/tapeout-ci-2311/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/Cal-Poly-RAMP/tapeout-ci-2311/actions/workflows/user_project_ci.yml) 

| :exclamation: Important Note            |
|-----------------------------------------|

## Please fill in your project documentation in this README.md file 

Refer to [README](docs/source/index.rst#section-quickstart) for a quickstart of how to use caravel_user_project

Refer to [README](docs/source/index.rst) for this sample project documentation. 

Refer to the following [readthedocs](https://caravel-sim-infrastructure.readthedocs.io/en/latest/index.html) for how to add cocotb tests to your project. 

## Checklist for Open-MPW Submission
=================================

-  [ ] The project repo adheres to the same directory structure in this
   repo.
-  [ ] The project repo contain info.yaml at the project root.
-  [ ] Top level macro is named ``user_project_wrapper``.
-  [ ] Full Chip Simulation passes for RTL and GL (gate-level)
-  [ ] The hardened Macros are LVS and DRC clean
-  [ ] The project contains a gate-level netlist for ``user_project_wrapper`` at verilog/gl/user_project_wrapper.v
-  [ ] The hardened ``user_project_wrapper`` adheres to the same pin
   order specified at
   `pin\_order <https://github.com/efabless/caravel/blob/master/openlane/user_project_wrapper_empty/pin_order.cfg>`__
-  [ ] The hardened ``user_project_wrapper`` adheres to the fixed wrapper configuration specified at `fixed_wrapper_cfgs <https://github.com/efabless/caravel/blob/master/openlane/user_project_wrapper_empty/fixed_wrapper_cfgs.tcl>`__
-  [ ] XOR check passes with zero total difference.
-  [ ] Openlane summary reports are retained under ./signoff/
-  [ ] The design passes the `mpw-precheck <https://github.com/efabless/mpw_precheck>`__ 
