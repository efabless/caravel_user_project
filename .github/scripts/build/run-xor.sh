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

export UPRJ_ROOT=$(pwd)
export CARAVEL_ROOT=$(pwd)/caravel
cd ..
export PDK_ROOT=$(pwd)/pdks
export IMAGE_NAME=efabless/openlane:$OPENLANE_TAG

cd $UPRJ_ROOT

LOG_FILE=out.log
docker run -v $UPRJ_ROOT:$UPRJ_ROOT -v $PDK_ROOT:$PDK_ROOT -v $CARAVEL_ROOT:$CARAVEL_ROOT -e UPRJ_ROOT=$UPRJ_ROOT -e PDK_ROOT=$PDK_ROOT -e CARAVEL_ROOT=$CARAVEL_ROOT -u $(id -u $USER):$(id -g $USER) $IMAGE_NAME bash -c "cd $UPRJ_ROOT; export USER_ID=$USER_ID; make xor-wrapper | tee $LOG_FILE;"

cnt=$(grep -oP '(?<=Total XOR differences = )[0-9]+' $LOG_FILE)

echo "Total XOR differences = $cnt"

if [[ $cnt -ne 0 ]]; then 
    exit 2; 
fi

exit 0
