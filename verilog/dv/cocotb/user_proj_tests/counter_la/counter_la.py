# SPDX-FileCopyrightText: 2023 Efabless Corporation

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# SPDX-License-Identifier: Apache-2.0


from caravel_cocotb.caravel_interfaces import test_configure
from caravel_cocotb.caravel_interfaces import report_test
import cocotb 

@cocotb.test()
@report_test
async def counter_la(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=1346140)

    cocotb.log.info(f"[TEST] Start counter_la test")  
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish configuration") 
    overwrite_val = 7 # value will be written to the counter by la 
    # expect value bigger than 7 
    await caravelEnv.wait_mgmt_gpio(0) # wait until writing 7 through la 
    received_val = int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) 
    counter = overwrite_val

    if received_val != counter :
        cocotb.log.fatal(f"LA writing is in correct: {overwrite_val} receieved: {received_val}")
    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    # wait until the LA writing is disabled 
    while (received_val == counter): 
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
        received_val = int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) 

    counter = received_val
    for i in range(100):
        if counter != int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) :
            cocotb.log.error(f"counter have wrong value expected = {counter} recieved = {int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) }")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
        counter +=1
    
