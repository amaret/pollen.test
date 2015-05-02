
import TestProtocol
import TestMod

composition TestComp implements TestProtocol {

  export TestMod
  export TestMod.test
  
  #host test() {  
  #}
}