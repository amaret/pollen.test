from virtual.mcu import Mod1
from virtual.mcu import Mod2
//import Mod2
# TEST two bundles have same package name
# TEST should give error and exit gracefully
# TEST NOT runnable test.
module Test1 {
  pollen.run() {
          Mod1.foo()
          Mod2.foo()
  }
}
