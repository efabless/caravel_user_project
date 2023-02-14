from cocotb_includes import *
@cocotb.test()
@repot_test
async def counter_wb(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=3346140)

    cocotb.log.info(f"[TEST] Start counter_wb test")  
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish configuration") 
    overwrite_val = 7 # value will be written to the counter by wishbone 
    # expect value bigger than 7 
    received_val = caravelEnv.monitor_gpio(31,0).integer 
    counter = received_val
    if received_val <= overwrite_val :
        cocotb.log.error(f"counter started late and value captured after configuration is smaller than overwrite value: {overwrite_val} receieved: {received_val}")
    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    while True: # wait until the value 1 start counting after the initial
        received_val = caravelEnv.monitor_gpio(31,0).integer 
        counter +=1
        if received_val != counter: 
            if received_val == overwrite_val: 
                counter = received_val +1
                cocotb.log.info(f"counter value has been overwritten by wishbone to be {received_val}")
                while True: #wait until the wishbone writing finished and the counter start running again
                    received_val = caravelEnv.monitor_gpio(31,0).integer 
                    if counter == received_val: 
                        break
                    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
                cocotb.log.info(f"counter value has been overwritten by wishbone to be {received_val}")
                break
            else: 
                cocotb.log.error(f"counter has wrong value before overwrite happened expected: {counter} received: {received_val}")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    for i in range(100):
        if counter != caravelEnv.monitor_gpio(31,0).integer:
            cocotb.log.error(f"counter have wrong value expected = {counter} recieved = {caravelEnv.monitor_gpio(31,0).integer}")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
        counter +=1