import GlobalInterrupts as GImod

# TEST  declaring and binding a protocol member in an outermost class: works
# TEST  declaring and binding a protocol member in a nested class: error msg
# TEST  initializing a nested class instance in class scope

from pollen.interfaces import GlobalInterrupts as GI
import Cls2
class Cls3 {

  class Cls4 {
    uint8 i = 7
    host GI gi_class_nest
    host Cls4(uint8 p) {
      i = p
      gi_class_nest := GImod
    }
  }
  host GI gi_class

  host Cls4 c1 = new Cls4(3)
  host Cls2 c2

  public host Cls3() {
    c2 = new Cls2()
    gi_class := GImod
  }
  public markUsed() {}
  pollen.run() {}

}
