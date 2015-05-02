package g
import Z
from cc.arduino import Environment as Env
# TEST simple BlinkMilli
# TEST initializing host variable based on meta formal parameter value
# TEST stripping host attribute for host vars assigned in target fcns
# TEST assigning var to return of void function (gets 'operand type error')
# TEST parser on some empty constructs
# TEST using javascript rsvd words as names 

import HostChk
from Env import Led
from pollen.time import TimerMilli
import T{Y, true} as TT
module BlinkMilli2 {

        class nestClass {}

        enum State { UNINITIALIZED=0, INITIALIZATION=1, ACTIVE=2, IDLE=3, ERROR=5 }

        public uint8 switch_test(uint8 state)  { }

        public foo() { while (true) {} }
        public bar() { while (true) {} }
     
        host uint8 chk = 3
        host uint8 arr[4] = {1,2,3,4}
        host uint8 chk2 = 2

        Led.toggle() gref
        Led.on() fref
     
        host toggle() { 
           bool lowValue=true
           chk = 2
           chk2 = 3   # should be const
           TT.get()
        }

        pollen.run() {

           bool b = false
           uint8 i = 2

           Led.toggle() 
           fref = gref
           i = fref()
           b = gref()
           //toggle() 
           chk = 1
           arr[1] = 7

           while (true) { }  
        }    
     
        pollen.reset() {  }  
}

