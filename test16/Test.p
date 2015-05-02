import Comp           
from Comp import Mod    

# TEST error case
# TEST qualification on function call uses compostion name.
# TEST Only qualification with module names is supported.

module Test { 
  
  pollen.run() {
    Comp.bar()      # valid call to exported fcn
    Comp.foo()      # foo not exported: does not work with 'import Comp' OR 'from Comp import Mod'
    Comp.Mod.foo()  # full qualification overrides lack of export
    Mod.foo()       # All Mod functions can be called if Mod is imported 
    Mod.bar()       # valid call to Mod fcn
  }

  pollen.shutdown(uint8 id) {}
}
