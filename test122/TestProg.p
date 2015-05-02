# TEST use binding statment for pollen protocols:
# TEST SleepWake, DynamicMemory
# TEST This checks that the hooks work. 
# TEST That is the pollen protocols can be bound and 
# TEST then their implemetations called. 
# TEST The specification of DynamicMemory not done.
import SleepWakeImpl
import DynMemImpl
import Module1  
import Protocol1 // a vanilla protocol bind for comparison purposes.
module TestProg {

  Protocol1 proto1 := Module1

  host TestProg()  { 
    pollen.sleepWakeProtocol := SleepWakeImpl
    pollen.dynamicMemoryProtocol := DynMemImpl
  }

  bar() {
      pollen.wake()
  }

  pollen.run() {
      proto1.foo()
      pollen.sleep(7)   // note 'pollen' prefix
      pollen.malloc(3)
      pollen.free(3)
      bar()
  }

}


