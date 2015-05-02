import InitTestC

# TEST order of exec of hostInit(). 
# TEST top level module should be last.
# TEST note the only for sure order is that InitTestM is LAST.

module InitTestM {

  host InitTestM() {
    print "InitTestM host init\n"
    print "Init order should be: \n"
    print "1. InitTestM2 2. InitTestC 3. InitTestM \n"
  }

  pollen.run() {
    InitTestC.foo()
  }
  pollen.shutdown(uint8 id) {
  }
}
