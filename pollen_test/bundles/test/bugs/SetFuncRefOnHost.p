!--
  Test to show that setting function references in host functions is not working
  --!

# pollen.hardware.HandlerP defines an empty function that I use as the func ref 
from pollen.hardware import HandlerP

module SetFuncRefOnHost {

  +{ #include <stdio.h> }+

  host HandlerP.handler() myHandler

  host SetFuncRefOnHost() {
    setTheFuncRefOnHost(theHandler)
  }

  host setTheFuncRefOnHost(HandlerP.handler h) {
    myHandler = h
  }

  setTheFuncRef(HandlerP.handler h) {
    myHandler = h
  }

  pollen.run() {
    // uncoment the line below and see that the handler is set appropriately.
    // setTheFuncRef(theHandler)

    myHandler()
  }

  theHandler() {
    +{ printf("Handler called\n") }+
  }

  pollen.shutdown() {

  }

}