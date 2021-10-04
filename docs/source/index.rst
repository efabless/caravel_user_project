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
   -  `Layout Integration <#layout-integration>`__

-  `Running Full Chip Simulation <#running-full-chip-simulation>`__
-  `User Project Wrapper Requirements <#user-project-wrapper-requirements>`__
-  `Hardening the User Project using
   Openlane <#hardening-the-user-project-using-openlane>`__
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
caravel/caravel-lite master/main branch. The following files should have a symbolic
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


Layout Integration
-------------------

The caravel layout is pre-designed with an empty golden wrapper in the user space. You only need to provide us with a valid ``user_project_wrapper`` GDS file. And, as part of the tapeout process, your hardened ``user_project_wrapper`` will be inserted into a vanilla caravel layout to get the final layout shipped for fabrication. 

.. raw:: html

   <p align="center">
   <img src="./_static/layout.png" width="80%" height="80%">
   </p>
   
To make sure that this integration process goes smoothly without having any DRC or LVS issues, your hardened ``user_project_wrapper`` must adhere to a number of requirements listed at `User Project Wrapper Requirements <#user-project-wrapper-requirements>`__ .


Building the PDK 
================

You have two options for building the pdk: 

- Build the pdk natively. 

Make sure you have `Magic VLSI Layout Tool <http://opencircuitdesign.com/magic/index.html>`__ installed on your machine before building the pdk. 
The pdk build is tested with magic version ``8.3.209``. 

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

Then, run the RTL simulation by

.. code:: bash

    export PDK_ROOT=<pdk-installation-path>
    export CARAVEL_ROOT=$(pwd)/caravel
    # specify simulation mode: RTL/GL
    export SIM=RTL
    # Run RTL simulation on IO ports testbench, make verify-io_ports
    make verify-<testbench-name>

Once you have the physical implementation done and you have the gate-level netlists ready, it is very crucial to run full gate-level simulations. This is to make sure that synthesis and design optimizations didn't ruin your design logic. 

Run the gate-level simulation by: 

.. code:: bash

    export PDK_ROOT=<pdk-installation-path>
    export CARAVEL_ROOT=$(pwd)/caravel
    # specify simulation mode: RTL/GL
    export SIM=GL
    # Run RTL simulation on IO ports testbench, make verify-io_ports
    make verify-<testbench-name>


This sample project comes with four example testbenches to test the IO port connection, wishbone interface, and logic analyzer. The test-benches are under the
`verilog/dv <https://github.com/efabless/caravel_user_project/tree/main/verilog/dv>`__ directory. For more information on setting up the
simulation environment and the available testbenches for this sample
project, refer to `README <https://github.com/efabless/caravel_user_project/blob/main/verilog/dv/README.md>`__.



User Project Wrapper Requirements
=================================


Hardening the User Project using OpenLane
==================================================

OpenLane Installation 
---------------------

You will need to install openlane by running the following

.. code:: bash

   export OPENLANE_ROOT=<openlane-installation-path>

   # you can optionally specify the openlane tag to use
   # by running: export OPENLANE_TAG=<openlane-tag>
   # if you do not set the tag, it defaults to the last verfied tag tested for this project

   make openlane

For detailed instructions on the openlane and the pdk installation refer
to
`README <https://github.com/The-OpenROAD-Project/OpenLane#setting-up-openlane>`__.

Hardening Options 
-----------------

There are three options for hardening the user project macro using
openlane:

+--------------------------------------------------------------+--------------------------------------------+--------------------------------------------+
|           Option 1                                           |            Option 2                        |           Option 3                         |
+--------------------------------------------------------------+--------------------------------------------+--------------------------------------------+
| Hardening the user macro(s) first, then inserting it in the  |  Flattening the user macro(s) with the     | Placing multiple macros in the wrapper     |
| user project wrapper with no standard cells on the top level |  user_project_wrapper                      | along with standard cells on the top level |
+==============================================================+============================================+============================================+
| |pic1|                                                       | |pic2|                                     | |pic3|                                     |
|                                                              |                                            |                                            |
+--------------------------------------------------------------+--------------------------------------------+--------------------------------------------+
|           ex: |link1|                                        |                                            |           ex: |link2|                      |
+--------------------------------------------------------------+--------------------------------------------+--------------------------------------------+


