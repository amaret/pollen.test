# TEST return array from function: dereference elements
# TEST return array from function: pegging array to returned array
# TEST can initialize scalar array {..} on multiple lines
# TEST uint8 and bool arrays
# TEST runnable test
module ArrayReturn {


  uint8 bufNoDim[]
  uint8 buffer[5]
  uint8 test1[5] = {1, 2, 
                    3, 4, 5}
  bool test2[5] = {true, 
      false, 
      false, true, false}
  bool buffer2[5] 

  uint8[] bar() {
        return test1
  }
  bool[] bar2() {
        return test2
  }
  foobar() {
       uint8 bufNoDim[]  
       bufNoDim @= bar()
       bool fail = false
       for (uint8 i = 0; i < 5; i++) {
          if (bufNoDim[i] != test1[i]) {
             fail = true
          }
       }
       !----------------------------------------

       Test 4.

       ----------------------------------------!
       if (fail) {
          print "FAIL local buffer peg to function return \n"
       }
       else {
          print "PASS local buffer peg to function return \n"
       }

  }

  public foo() {
       bufNoDim @= bar()
       bool fail = false
       for (uint8 i = 0; i < 5; i++) {
          if (bufNoDim[i] != test1[i]) {
             fail = true
          }
       }
       !----------------------------------------

       Test 1. 

       ----------------------------------------!
       if (fail) {
          print "FAIL buffer peg to function return \n"
       }
       else {
          print "PASS buffer peg to function return \n"
       }
       !----------------------------------------

       Test 2. 

       ----------------------------------------!
       print "Test assigning (uint8) elements from array function return:\n"
   
       buffer[0] = bar()[0]
       if (buffer[0] == 1) {
           print "PASS buffer 0th element assigned from returned array\n"
       }
       else {
           print "FAIL buffer 0th element assigned from returned array\n"
       }
       
       buffer[3] = bar()[3]
       if (buffer[3] == 4) {
           print "PASS buffer 3th element assigned from returned array\n"
       }
       else {
           print "FAIL buffer 3th element assigned from returned array\n"
       }
       
       buffer[4] = bar()[4]
       if (buffer[4] == 5) {
           print "PASS buffer 4th element assigned from returned array\n"
       }
       else {
           print "FAIL buffer 4th element assigned from returned array\n"
       }
       !----------------------------------------

       Test 3. 

       ----------------------------------------!
       print "Test assigning (bool) elements from array function return:\n"
   
       buffer2[0] = bar2()[0]
       if (buffer2[0] == true) {
           print "PASS buffer2 0th element assigned from returned array\n"
       }
       else {
           print "FAIL buffer2 0th element assigned from returned array\n"
       }
       
       buffer2[3] = bar2()[3]
       if (buffer2[3] == true) {
           print "PASS buffer2 3th element assigned from returned array\n"
       }
       else {
           print "FAIL buffer2 3th element assigned from returned array\n"
       }
       
       buffer2[4] = bar2()[4]
       if (buffer2[4] == false) {
           print "PASS buffer2 4th element assigned from returned array\n"
       }
       else {
           print "FAIL buffer2 4th element assigned from returned array\n"
       }
       foobar()
  }
}
