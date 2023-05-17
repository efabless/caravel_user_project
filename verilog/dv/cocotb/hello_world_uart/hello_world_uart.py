from cocotb_includes import *


@cocotb.test()
@report_test
async def hello_world_uart(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=3346140)

    cocotb.log.info(f"[TEST] Start uart test")  
    expected_msg = "Hello World"
    uart = UART(caravelEnv)
    # wait for start of sending
    await caravelEnv.wait_mgmt_gpio(1)
    # read the msg sent
    msg = await uart.get_line()
    if msg in expected_msg :
        cocotb.log.info (f"[TEST] Pass recieve the full expected msg '{msg}'")
    else: 
        cocotb.log.error (f"[TEST] recieved wrong msg from uart msg recieved:'{msg}' expected '{expected_msg}'")