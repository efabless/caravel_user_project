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

- Docker: `Linux <https://hub.docker.com/search?q=&type=edition&offering=community&operating_system=linux&utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_ ||  `Windows <https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_ || `Mac with Intel Chip <https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_ || `Mac with M1 Chip <https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header>`_

- Python 3.6+ with PIP

===============================================================================================================================================================

---------------------
Starting your project
---------------------


#. To start the project you first need to create a new repository based on the `caravel_user_project <https://github.com/efabless/caravel_user_project/>`_ template and make sure your repo is public and includes a README.

   *   Follow https://github.com/efabless/caravel_user_project/generate to create a new repository.
   *   Clone the reposity using the following command:

    .. code:: bash

        git clone -b mpw-7a  <your github repo URL> caravel_example
	
#.  Now that your git environment is setup, it's time to setup your local environment by running.

    .. code:: bash
    
	cd caravel_example

  # make sure to change <directory_name> with the directory you created in step 2
	# in this case it is caravel_tutorial

	export OPENLANE_ROOT=~/<directory_name>/openlane_src # you need to export this whenever you start a new shell
	export PDK_ROOT=~/<directory_name>/pdks # you need to export this whenever you start a new shell
	
	# export the PDK variant depending on your shuttle, if you don't know leave it to the default
	export PDK=sky130B

        make setup

    *   This command will setup your environment by installing the following:
    
        - caravel_lite (a lite version of caravel)
        - management core for simulation
        - openlane to harden your design 
        - pdk

	
#.  Now you can start hardening your design

    *   To start hardening you project you need 
        - RTL verilog model for your design for OpenLane to harden
        - A subdirectory for each macro in your project under ``openlane/`` directory, each subdirectory should include openlane configuration files for the macro

	.. code:: bash

		make <module_name>	
	..

		For an example of hardening a project please refer to `user_project_example <https://github.com/efabless/caravel_user_project/blob/main/docs/source/index.rst#hardening-the-user-project-using-openlane>`_
	
#.  Integrate modules into the user_project_wrapper

    *   Change the environment variables ``VERILOG_FILES_BLACKBOX``, ``EXTRA_LEFS`` and ``EXTRA_GDS_FILES`` in ``openlane/user_project_wrapper/config.tcl`` to point to your module
    *   Instantiate your module(s) in ``verilog/rtl/user_project_wrapper.v``
    *   Harden the user_project_wrapper including your module(s), using this command:

        .. code:: bash

            make user_project_wrapper

#.  Run simulation on your design

    *   You need to include your rtl/gl/gl+sdf files in ``verilog/includes/includes.<rtl/gl/gl+sdf>.caravel_user_project``

        **NOTE:** You shouldn't include the files inside the verilog code

        .. code:: bash

            # you can then run RTL simulations using
            make verify-<testbench-name>-rtl

            # OR GL simulation using
            make verify-<testbench-name>-gl

            # for example
            make verify-io_ports-rtl
	
#.  Run the precheck locally 

    .. code:: bash

        make precheck
        make run-precheck

#. You are done! now go to https://efabless.com/open_shuttle_program/ to submit your project!
   
   
.. |License| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0
.. |User CI| image:: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml
.. |Caravel Build| image:: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg
   :target: https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml
