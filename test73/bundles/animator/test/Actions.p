import pollen.environment as Env
import LedManager

module Actions {
  
  public setRGB(uint8 id, uint8 red, uint8 green, uint8 blue, uint8 brightness) {

    if (red != 0 || green != 0 || blue != 0) {
      LedManager.setLed(id, true)
    } elif (red == 0 && green == 0 && blue == 0) {
      LedManager.setLed(id, false)
    }

  }

  public setAllOn() {
    LedManager.allOn()
  }

  public setAllOff() {
    LedManager.allOff()
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