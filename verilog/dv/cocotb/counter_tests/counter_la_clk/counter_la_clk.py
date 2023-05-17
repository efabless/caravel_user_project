from cocotb_includes import test_configure
from cocotb_includes import report_test
import cocotb

@cocotb.test()
@report_test
async def counter_la_clk(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=1346140)

    cocotb.log.info(f"[TEST] Start counter_wb test")  
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish configuration") 
    overwrite_val = 0 # because of the reset 
    # expect value bigger than 7 
    received_val = int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2)  
    counter = received_val

    for i in range(5):
        if counter != int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) :
            cocotb.log.error(f"counter have wrong value expected = {counter} recieved = {int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) }")
        await wait_la_clock_cycle(caravelEnv)
        counter +=1

    
async def wait_la_clock_cycle(caravelEnv): 
    # clock is synced with mgmt_gpio
    await caravelEnv.wait_mgmt_gpio(0)
    await caravelEnv.wait_mgmt_gpio(1)