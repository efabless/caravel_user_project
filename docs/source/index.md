# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)  [![User CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml)  [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml) 

## Table of Contents

- [Overview](#overview)
- [Quickstart](#quickstart)
- [Caravel Integration](#caravel-integration)
  - [Repo Integration](#repo-integration)
  - [Verilog Integration](#verilog-integration)
  - [GPIO Configuration](#gpio-configuration)
  - [Layout Integration](#layout-integration)
- [Running Full Chip Simulation](#running-full-chip-simulation)
- [User Project Wrapper Requirements](#user-project-wrapper-requirements)
- [Hardening the User Project using OpenLane](#hardening-the-user-project-using-openlane)
- [Running Timing Analysis on Existing Projects](#running-timing-analysis-on-existing-projects)
- [Checklist for Open-MPW Submission](#checklist-for-open-mpw-submission)

## Overview

This repository contains a sample user project for the [Caravel](https://github.com/efabless/caravel.git) chip user space. It includes a simple counter demonstrating how to use Caravel's utilities such as IO pads, logic analyzer probes, and the Wishbone port. The repository also follows the recommended structure for open-mpw shuttle projects.

## Prerequisites

- Docker: [Linux](https://docs.docker.com/desktop/install/linux-install/r) | [Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header) | [Mac with Intel Chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header) | [Mac with M1 Chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=header)
- Python 3.8+ with PIP

## Quickstart

### Starting Your Project

1. Create a new repository based on the [caravel_user_project](https://github.com/efabless/caravel_user_project/) template. Ensure your repo is public and includes a README.

   - Follow [this link](https://github.com/efabless/caravel_user_project/generate) to create your repository.
   - Clone the repository using:

     ```bash
     git clone <your github repo URL>
     ```

2. Set up your local environment:

   ```bash
   cd <project_name>
   make setup
   ```

   This command installs:

   - caravel_lite
   - Management core for simulation
   - OpenLane for design hardening
   - PDK
   - Timing scripts

3. Start hardening your design:

   - For hardening, provide an RTL Verilog model of your design to OpenLane.
   - Create a subdirectory for each macro in your project under the `openlane/` directory with OpenLane configuration files.

     ```bash
     make <module_name>
     ```

   Refer to [Hardening the User Project using OpenLane](#hardening-the-user-project-using-openlane) for examples.

4. Integrate modules into the user_project_wrapper:

   - Update environment variables `VERILOG_FILES_BLACKBOX`, `EXTRA_LEFS`, and `EXTRA_GDS_FILES` in `openlane/user_project_wrapper/config.tcl` to point to your module.
   - Instantiate your module(s) in `verilog/rtl/user_project_wrapper.v`.
   - Harden the user_project_wrapper with your module(s):

     ```bash
     make user_project_wrapper
     ```

5. Run cocotb simulation on your design:

   - Update `rtl/gl/gl+sdf` files in `verilog/includes/includes.<rtl/gl/gl+sdf>.caravel_user_project`.
   - Run `gen_gpio_defaults.py` script to generate `caravel_core.v`.
   - Run RTL tests:

     ```bash
     make cocotb-verify-all-rtl
     ```

   - For GL simulation:

     ```bash
     make cocotb-verify-all-gl
     ```

   - To add cocotb tests, refer to [Adding cocotb test](https://caravel-sim-infrastructure.readthedocs.io/en/latest/usage.html#adding-a-test).

6. Run opensta on your design:

   - Extract parasitics for `user_project_wrapper` and its macros:

     ```bash
     make extract-parasitics
     ```

   - Create a spef mapping file:

     ```bash
     make create-spef-mapping
     ```

   - Run opensta:

     ```bash
     make caravel-sta
     ```

 > [!NOTE]
 > To update timing scripts, run `make setup-timing-scripts`.

7. Run the precheck locally:

   ```bash
   make precheck
   make run-precheck
   ```

8. You're done! Submit your project at [Efabless Open Shuttle Program](https://efabless.com/open_shuttle_program/).

### GPIO Configuration

Specify the power-on default configuration for each GPIO in Caravel in `verilog/rtl/user_defines.v`. GPIO[5] to GPIO[37] require configuration, while GPIO[0] to GPIO[4] are preset and cannot be changed.

### Layout Integration

The Caravel layout includes an empty golden wrapper in the user space. Provide a valid `user_project_wrapper` GDS file. Your hardened `user_project_wrapper` will be integrated into the Caravel layout during tapeout.

![Layout](./_static/layout.png)

Ensure your hardened `user_project_wrapper` meets the requirements in [User Project Wrapper Requirements](#user-project-wrapper-requirements).

### Running Full Chip Simulation

Refer to [ReadTheDocs](https://caravel-sim-infrastructure.readthedocs.io/en/latest/index.html) for adding cocotb tests.

1. Install the simulation environment:

   ```bash
   make setup-cocotb
   ```

2. Run RTL simulation:

   ```bash
   make cocotb-verify-<test_name>-rtl
   ```

3. After physical implementation, run full gate-level simulations to verify your design.

   ```bash
   make cocotb-verify-<test_name>-gl
   ```

## User Project Wrapper Requirements

Your hardened `user_project_wrapper` must match the [golden user_project_wrapper](https://github.com/efabless/caravel/blob/master/gds/user_project_wrapper_empty.gds.gz) in:

- Area (2.920um x 3.520um)
- Top module name "user_project_wrapper"
- Pin Placement
- Pin Sizes
- Core Rings Width and Offset
- PDN Vertical and Horizontal Straps Width

![Empty](./_static/empty.png)

You can change the PDN Vertical and Horizontal Pitch & Offset.

![Pitch](./_static/pitch.png)

We run an XOR check between your hardened `user_project_wrapper` GDS and the golden wrapper GDS as part of the [mpw-precheck](https://github.com/efabless/mpw_precheck) tool.

## Hardening the User Project using OpenLane

### OpenLane Installation

Install OpenLane with:

```bash
make openlane
```

For more detailed instructions, refer to the [ReadTheDocs](https://openlane.readthedocs.io/en/latest/getting_started/index.html).

### Hardening Options

There are three options for hardening the user project macro using OpenLane:

1. **Option 1**: Harden the user macro(s) first, then insert it into the user project wrapper with no standard cells at the top level.

   ![Option 1](./_static/option1.png)

   Example: [caravel_user_project](https://github.com/efabless/caravel_user_project)

2. **Option 2**: Flatten the user macro(s) with the user_project_wrapper.

   ![Option 2](./_static/option2.png)

3. **Option 3**: Place multiple macros in the wrapper along with standard cells at the top level.

   ![Option 3](./_static/option3.png)

   Example: [clear](https://github.com/efabless/clear)

For more details, refer to the [Knowledgebase article](https://info.efabless.com/knowledge-base/top-level-integration-and-power-management).

### Running OpenLane

For this project, we chose the first option: harden the user macro first, then insert it into the user project wrapper without standard cells at the top level.

To reproduce this process, run:

```bash
# DO NOT cd into openlane

# Harden user_proj_example
make user_proj_example

# Harden user_project_wrapper
make user_project_wrapper
```

For more information, refer to the [OpenLane Documentation](https://openlane.readthedocs.io/en/latest/index.html).

## Running Transistor Level LVS

To pass precheck, a custom LVS configuration file (`lvs_config.json`) is needed for your design. The configuration file should include:

Required variables:

- **TOP_SOURCE**: Top source cell name.
- **TOP_LAYOUT**: Top layout cell name.
- **LAYOUT_FILE**: Layout GDS data file.
- **LVS_SPICE_FILES**: List of spice files.
- **LVS_VERILOG_FILES**: List of Verilog files (child modules should be listed before parent modules).

Optional variables:

- **INCLUDE_CONFIGS**: List of configuration files to read recursively.
- **EXTRACT_FLATGLOB**: List of cell names to flatten before extraction.
- **EXTRACT_ABSTRACT**: List of cells to extract as abstract devices.
- **LVS_FLATTEN**: List of cells to flatten before comparing.
- **LVS_NOFLATTEN**: List of cells not to flatten in case of a mismatch.
- **LVS_IGNORE**: List of cells to ignore during LVS.

> [!NOTE]
> Missing files and undefined variables result in fatal errors.

## Running MPW Precheck Locally

Install the [mpw-precheck](https://github.com/efabless/mpw_precheck) by running:

```bash
make precheck
```

Run the precheck with:

```bash
make run-precheck
```

To disable LVS/Soft/ERC connection checks:

```bash
DISABLE_LVS=1 make run-precheck
```

## Running Timing Analysis on Existing Projects

Update the Makefile for your project:

```bash
make setup-timing-scripts
```

Run timing analysis:

```bash
make extract-parasitics

make create-spef-mapping

make caravel-sta
```

A summary of timing results is provided at the end.

## Checklist for Shuttle Submission

- ✔️ The project repo follows the directory structure in this repo.
- ✔️ Top level macro is named `user_project_wrapper`.
- ✔️ Full Chip Simulation passes for RTL and GL.
- ✔️ Hardened Macros are LVS and DRC clean.
- ✔️ Contains a gate-level netlist for `user_project_wrapper` at `verilog/gl/user_project_wrapper.v`.
- ✔️ Hardened `user_project_wrapper` matches the [pin order](https://github.com/efabless/caravel/blob/master/openlane/user_project_wrapper_empty/pin_order.cfg).
- ✔️ Matches the [fixed wrapper configuration](https://github.com/efabless/caravel/blob/master/openlane/user_project_wrapper_empty/fixed_wrapper_cfgs.tcl).
- ✔️ Design passes the [mpw-precheck](https://github.com/efabless/mpw_precheck).
