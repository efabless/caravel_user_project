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
sudo apt-get install -y csh freeglut3-dev libncurses5-dev libncursesw5-dev libglu1-mesa-dev libx11-dev mesa-common-dev tcl tcl-dev tk tk-dev

git clone --depth=1 --branch 8.3.274 https://github.com/RTimothyEdwards/magic.git
cd magic || exit
sudo ./configure --disable-locking --prefix=/usr CFLAGS='-g -O0 -m64 -fPIC'
sudo make -j
sudo make install

exit 0
