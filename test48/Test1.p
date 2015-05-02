import ConfigPresets
import Mod1
# TEST fix import order no longer impacts host initial values, see NOTES
module Test1 {
 +{ #include <stdlib.h> }+

  pollen.run() {
    +{ exit(0); }+
  }

}
