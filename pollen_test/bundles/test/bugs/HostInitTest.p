!--
  Test to see if host initializers are getting called
  --!

module HostInitTest {
  
  +{ #include <stdio.h> }+

  host HostInitTest() {
    print "Host initializer called\n"
  }

  HostInitTest() {
    +{ printf("Target initializer called\n") }+
  }

  pollen.run() {
    +{ printf("Pollen run\n") }+
  }

  pollen.shutdown() {
    
  }
}