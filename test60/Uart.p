import Cpu
module Uart {
  host uint32 uart_freq = 0
  host Uart() {
    uart_freq = Cpu.getFreq()
    print "Uart hostInit: uart_freq " + uart_freq + "\n"
  }

}
