import Y 
import ZZ
# TEST multiple instantiations of the same type, different args
import Led {true, Y} as Led1
import Led {false, Y} as Led2
module T implements ZZ {
  pollen.run() {
  }
  bool on() {
    Led1.on()
    Led2.on()
  }
}
