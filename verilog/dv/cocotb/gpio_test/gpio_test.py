from cocotb_includes import * # import python APIs
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
   

