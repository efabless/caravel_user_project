from cocotb_includes import *
@cocotb.test()
@report_test
async def counter_wb(dut):
    caravelEnv = await test_configure(dut,timeout_cycles=3346140)

    cocotb.log.info(f"[TEST] Start counter_wb test")  
    # wait for start of sending
    await caravelEnv.release_csb()
    await caravelEnv.wait_mgmt_gpio(1)
    cocotb.log.info(f"[TEST] finish configuration") 
    overwrite_val = 7 # value will be written to the counter by wishbone 
    # expect value bigger than 7 
    received_val = int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2)  
    counter = received_val
    if received_val <= overwrite_val :
        cocotb.log.error(f"Counter started late and value captured after configuration is smaller than overwrite value: {overwrite_val} receieved: {received_val}")
    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    while True: # wait until the value 1 start counting after the initial
        received_val = int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2)  
        if counter == 0xFFFF: # rollover 
            counter = 0
        else: 
            counter +=1
        if received_val != counter: 
            if received_val == overwrite_val: 
                counter = received_val +1
                cocotb.log.info(f"Counter value has been overwritten by wishbone to be {received_val}")
                while True: #wait until the wishbone writing finished and the counter start running again
                    received_val = int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2)  
                    if counter == received_val: 
                        break
                    await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
                cocotb.log.info(f"Counter value has been overwritten by wishbone to be {received_val}")
                break
            else: 
                cocotb.log.error(f"Counter has wrong value before overwrite happened expected: {counter} received: {received_val}")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)

    for i in range(100):
        if counter != int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) :
            cocotb.log.error(f"Counter have wrong value expected = {counter} recieved = {int ((caravelEnv.monitor_gpio(37,30).binstr + caravelEnv.monitor_gpio(7,0).binstr ),2) }")
        await cocotb.triggers.ClockCycles(caravelEnv.clk,1)
        counter +=1