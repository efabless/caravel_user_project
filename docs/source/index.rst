.. raw:: html

   <!---
   # SPDX-FileCopyrightText: 2020 Efabless Corporation
   #
   # Licensed under the Apache License, Version 2.0 (the "License");
   # you may not use this file except in compliance with the License.
   # You may obtain a copy of the License at
   #
   #      http://www.apache.org/licenses/LICENSE-2.0
   #
   # Unless required by applicable law or agreed to in writing, software
   # distributed under the License is distributed on an "AS IS" BASIS,
   # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   # See the License for the specific language governing permissions and
   # limitations under the License.
   #
   # SPDX-License-Identifier: Apache-2.0
   -->

Caravel User Project
====================

|License| |User CI| |Caravel Build|

Table of contents
=================

-  `Overview <#overview>`__
-  `Install Caravel <#install-caravel>`__
-  `Caravel Integration <#caravel-integration>`__

   -  `Repo Integration <#repo-integration>`__
   -  `Verilog Integration <#verilog-integration>`__

-  `Running Full Chip Simulation <#running-full-chip-simulation>`__
-  `Hardening the User Project Macro using
   Openlane <#hardening-the-user-project-macro-using-openlane>`__
-  `Checklist for Open-MPW
   Submission <#checklist-for-open-mpw-submission>`__

Overview
========

This repo contains a sample user project that utilizes the
`caravel <https://github.com/efabless/caravel.git>`__ chip user space.
The user project is a simple counter that showcases how to make use of
`caravel's <https://github.com/efabless/caravel.git>`__ user space
utilities like IO pads, logic analyzer probes, and wishbone port. The
repo also demonstrates the recommended structure for the open-mpw
shuttle projects.

Prerequisites
=============

- Docker

Install Caravel
===============

To setup caravel, run the following:

.. code:: bash

    # If unset, CARAVEL_ROOT will be set to $(pwd)/caravel
    # If you want to install caravel at a different location, run "export CARAVEL_ROOT=<caravel-path>"
    export CARAVEL_ROOT=$(pwd)/caravel

    # Disable submodule installation if needed by, run "export SUBMODULE=0"
    
    git clone https://github.com/efabless/caravel_user_project.git
    cd caravel_user_project
    make install

To update the installed caravel to the latest, run:

.. code:: bash

     make update_caravel

To remove caravel, run

.. code:: bash

    make uninstall

By default
`caravel-lite <https://github.com/efabless/caravel-lite.git>`__ is
installed. To install the full version of caravel, run this prior to
calling make install.

.. code:: bash

    export CARAVEL_LITE=0

Caravel Integration
===================

Repo Integration
----------------

Caravel files are kept separate from the user project by having caravel
as submodule. The submodule commit should point to the latest of
caravel/caravel-lite master. The following files should have a symbolic
link to `caravel's <https://github.com/efabless/caravel.git>`__
corresponding files:

-  `Openlane Makefile <../../openlane/Makefile>`__: This provides an easier
   way for running openlane to harden your macros. Refer to `Hardening
   the User Project Macro using
   Openlane <#hardening-the-user-project-macro-using-openlane>`__. Also,
   the makefile retains the openlane summary reports under the signoff
   directory.

-  `Pin order <../../openlane/user_project_wrapper/pin_order.cfg>`__ file for
   the user wrapper: The hardened user project wrapper macro must have
   the same pin order specified in caravel's repo. Failing to adhere to
   the same order will fail the gds integration of the macro with
   caravel's back-end.

The symbolic links are automatically set when you run ``make install``.

Verilog Integration
-------------------

You need to create a wrapper around your macro that adheres to the
template at
`user\_project\_wrapper <https://github.com/efabless/caravel/blob/master/verilog/rtl/__user_project_wrapper.v>`__.
The wrapper top module must be named ``user_project_wrapper`` and must
have the same input and output ports as the golden wrapper `template <https://github.com/efabless/caravel/blob/master/verilog/rtl/__user_project_wrapper.v>`__. The wrapper gives access to the
user space utilities provided by caravel like IO ports, logic analyzer
probes, and wishbone bus connection to the management SoC.

For this sample project, the user macro makes use of:

-  The IO ports for displaying the count register values on the IO pads.

-  The LA probes for supplying an optional reset and clock signals and
   for setting an initial value for the count register.

-  The wishbone port for reading/writing the count value through the
   management SoC.

Refer to `user\_project\_wrapper <../../verilog/rtl/user_project_wrapper.v>`__
for more information.

.. raw:: html

   <p align="center">
   <img src="./_static/counter_32.png" width="50%" height="50%">
   </p>

.. raw:: html

   </p>

Building the PDK 
================

You have two options for building the pdk: 

- Build the pdk natively. 

Make sure you have `Magic VLSI Layout Tool <http://opencircuitdesign.com/magic/index.html>`__ installed on your machine before building the pdk. 
The pdk build is tested with magic version `8.3.209`. 

.. code:: bash

    # set PDK_ROOT to the path you wish to use for the pdk
    export PDK_ROOT=<pdk-installation-path>

    # you can optionally specify skywater-pdk and open-pdks commit used
    # by setting and exporting SKYWATER_COMMIT and OPEN_PDKS_COMMIT
    # if you do not set them, they default to the last verfied commits tested for this project

    make pdk

- Build the pdk using openlane's docker image which has magic installed. 

