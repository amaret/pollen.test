
from pollen.data import Queue{uint8} as Qint8

#TEST simple declaration of meta Queue using host constructor
#TEST meta Queue uses a default meta type parameter


module Test1 {

  host Qint8 myQ
  
  host Test0() {
    myQ = new Qint8(10)
  }
  
  pollen.run() { }
  pollen.shutdown(uint8 id) { }
}
