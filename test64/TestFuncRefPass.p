# TEST passing function reference as a parameter then calling it
import HandlerProtocol as HP
import FuncRefClass

module TestFuncRefPass {

  HP.handler() myHandler
  
  host new FuncRefClass f(foo)

  pollen.run() {
    myHandler = foo
    f.test()
  }

  foo() {
    print "YES!!\n"
  }  

  pollen.shutdown(uint8 id) {

  }
}
