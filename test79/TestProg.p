# TEST print statement. Runnable test.
# TEST use binding statment: 'pollen.print := ...'
# TEST NO -p
import Junk
import Cls1
import PrintImpl
module TestProg {

  +{ #include <stdlib.h> }+

  class Nest {
    bool flag = true;
    uint32 aNum = 77
    bool getFlag() { return flag; }
    host Nest() { }
  }

  string s1 = "Test this string"
  uint8 u8   = 1
  uint16 u16 = 2
  uint32 u32 = 3
  int8 i8    = 4
  int16 i16  = 5
  int32 i32  = 6

  host Nest aNest = new Nest()
  host TestProg()  { 
    pollen.printProtocol := PrintImpl
  }

  Nest foo() {
      return aNest
  }

  uint8 getAge() {
      return 7
  }

  pollen.run() {
    print "enter pollen.run, print some stuff\n"
    print " " + s1 + " " + aNest.aNum + "EOL\n"
    print "Now print out the test data\n"
    print "(unsigned):\n"
    print u8 + " " + u16 + " " + u32 + "\n"
    print "(signed):\n"
    print i8 + " " + i16 + " " + i32 + "\n"
    print "Now print out the Nest class field aNum\n"
    print aNest.aNum + " \n"
    bool f = aNest.getFlag()
    print "Now print out a boolean value: " + f + "\n"

    // this will print out the function return
    print "Now print out a boolean value function return: " + aNest.getFlag() + "\n"

    // this will print out a uint8 function return (value 7)
    print "Now print out a uint8 value function return: " + getAge() + "\n"

    // this will fail to print out the function return
    print "Now (fail to) print out a agg function return: " + foo() + "\n"

    // this will call the same print implementaion as above
    Junk.foo()  
    +{ exit(0) }+
  }

}


