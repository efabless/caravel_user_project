#!/bin/bash
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
# SPDX-License-Identifier: Apache-2.0

# By default build pdk since we don't need the other script for the main purpose
export TARGET_PATH=$(pwd)
export MAGIC_ROOT=./magic

sudo apt-get install -y tcl tk tcl-dev tk-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev csh libncurses5-dev libncursesw5-dev libx11-dev

git clone --depth=1 --branch 8.3.265 https://github.com/RTimothyEdwards/magic.git ${MAGIC_ROOT}
cd $MAGIC_ROOT
sudo ./configure --disable-locking --prefix=/build CFLAGS='-g -O0 -m64 -fPIC'
sudo make -j4
sudo make install

exit 0
