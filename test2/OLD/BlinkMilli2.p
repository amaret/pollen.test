package g
from cc.arduino import Environment as Env
# TEST simple BlinkMilli

from Env import Led
from pollen.time import TimerMilli
import T{Y, true} as TT
#import T as TT

#meta {bool lowValue = true} module BlinkMilli2 {
#meta {type T, bool lowValue = true} module BlinkMilli2 {
module BlinkMilli2 {
     
        host toggle() { 
           bool lowValue=true
           TT.get()
        }

        pollen.run() {

           Led.toggle() 

                #TimerMilli.start(toggle, 50)
                while (true) { }  
        }    
     
        pollen.reset() {  }  
}

