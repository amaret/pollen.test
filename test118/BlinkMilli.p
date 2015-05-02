# TEST array creation and initialization using new syntax:
# TEST 'T[] arr'   (in addition to 'T arr[]')
module BlinkMilli {

        class led {
          uint8 red = 1
          uint8 blue
          uint8 test_led() {
            blue = 2
          }
          host led(uint8 j) { blue = j}
          led() { red = 3 }
          public uint8 foo(uint8 p) {
            return 2
          }
        }

        host new led hll(9)
        uint8[4] nonhostarr = {1,2,3,4}
        host led[2] ledArr = { new led(2) }
        host led[3] leds = { null, null, null}
        host uint8[4] hostarr = {1,2,3,4}
        uint8[] chkarr = {1,
                          2,
                          3,
                          4}
        uint8[]  chkarr2
        uint8[3] chkarr3 = {1}
        uint8[2] chkarr4 = {1,2}
        uint8 nonhostVarTest = 9
        host uint8[nonhostVarTest] chkarr5
        uint8[nonhostVarTest] chkarr6
        host uint8 hostVarTest2 = 9
        host uint8[hostVarTest2] chkarr7
        uint8 chkarr8[hostVarTest2]

        foobar(uint8[] p) { }

        host uint8 initialBlue = 33
        
        public BlinkMilli() {
        }

        host BlinkMilli() {
          bind()
        }

        host bind() {
          uint8 nestarr[4] = {1,2,3,4}
          hostarr[0] = 0
          hostarr[1] = 3
        }

        uint8 test(bool f)  {
           uint8 t = hll.test_led()
           t = ledArr[0].foo(t)
           t = ledArr[0].red
           return 3
        }

        bool chkArray(uint8 y) {
          uint8[2] arr = {1,2}
          { 
                arr[1] = test(true) // a block
          }     
        }    

        pollen.run() { }    
}

