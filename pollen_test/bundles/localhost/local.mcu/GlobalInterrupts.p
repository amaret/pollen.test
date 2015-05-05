package local.mcu

from pollen.hardware import GlobalInterruptsProtocol

module GlobalInterrupts implements GlobalInterruptsProtocol {
  
  bool enabled = false

  public enable() {
    enabled = true
  }

  public disable() {
    enabled = false
  }

  public restore(bool state) {
    if (state) {
      print "GlobalInterrupts restored\n"
    } else {
      print "GlobalInterrupts not restored\n"
    }
  }

  public bool isEnabled() {
    return enabled
  }

}