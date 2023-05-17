from cocotb_includes import test_configure
from cocotb_includes import report_test
import cocotb

@cocotb.test()
@report_test
async def hello_world(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=9373)
    cocotb.log.info("Hello World")