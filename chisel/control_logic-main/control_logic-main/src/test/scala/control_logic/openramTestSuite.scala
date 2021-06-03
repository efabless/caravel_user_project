package openram_testchip

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

import treadle._
import chisel3.tester.experimental.TestOptionBuilder._

class OpenramTestChipTester extends FreeSpec with ChiselScalatestTester {
    
  "OpenramTestChip should write to SRAM 0" in {
    test(new openram_testchip).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        //Writing 1 to address 1 in SRAM 0  
        val packet = BigInt("1E020000000200", 16)
        val MOD = (Seq.fill(54)(BigInt(2)).reduce(_*_) )
        val MASK = (Seq.fill(55)(BigInt(2)).reduce(_*_) - 1)
        dut.io.logical_analyzer_packet.poke(packet.U)
        dut.io.gpio_packet.poke(0.U)
        dut.io.in_select.poke(false.B)
        dut.clock.step()
        dut.io.sram0_connections.expect((packet % MOD).U)
        dut.io.sram1_connections.expect(MASK.U)
    }  
  }

  "OpenramTestChip should accept data from GPIO" in {
    test(new openram_testchip).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        //Writing 1 to address 1 in SRAM 0  
        val packet = BigInt("1E020000000200", 16)
        val MOD = (Seq.fill(54)(BigInt(2)).reduce(_*_) )
        val MASK = (Seq.fill(55)(BigInt(2)).reduce(_*_) - 1)
        dut.io.logical_analyzer_packet.poke(0.U)
        dut.io.gpio_packet.poke(BigInt("00000200", 16).U)
        dut.io.in_select.poke(true.B)
        dut.clock.step()
        dut.io.gpio_packet.poke(BigInt("001E0200", 16).U)
        dut.clock.step()
        dut.io.gpio_packet.poke(BigInt("00000000", 16).U)
        dut.clock.step(2)
        dut.io.sram0_connections.expect((packet % MOD).U)
        dut.io.sram1_connections.expect(MASK.U)
        dut.clock.step(5)
        dut.io.sram0_connections.expect((packet % MOD).U)
    }  
  }

  "OpenramTestChip should write to SRAM 1" in {
    test(new openram_testchip).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>    
        //Writing 1 to address 1 in SRAM 1  
        val packet = BigInt("080000000E020000000200", 16)
        val MOD = (Seq.fill(54)(BigInt(2)).reduce(_*_) )
        val MASK = (Seq.fill(55)(BigInt(2)).reduce(_*_) - 1)
        dut.io.logical_analyzer_packet.poke(packet.U)
        dut.io.gpio_packet.poke(0.U)
        dut.io.in_select.poke(false.B)
        dut.clock.step()
        dut.io.sram0_connections.expect(MASK.U)
        dut.io.sram1_connections.expect((packet % MOD).U)
    }
  }

  "OpenramTestChip should read from R/W Port in SRAM 0" in {
    test(new openram_testchip).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>    
        //Reading from address 1 in SRAM 0  
        val packet = BigInt("20020000000100", 16)
        val MOD = (Seq.fill(54)(BigInt(2)).reduce(_*_) )
        val MASK = (Seq.fill(55)(BigInt(2)).reduce(_*_) - 1)
        dut.io.logical_analyzer_packet.poke(packet.U)
        dut.io.gpio_packet.poke(0.U)
        dut.io.in_select.poke(false.B)
        dut.clock.step()
        dut.io.sram0_connections.expect((packet % MOD).U)
        dut.io.sram1_connections.expect(MASK.U)
        dut.clock.step()
        dut.io.sram0_rw_in.poke(1.U)
        dut.clock.step()
        dut.io.la_data.expect(1.U)
    }
  }

  "OpenramTestChip should read from R/W Port in SRAM 0 (GPIO)" in {
    test(new openram_testchip).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>    
        //Reading from address 1 in SRAM 0  
        val packet = BigInt("20020000000100", 16)
        val MOD = (Seq.fill(54)(BigInt(2)).reduce(_*_) )
        val MASK = (Seq.fill(55)(BigInt(2)).reduce(_*_) - 1)
        dut.io.logical_analyzer_packet.poke(0.U)
        dut.io.gpio_packet.poke(BigInt("00000100", 16).U)
        dut.io.in_select.poke(true.B)
        dut.clock.step()
        dut.io.gpio_packet.poke(BigInt("00200200", 16).U)
        dut.clock.step()
        dut.io.gpio_packet.poke(BigInt("00000000", 16).U)
        dut.clock.step(2)
        dut.io.sram0_connections.expect((packet % MOD).U)
        dut.io.sram1_connections.expect(MASK.U)
        dut.clock.step()
        dut.io.sram0_rw_in.poke(1.U)
        dut.clock.step()
        dut.io.gpio_data.expect(1.U)
        dut.clock.step()
        dut.io.gpio_data.expect(0.U)
    }
  }

  "OpenramTestChip should write to shared R/W Port in SRAM 2" in {
    test(new openram_testchip).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>    
        //Writing 1 to address 1 in SRAM 1  
        val packet = BigInt("100000000E020000000200", 16)
        val MOD = (Seq.fill(47)(BigInt(2)).reduce(_*_) )
        val MASK = (Seq.fill(48)(BigInt(2)).reduce(_*_) - 1)
        dut.io.logical_analyzer_packet.poke(packet.U)
        dut.io.gpio_packet.poke(0.U)
        dut.io.in_select.poke(false.B)
        dut.clock.step()
        dut.io.sram2_connections.expect((packet % MOD).U)
    }
  }
}
