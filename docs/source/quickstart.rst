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
   
Quick start for caravel_user_project
====================================

------------
Dependencies
------------

- Docker: `Linux <https://hub.docker.com/search?q=&type=edition&offering=community&operating_system=linux&utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_ ||  `Windows <https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_ || `Mac with Intel Chip <https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_ || `Mac with Apple Chip <https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_

===============================================================================================================================================================

---------------------
Starting your project
---------------------


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
	git clone -b mpw-5b https://github.com/efabless/caravel_user_project caravel_example
	cd caravel_example
	git remote rename origin upstream
	
	# You need to put your empty github repo URL from step 1
	git remote add origin <your github repo URL>
	
	# Create a new branch, you can name it anything 
	git checkout -b <my_branch>
	git push -u origin <my_branch>
	
4. Now that your git environment is setup, it's time to setup your local environment.

This command will install caravel_lite (a lite version of caravel), management core for simulation, openlane to harden your design and the pdk.

.. code:: bash
	
	make setup
	
5. Now you can start hardening your design

To start hardening you project you need to have a RTL verilog model for your design for OpenLane to harden. You should then have a subdirectory for each module in your project under ``openlane/`` directory, this subdirectory should include your configuration files. Then you can harden using this command

.. code:: bash
	
	make <module_name>

Example of a user project can be found by the name of ``user_proj_example``, the RTL can be found at ``verilog/rtl/user_proj_example.v`` and the configuration files can be found at ``openlane/user_proj_example``. And can be hardened using this command

**THIS IS JUST AN EXAMPLE**

.. code:: bash

	make user_proj_example
	
6. You then need to integrate your modules into the user_project_wrapper. Then you can harden user_project_wrapper using this command

.. code:: bash

	make user_project_wrapper
	
7. To run simulation on your design

You need to include your rtl files in ``verilog/includes/includes.<rtl/gl/gl+sdf>.caravel_user_project``. Then run the simulation using these commands

**NOTE:** You shouldn't include the files inside the verilog code

.. code:: bash

	make simenv
	
	# you can then run RTL simulations using
	SIM=RTL make verify-<testbench-name>
	
	# OR GL simulation using
	SIM=GL make verify-<testbench-name>
	
	# for example
	SIM=RTL make verify-io_ports
	
8. To run the precheck locally 

.. code:: bash
	
	make precheck
	make run-precheck
	
9. You are done! now go to www.efabless.com to submit your project!
   
   
.. |License| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0
.. |User CI| image:: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml
.. |Caravel Build| image:: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml
