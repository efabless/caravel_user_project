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
   
Complete roundtrip for caravel_user_project
===========================================

1. To start the project you need to first create an empty Git project on Github and make sure your repo is public and includes a README

2. Open your Terminal. Create an empty folder to use as your Caravel workspace, and navigate to it.

.. code:: bash
	
	# Create a directory and call it anything you want
	mkdir -p caravel_tutorial
	
	# navigate into the directory
	cd caravel_tutorial
	
3. Clone caravel_user_project and setup the git environment as follows

.. code:: bash
	
	# Make sure that ``caravel_example`` matches the empty github repo name in step 1
	git clone -b mpw-5a https://github.com/efabless/caravel_user_project caravel_example
	cd caravel_example
	git remote rename origin upstream
	
	# You need to put your empty github repo URL from step 1
	git remote add origin <your github repo URL>
	
	# Create a new branch, you can name it anything 
	git checkout -b <my_branch>
	git push -u origin <my_branch>
	
4. Now that your git environment is setup, it's time to setup your local environment

.. code:: bash
	
	# to install caravel-lite into your caravel_user_project
	# you can install full caravel (not recommended) use ``export CARAVEL_LITE=0``
	make install
	
	# The default for the management core is litex, to install the pico version use
	export MCW=pico
	# To install the management core for simulation
	make install_mcw
	
	
	
	# To clone the management core pico for simulation
	git clone git@github.com:efabless/caravel_pico.git
	
	# Install openlane for hardening your project
	# make sure to change <directory_name> with the directory you created in step 1
	# in this case it is caravel_tutorial
	export OPENLANE_ROOT=~/<directory_name>/openlane # you need to export this whenever you start a new shell
	make openlane
	
	# Build the pdk
	# To build the pdk you need to install magic
	# make sure to change <directory_name> with the directory you created in step 1
	# in this case it is caravel_tutorial

	export PDK_ROOT=~/<directory_name>/pdks # you need to export this whenever you start a new shell
	make pdk
	
	# To simulate you need the pdk with SRAM, to build the pdk with SRAM use
	make pdk-with-sram
	
5. Now you can start hardening your design, for example

.. code:: bash

	make user_proj_example
	make user_project_wrapper
	
6. To run simulation on your design

.. code:: bash

	make simenv
	# you can run RTL/GL simulations by using
	export SIM=RTL
	# OR
	export SIM=GL
	
	# you can then run the simulations using
	make verify-<testbench-name>
	
	# for example
	make verify-io_ports
	
7. To run the precheck locally 

.. code:: bash
	
	make precheck
	make run-precheck
	
17. You are done! now go to www.efabless.com to submit your project!
   
   
.. |License| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0
.. |User CI| image:: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml
.. |Caravel Build| image:: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml
