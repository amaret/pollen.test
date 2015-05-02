#from Missing import Test
# TEST an injected string with printf formatting characters preserved
# TEST message for a missing package
# TEST some intrinsics: pollen.unitname, pollen.assert
# TEST a for loop with an undeclared for loop variable
module PrintTest {

        +{ #include <stdio.h> }+
       
         int32 f1, f2, f3


        forTest() {
          for (i = 0; i< 10; i++) {
            printStr("Hello World!")
          }
        }
        forTest2() {
          for (;;) {
            printStr("Hello World!")
          }
        }

        pollen.run() {
          pollen.assert(f1 == 3, "chk")
          printStr("Hello World!")
        }

        host hostOtherTest() {
           hv = 3 
        }
        host uint32 hv = 0

        otherTest() {
          int32 z, w, p
          z = w = 3                    
          z = w = p = 3               
          z = w = p = z = 3          
          z = 3                     
          f1 = f2 = f3 = 3 
          z = 3 * 5 + f1
          printStr(pollen.unitname)
        }
        
       
        printStr(string str) {
           pollen.reset()
           //Test.checkTest()
          +{ printf("Str %s", str) }+
        }

      
      }