.. code:: bash

    # set PDK_ROOT to the path you wish to use for the pdk
    export PDK_ROOT=<pdk-installation-path>

    # you can optionally specify skywater-pdk and open-pdks commit used
    # by setting and exporting SKYWATER_COMMIT and OPEN_PDKS_COMMIT
    # if you do not set them, they default to the last verfied commits tested for this project

    make pdk-nonnative

Running Full Chip Simulation
============================

First, you will need to install the simulation environment, by

.. code:: bash

    make simenv

This will pull a docker image with the needed tools installed.

Then, run the RTL and GL simulation by

.. code:: bash

    export PDK_ROOT=<pdk-installation-path>
    export CARAVEL_ROOT=$(pwd)/caravel
    # specify simulation mode: RTL/GL
    export SIM=RTL
    # Run IO ports testbench, make verify-io_ports
    make verify-<dv-pattern>

The verilog test-benches are under this directory
`verilog/dv <https://github.com/efabless/caravel_user_project/tree/main/verilog/dv>`__. For more information on setting up the
simulation environment and the available testbenches for this sample
project, refer to `README <https://github.com/efabless/caravel_user_project/blob/main/verilog/dv/README.md>`__.

Hardening the User Project Macro using Openlane
===============================================

You will need to install openlane by running the following

.. code:: bash

   export OPENLANE_ROOT=<openlane-installation-path>

   # you can optionally specify the openlane tag to use
   # by running: export OPENLANE_TAG=<openlane-tag>
   # if you do not set the tag, it defaults to the last verfied tag tested for this project

   make openlane

For detailed instructions on the openlane and the pdk installation refer
to
`README <https://github.com/efabless/openlane/blob/master/README.md>`__.

There are three options for hardening the user project macro using
openlane:

1. Hardening the user macro, then embedding it in the wrapper
2. Flattening the user macro with the wrapper.
3. Placing multiple macros in the wrapper along with standard cells on the top level. 

For more details on hardening the user project macro using openlane, refer to `README <https://github.com/efabless/caravel/blob/master/openlane/README.rst>`__.

For this sample project, we went for the first option where the user
macro is hardened first, then it is inserted in the user project
wrapper without having any standard cells on the top level.

.. raw:: html

   <p align="center">
   <img src="./_static/wrapper.png" width="50%" height="50%">
   </p>

.. raw:: html

   </p>

To reproduce hardening this project, run the following:

.. code:: bash

   # Run openlane to harden user_proj_example
   make user_proj_example
   # Run openlane to harden user_project_wrapper
   make user_project_wrapper


Running MPW Precheck Locally
=================================

You can install the precheck by running 

.. code:: bash

   # By default, this install the precheck in your home directory
   # To change the installtion path, run "export PRECHECK_ROOT=<precheck installation path>" 
   make precheck

This will clone the precheck repo and pull the latest precheck docker image. 


Then, you can run the precheck by running
Specify CARAVEL_ROOT before running any of the following, 

.. code:: bash

   # export CARAVEL_ROOT=$(pwd)/caravel 
   export CARAVEL_ROOT=<path-to-caravel>
   make run-precheck

This will run all the precheck checks on your project and will produce the logs under the ``checks`` directory.


Other Miscellaneous Targets
============================

The makefile provides a number of useful that targets that can run LVS, DRC, and XOR checks on your hardened design outside of openlane's flow. 

Run ``make help`` to display available targets. 

Specify CARAVEL_ROOT before running any of the following, 

.. code:: bash

   # export CARAVEL_ROOT=$(pwd)/caravel 
   export CARAVEL_ROOT=<path-to-caravel>

Run lvs on the mag view, 

.. code:: bash

   make lvs-<macro_name>

Run lvs on the gds, 

.. code:: bash

   make lvs-gds-<macro_name>

Run lvs on the maglef, 

.. code:: bash

   make lvs-maglef-<macro_name>

Run drc using magic,

.. code:: bash

   make drc-<macro_name>

Run antenna check using magic, 

.. code:: bash

   make antenna-<macro_name>

Run XOR check, 

.. code:: bash

   make xor-wrapper


Checklist for Open-MPW Submission
=================================

-  ✔️ The project repo adheres to the same directory structure in this
   repo.
-  ✔️ The project repo contain info.yaml at the project root.
-  ✔️ Top level macro is named ``user_project_wrapper``.
-  ✔️ Full Chip Simulation passes for RTL and GL (gate-level)
-  ✔️ The hardened Macros are LVS and DRC clean
-  ✔️ The hardened ``user_project_wrapper`` adheres to the same pin
   order specified at
   `pin\_order <https://github.com/efabless/caravel/blob/master/openlane/user_project_wrapper_empty/pin_order.cfg>`__
-  ✔️ The hardened ``user_project_wrapper`` adheres to the fixed wrapper configuration specified at `fixed_wrapper_cfgs <https://github.com/efabless/caravel/blob/master/openlane/user_project_wrapper_empty/fixed_wrapper_cfgs.tcl>`__
-  ✔️ XOR check passes with zero total difference.
-  ✔️ Openlane summary reports are retained under ./signoff/
-  ✔️ The design passes the `mpw-precheck <https://github.com/efabless/mpw_precheck>`__ 

.. |License| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0
.. |User CI| image:: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml
.. |Caravel Build| image:: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml
