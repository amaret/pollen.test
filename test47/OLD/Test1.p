//import EventHandler{uint8} as Handler
import Event{uint8} as Ev
import ZZ
import Queue{Ev, uint8} as QQ

module Test1 {

   host new QQ myQ(3)
   pollen.run() {
   }
}
