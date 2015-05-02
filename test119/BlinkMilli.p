# TEST array creation and initialization using new syntax:
# TEST 'T[] arr'   (in addition to 'T arr[]')
module BlinkMilli {

     +{ #include <stdlib.h> }+

        uint8[4] nonhostarr = {1,2,3,4}
        host uint8[4] hostarr = {1,2,3,4}
        
        host BlinkMilli() {
          uint8 nestarr[4] = {1,2,3,4}
          print "local arr at idx 2 is " + nestarr[2] + "\n"
        }

        test()  {
          print "module arr at idx 2 is " + nonhostarr[2] + "\n"
          print "host module arr at idx 2 is " + hostarr[2] + "\n"
        }

        pollen.run() { 
            test()
            +{ exit(0) }+
        }    
}