Option 1: Inserting your design macro(s) into the wrapper with no standard cells on the top level 
-------------------------------------------------------------------------------------------------

1. This could be done by creating a directory for your design under the ``<your_user_project_root>/openlane/<my-design>`` and adding a configuration file for it under the same directory. You can start with the following for your config.tcl:

.. code:: tcl

   set script_dir [file dirname [file normalize [info script]]]

   set ::env(DESIGN_NAME) <Your Design Name>

   set ::env(DESIGN_IS_CORE) 0
   set ::env(GLB_RT_MAXLAYER) 5

   set ::env(VERILOG_FILES) "$script_dir/../../verilog/rtl/<Your RTL.v>"

   set ::env(CLOCK_PORT) <Clock port name if it exists>
   set ::env(CLOCK_PERIOD) <Desired clock period>

Then you can add any other configurations as you see fit to get the desired DRC/LVS clean outcome.

After that, run the following command from your ``<your_user_project_root>``:

.. code:: bash

   make <macro-name>

2. Then, you will need to harden the ``user_project_wrapper``. Before doing so, you will need to make sure that the following configurations exist in the the ``user_project_wrapper`` `config.tcl <https://github.com/efabless/caravel_user_project/blob/main/openlane/user_project_wrapper/config.tcl>`__  in order to tell openlane to not insert any standard cells on the top level. 

.. code:: tcl

   # The following is because there are no std cells in the example wrapper project.
   set ::env(SYNTH_TOP_LEVEL) 1
   set ::env(PL_RANDOM_GLB_PLACEMENT) 1

   set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
   set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
   set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
   set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

   set ::env(FP_PDN_ENABLE_RAILS) 0

   set ::env(DIODE_INSERTION_STRATEGY) 0
   set ::env(FILL_INSERTION) 0
   set ::env(TAP_DECAP_INSERTION) 0
   set ::env(CLOCK_TREE_SYNTH) 0
   

You may need to adjust the macro placement, you can do so by adjusting the `macro placement configuration file <https://github.com/efabless/caravel_user_project/blob/main/openlane/user_project_wrapper/macro.cfg>`__ which specifies the x and y positions and the orientation for your macro.  

Additionally, you can adjust the pointers to your hardened macro(s) by adjusting the following variables that point to the verilog, LEF, and GDS view of your hardened macro. 

.. code:: tcl

   ### Black-box verilog and views
   set ::env(VERILOG_FILES_BLACKBOX) "\
      $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
      $script_dir/../../verilog/rtl/user_proj_example.v"

   set ::env(EXTRA_LEFS) "\
      $script_dir/../../lef/user_proj_example.lef"

   set ::env(EXTRA_GDS_FILES) "\
      $script_dir/../../gds/user_proj_example.gds"


3. Re-iterate and adjust the configurations if you need to get a DRC/LVS clean run. 


Option 2: Flattening the user macro(s) with the user project wrapper
--------------------------------------------------------------------

1. First, you will need to adjust the wrapper config.tcl to remove any pointers to internal macros. For example, the following configurations will need to be removed: 

.. code:: tcl

   ## Internal Macros
   ### Macro PDN Connections
   set ::env(FP_PDN_MACRO_HOOKS) "\
      mprj vccd1 vssd1"

   ### Macro Placement
   set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

   ### Black-box verilog and views
   set ::env(VERILOG_FILES_BLACKBOX) "\
      $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
      $script_dir/../../verilog/rtl/user_proj_example.v"

   set ::env(EXTRA_LEFS) "\
      $script_dir/../../lef/user_proj_example.lef"

   set ::env(EXTRA_GDS_FILES) "\
      $script_dir/../../gds/user_proj_example.gds"

2. Then, you need to modify the configuration file to remove or change these configs accordingly to let openlane insert standard cells on the top level:

