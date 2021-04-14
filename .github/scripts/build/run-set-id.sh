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
cd ..
export PDK_ROOT=$(pwd)/pdks
export IMAGE_NAME=efabless/openlane:$OPENLANE_TAG
export USER_ID=00000001

cd $UPRJ_ROOT

LOG_FILE=out.log
docker run -v $UPRJ_ROOT:$UPRJ_ROOT -v $PDK_ROOT:$PDK_ROOT -e UPRJ_ROOT=$UPRJ_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) $IMAGE_NAME bash -c "cd $UPRJ_ROOT; export USER_ID=$USER_ID; make set_user_id | tee $LOG_FILE;"

cnt=$(grep "Done" $LOG_FILE -s | wc -l)

if [[ $cnt -ne 3 ]]; then 
        exit 2; 
fi

exit 0