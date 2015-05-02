import ATmega328 as Mcu

composition Board {

  host Board() {
    #Mcu.setFrequencyOnHost(16000000)
    #Core.setFrequencyOnHost(16000000)
    #ATmega328.setFrequencyOnHost(16000000)
  }

  export Mcu
}
