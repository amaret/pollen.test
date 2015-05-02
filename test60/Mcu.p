import Cpu
import Uart
composition Mcu {

  export Cpu

  preset Mcu() {
    //Cpu.setFreq(6) // this fails because the variable is not marked as preset
    // so the assignment is overridden
    Cpu.freq = 6
    print "Mcu presetInit, Cpu.freq set to 6\n"
  }

  host Mcu() {
    Cpu.setFreq(7)  // should be ignored as Cpu.freq is set in the preset above
    print "Mcu hostInit, Cpu.freq set to " + Cpu.getFreq() + "\n"

  }

}
