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

# Read the 16-bit counter value from GPIO[37:30,7:0]
def counter_value(caravelEnv):
    return int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2)

@cocotb.test()
@report_test
async def counter_wb(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=27000)

    cocotb.log.info(f"[TEST] Start counter_wb test")
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] Finished configuration")
    overwrite_val = 7 # value will be written to the counter by wishbone (hard-coded in firmware)
    # expect value bigger than 7 
    received_val = counter_value(caravelEnv)
    counter = received_val
    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    cocotb.log.info(f"[TEST] Testing Wishbone write")
    # Track the counter expected vs. actual, until they diverge...
    while True:
        received_val = counter_value(caravelEnv)
        if counter == 0xFFFF: # rollover
            counter = 0
        else: 
            counter +=1
        if received_val != counter:
            # Counter actual has diverged from expected. Verify it was a Wishbone write...
            if received_val == overwrite_val:
                # Yes, new counter value matches the expected Wishbone overwrite value.
                counter = received_val +1 # Counter's next value will increment from this new value.
                cocotb.log.info(f"Counter value has been overwritten by Wishbone to be {received_val}")
                while True: #wait until the Wishbone writing finished and the counter started running again
                    received_val = counter_value(caravelEnv)
                    if counter == received_val: 
                        break
                    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
                cocotb.log.info(f"Counter value is now {received_val}")
                break
            else: 
                cocotb.log.error(f"Counter has wrong value before overwrite. Expected={counter} Received={received_val}")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    cocotb.log.info(f"[TEST] Testing 100 more counts")
    for i in range(100):
        if counter != counter_value(caravelEnv):
            cocotb.log.error(f"Counter has wrong value. Expected={counter} Received={counter_value(caravelEnv)}")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
        counter +=1