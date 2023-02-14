from cocotb_includes import *
@cocotb.test()
@repot_test
async def counter_la_clk(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=1346140)

    cocotb.log.info(f"[TEST] Start counter_wb test")  
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish configuration") 
    overwrite_val = 0 # because of the reset 
    # expect value bigger than 7 
    received_val = caravelEnv.monitor_gpio(31,0).integer 
    counter = received_val

    for i in range(5):
        if counter != caravelEnv.monitor_gpio(31,0).integer:
            cocotb.log.error(f"counter have wrong value expected = {counter} recieved = {caravelEnv.monitor_gpio(31,0).integer}")
        await wait_la_clock_cycle(caravelEnv)
        counter +=1

    
async def wait_la_clock_cycle(caravelEnv): 
    # clock is synced with mgmt_gpio
    await caravelEnv.wait_mgmt_gpio(0)
    await caravelEnv.wait_mgmt_gpio(1)