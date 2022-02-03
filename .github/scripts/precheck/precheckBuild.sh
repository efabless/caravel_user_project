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
export SKIP_PDK_BUILD=${1:-0}
export TARGET_PATH=$(pwd)

apt-get install tcl tk tcl-develop tk-develop

export MAGIC_ROOT=./magic
git clone --depth=1 --branch 8.3.263 https://github.com/RTimothyEdwards/magic.git ${MAGIC_ROOT}
cd $MAGIC_ROOT
./configure --disable-locking --prefix=/build CFLAGS='-g -O0 -m64 -fPIC' && make -j4 && make install

cd $TARGET_PATH  

git clone --depth=1 https://github.com/efabless/mpw_precheck.git
git clone --depth=1 https://github.com/efabless/caravel-lite.git

docker pull efabless/mpw_precheck:latest

if [ $SKIP_PDK_BUILD -eq 0 ]; then
    cd $TARGET_PATH/..
    export PDK_ROOT=$(pwd)/precheck_pdks
    mkdir $PDK_ROOT
    cd $TARGET_PATH/caravel-lite/
    make uncompress pdk
    cd $TARGET_DIR
fi

exit 0