.. code:: tcl

   # The following is because there are no std cells in the example wrapper project.
   set ::env(SYNTH_TOP_LEVEL) 1
   set ::env(PL_RANDOM_GLB_PLACEMENT) 1

   set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
   set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
   set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
   set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

   set ::env(FP_PDN_ENABLE_RAILS) 0

   set ::env(DIODE_INSERTION_STRATEGY) 0
   set ::env(FILL_INSERTION) 0
   set ::env(TAP_DECAP_INSERTION) 0
   set ::env(CLOCK_TREE_SYNTH) 0

3. Run your design through the flow by running the following from your ``<user-project-root>``: 

.. code:: bash

   make user_project_wrapper
   
  
4. Re-iterate and adjust the configurations if you need to get a DRC/LVS clean run. 


Option 3: Placing multiple macros in the wrapper along with standard cells on the top level
-------------------------------------------------------------------------------------------

1.First, create a directory for each different macro in your design ``<your_user_project_root>/openlane/<my-design>`` and add a configuration file for each one under the same directory.

2. Run each macro through the openlane flow by running the following from your ``<user-project-root>``: 

.. code:: bash

   make <macro-name> 
   
3. Then, you will need to harden the top module ``user_project_wrapper``. Before doing so, you need to modify the wrapper configuration file by removing or adjusting the following configurations to let openlane insert standard cells on the top level: 

.. code:: tcl

   # The following is because there are no std cells in the example wrapper project.
   set ::env(SYNTH_TOP_LEVEL) 1
   set ::env(PL_RANDOM_GLB_PLACEMENT) 1

   set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
   set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
   set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
   set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

   set ::env(FP_PDN_ENABLE_RAILS) 0

   set ::env(DIODE_INSERTION_STRATEGY) 0
   set ::env(FILL_INSERTION) 0
   set ::env(TAP_DECAP_INSERTION) 0
   set ::env(CLOCK_TREE_SYNTH) 0
   

4. Then, adjust the internal macros pointers to accomodate the multiple macros in your design. 

.. code:: tcl

   ## Internal Macros
   ### Macro PDN Connections
   set ::env(FP_PDN_MACRO_HOOKS) "\
      mprj vccd1 vssd1"

   ### Macro Placement
   set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

   ### Black-box verilog and views
   set ::env(VERILOG_FILES_BLACKBOX) "\
      $::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
      $script_dir/../../verilog/rtl/user_proj_example.v"

   set ::env(EXTRA_LEFS) "\
      $script_dir/../../lef/user_proj_example.lef"

   set ::env(EXTRA_GDS_FILES) "\
      $script_dir/../../gds/user_proj_example.gds"
      

.. |link1| replace:: `caravel_user_project <https://github.com/efabless/caravel_user_project>`__

.. |link2| replace:: `caravel_ibex <https://github.com/efabless/caravel_ibex>`__


.. |pic1| image:: ./_static/option1.png
   :width: 48%

.. |pic2| image:: ./_static/option2.png
   :width: 140%

.. |pic3| image:: ./_static/option3.png
   :width: 72%

For more details on hardening macros using openlane, refer to `README <https://github.com/The-OpenROAD-Project/OpenLane/blob/master/docs/source/hardening_macros.md>`__.


Running OpenLane 
-----------------

For this sample project, we went for the first option where the user
macro is hardened first, then it is inserted in the user project
wrapper without having any standard cells on the top level.

.. raw:: html

   <p align="center">
   <img src="./_static/wrapper.png" width="30%" height="30%">
   </p>

.. raw:: html

   </p>
   
To reproduce hardening this project, run the following:

.. code:: bash

   # Run openlane to harden user_proj_example
   make user_proj_example
   # Run openlane to harden user_project_wrapper
   make user_project_wrapper


For more information on the openlane flow, check `README <https://github.com/The-OpenROAD-Project/OpenLane#readme>`__.

Running MPW Precheck Locally
=================================

You can install the `mpw-precheck <https://github.com/efabless/mpw_precheck>`__ by running 

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
