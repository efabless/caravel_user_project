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

from caravel_cocotb.caravel_interfaces import * # import python APIs
import cocotb

@cocotb.test() # cocotb test marker
@report_test # wrapper for configure test reporting files
async def gpio_test(dut):
   caravelEnv = await test_configure(dut) #configure, start up and reset caravel
   #await caravelEnv.release_csb()
   await caravelEnv.wait_mgmt_gpio(1)
   gpios_value_str = caravelEnv.monitor_gpio(37, 0).binstr
   cocotb.log.info (f"All gpios '{gpios_value_str}'")
   gpio_value_int = caravelEnv.monitor_gpio(37, 0).integer
   #expected_gpio_value = 0xF8
   expected_gpio_value = 0x8F
   if (gpio_value_int == expected_gpio_value):
      cocotb.log.info (f"[TEST] Pass the gpio value is '{hex(gpio_value_int)}'")
   else:
      cocotb.log.error (f"[TEST] Fail the gpio value is :'{hex(gpio_value_int)}' expected {hex(expected_gpio_value)}")
   

