
from pollen.hardware import HandlerProtocol as HP
import FuncRefClass
from virtual.mcu import ConsolePrint as Console

module HostFuncRefPass {
  
  host new FuncRefClass f(foo)

  pollen.run() {
    f.test()
  }

  foo() {
    Console.printStr("YES!!\n")
  }  

  pollen.shutdown() {

  }
}
