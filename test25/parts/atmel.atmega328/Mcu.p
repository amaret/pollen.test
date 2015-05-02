package atmel.atmega328

-------------------------------------------------------------------------------
Device driver for the atmega328p microcontroller.
-------------------------------------------------------------------------------

from pollen.hardware_old import Mcu as McuProtocol

module Mcu implements McuProtocol {

public reset() {

    }

    public shutdown() {

    }

    public wait(uint32 us) {
        --- This loop should be generated. Given mcu frequency, num of nops = 1us
        for (; us > 0; --us) {
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
            +{ asm ("nop") }+
        }
    }

    public cycle() {
        +{ asm ("nop") }+
    }

    public uint32 getFrequency() {
        return sysFreq
    }

    public host uint32 host_getFrequency() {
        return sysFreq
    }

    public setFrequency(uint32 hz) {
        sysFreq = hz
    }

    public host host_setFrequency(uint32 hz) {
        sysFreq = hz
    }

    -----------------------------------------------------------------------------
    Private data members
    -----------------------------------------------------------------------------
    uint32 sysFreq

}
