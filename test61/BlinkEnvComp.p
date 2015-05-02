import AvrPin
import Led

composition BlinkEnvComp {

  host BlinkEnvComp() { }

  preset BlinkEnvComp() {
    Led.pin := AvrPin
  }

  export Led
  export AvrPin

}
