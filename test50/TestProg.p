import Class1
# TEST executable test
# TEST initializing class object
# TEST printing class values
# TEST target 'new' objects commented out for now

module TestProg {

  +{ #include <stdio.h> }+
  +{ #include <stdlib.h> }+

        class led {
          uint8 red = 1 
          uint8 green
          uint8 blue
          uint8 test_led() {
            blue = 2 
          }   
          host led() { blue = 7}
          led() { red = 3 } 

          print_led(string name) {
            uint8 xx
            +{printf("%s\n", name) }+
            uint8 c = red
            +{printf("%s %d\n", "red", c) }+
            c = green
            +{printf("%s %d\n", "green", c) }+
            c = blue
            +{printf("%s %d\n", "blue", c) }+
          }
          host fcnTest() {}
          host fcnTest1() {fcnTest()}
        }   

        uint8 xx = 0

        host new led hll()
        //new led tll()
        //TestProg tt[2] //= { null, null }
        host led leds[2]  = { new led(), new led() }
        host uint8 nums[2]  = { 1, 2 }

        host new Class1 c_host()
        //new Class1 c_targ()
        host led j = new led()

  public test() {
     //tll.print_led("tll")
     hll.print_led("hll")
     //tll.print_led("tll")
     +{ exit(0) }+
  }
  host TestProg() {
  }

  TestProg() {
     +{printf("%s\n", "TestProg") }+
  }

  pollen.run() {
    test()
  }

}
