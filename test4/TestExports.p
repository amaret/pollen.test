
import GIComposition2                           # 1
from GIComposition2 import AsInterrupts         # 2
# TEST exports, several cases 
# TEST AsInterrupts.enable()  does not resolve
# TEST See comments in test for other cases
from Environment import Mcu                     # 3

module TestExports {

  foo () {

     # enabled by 1 and fcn export in imported composition GIComposition2
     GIComposition2.enable()    

     # Not resolved because GlobalInterrupts is not exported in GIComposition2
     #  (event though enable is exported)
     GIComposition2.GlobalInterrupts.enable()   

     # Resolved because full qualification overrides fact that 
     # GlobalInterrupts is not exported in GIComposition2
     GIComposition2.GlobalInterrupts.disable() 

     # enabled by 1 and fcn export in imported composition GIComposition2
     GIComposition2.other_enable()   

     # enabled by 1 and OtherI export in imported composition GIComposition2
     GIComposition2.OtherI.other_disable() 

     # NOT a match unless GICompositions2 exports module AsInterrupts
     AsInterrupts.enable()   

     # enabled by 2 and function export in GIComposition2
     AsInterrupts.disable() 

     # Resolve to local fcn
     enable()

     Mcu.wait(3)
  }
  pollen.run() {
  }
  enable() {
  }
}

