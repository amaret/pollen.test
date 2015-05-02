#package basic

import AvrPin
#import MspPin
import Led

composition BlinkEnv {

  host BlinkEnv() {
    Led.pin := AvrPin
  }

  export Led

}
