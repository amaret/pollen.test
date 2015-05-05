import pollen.environment as Env
from Env import PA0 as Red
from Env import PA1 as Green
from Env import PA2 as Blue
from Env import PA3 as Stat1
from Env import PA4 as Stat2

module Actions {
  
  public setRGB(uint8 id, uint8 red, uint8 green, uint8 blue, uint8 brightness) {
    if (red != 0) { Red.clear() }
    else { Red.set() }

    if (green != 0) { Green.clear() }
    else { Green.set() }

    if (blue != 0) { Blue.clear() }
    else { Blue.set() }

  }

  public nocmd(uint8 num) {
    for(uint8 i = 0; i < num; i++) {
      Red.toggle()
      Green.toggle()
      Blue.toggle()

      for(uint8 j = 0; j < 10; j++) {
        Env.wait(1000)
      }
    }
  }

  public configurationChanged() {
    Stat1.toggle()
  }

  public timerOverflow() {
    Stat2.toggle()
  }

  public usbDisconnect() {
    // nocmd(3)
    // Red.set()
    // Green.set()
    // Blue.set()
  }

  public usbConnect() {
    // nocmd(3)
    // Red.clear()
    // Green.clear()
    // Blue.clear()
  }

  public usbReset() {
    // nocmd(6)
    //usbDisconnect()
  }
}