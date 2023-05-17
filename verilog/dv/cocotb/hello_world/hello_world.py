from cocotb_includes import *


@cocotb.test()
@report_test
async def hello_world(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=9373)
    cocotb.log.info("Hello World")