import pollen.environment as Bijou

from bijou.parts import SendOsc as OSC

module Test7 {

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    OSC.sendRGB(192, 37, 90)
    OSC.sendRGB(255, 255, 255)

  }

  pollen.shutdown(uint8 id) {

  }

}
