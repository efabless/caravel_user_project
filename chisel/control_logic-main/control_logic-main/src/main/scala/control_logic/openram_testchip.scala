// See README.md for license details.

package openram_testchip

import chisel3._
import chisel3.util._

import scala.collection.mutable.ArrayBuffer

class openram_testchip extends Module {
    val io = IO(new Bundle{
        val logical_analyzer_packet = Input(UInt(86.W))
        val gpio_packet = Input(UInt(32.W))
        val in_select = Input(Bool())
        val sram0_rw_in = Input(UInt(32.W))
        val sram0_r0_in = Input(UInt(32.W))
        val sram1_rw_in = Input(UInt(32.W))
        val sram1_ro_in = Input(UInt(32.W))
        val sram2_rw_in = Input(UInt(32.W))
        val sram3_rw_in = Input(UInt(32.W))
        val sram4_rw_in = Input(UInt(32.W))
        val sram5_rw_in = Input(UInt(64.W))
        val sram0_connections = Output(UInt(55.W))
        val sram1_connections = Output(UInt(55.W))
        val sram2_connections = Output(UInt(48.W))
        val sram3_connections = Output(UInt(46.W))
        val sram4_connections = Output(UInt(47.W))
        val sram5_connections = Output(UInt(83.W))
        val la_data = Output(UInt(64.W))
        val gpio_data = Output(UInt(32.W))
    })

    val input = Reg(UInt(86.W))
    val output = Reg(UInt(64.W))
    val in_sel = RegNext(io.in_select)
    
    val gpio_sel = RegInit(true.B)
    val la_sel = RegNext(io.in_select)
    gpio_sel := io.in_select

    def getMask(bitWidth: Int): UInt = {
        val MOD = BigInt(1) << bitWidth
        val MASK = MOD - BigInt(1)
        MASK.U
    }

    val SRAMDataReceived = RegInit(false.B)
    val (loadingCount, loadingDone) = Counter(0 until 3, gpio_sel, !gpio_sel)
    val (transferCount, transferDone) = Counter(0 until 2, RegNext(SRAMDataReceived))

    val wrap = RegNext(loadingDone)
    val packetSeq = Reg(Vec(3, UInt(32.W)))
    packetSeq := VecInit(Seq.fill(3)(0.U))

    input := io.logical_analyzer_packet

    gpio_sel := Mux((!wrap && gpio_sel), true.B, false.B)
    (0 until 3).foreach(i => packetSeq(i) := Mux(loadingCount === i.U, io.gpio_packet, packetSeq(i)))

    when(wrap && gpio_sel){
        input := Cat(packetSeq(2), packetSeq(1), packetSeq(0))
    }
    
    when(!gpio_sel){
        input := input
    }
    val chip_select: UInt = input(85, 83)
    
    io.sram0_connections := getMask(55)
    io.sram1_connections := getMask(55)
    io.sram2_connections := getMask(48)
    io.sram3_connections := getMask(46)
    io.sram4_connections := getMask(47)
    io.sram5_connections := getMask(83)
    
    val csb0 = input(54)
    val web = input(53)

    when(!gpio_sel || !la_sel)
    {
        switch(chip_select){
            is(0.U){
                io.sram0_connections := input.tail(31)
            }

            is(1.U){
                io.sram1_connections := input.tail(31)
            }

            is(2.U){
                io.sram2_connections := input.tail(38)
            }

            is(3.U){
                io.sram3_connections := input.tail(40)
            }
            
            is(4.U){
                io.sram4_connections := input.tail(39)
            }

            is(5.U){
                io.sram5_connections := input.tail(3)
            }
        }
    }

    output := 0.U
    //If operation is read
    when(web){
        switch(chip_select){
            
            is(0.U){
                output := Mux(csb0, io.sram0_r0_in, io.sram0_rw_in)
            }

            is(1.U){
                output :=  Mux(csb0, io.sram1_ro_in, io.sram1_rw_in)
            }

            is(2.U){
                output := io.sram2_rw_in
            }

            is(3.U){
                output := io.sram3_rw_in
            }

            is(4.U){
                output := io.sram4_rw_in
            }
            
            is(5.U){
                output := io.sram5_rw_in
            }
        }

        when(in_sel === 1.U){
            SRAMDataReceived := true.B 
        }
    }

    io.la_data := 0.U 
    io.gpio_data := 0.U 
    when(in_sel === 1.U){
        when(transferCount === 0.U){
            io.gpio_data := output(31, 0)
        }.elsewhen(transferCount === 1.U){
            io.gpio_data := output(63, 32)
            SRAMDataReceived := false.B
        }
    }.otherwise{
        io.la_data := output
    }
}

import chisel3.stage.ChiselStage

object openram_testchipDriver extends App {
  (new ChiselStage).emitVerilog(new openram_testchip)
}