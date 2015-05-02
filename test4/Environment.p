import Board

composition Environment extends Board {

  host Environment() {
  }

  export Mcu.wait         # Spin the processor for a specified number of microseconds
  export Mcu

}
