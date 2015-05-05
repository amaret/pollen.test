
from pollen.hardware import HandlerProtocol as HP
from virtual.mcu import ConsolePrint as Console


module ArrayFuncRef {
  
  //HP.handler() arr[3]
  //host new HP.handler() arr[3]
  host HP.handler arr[3]
  host HP.handler() h


  pollen.run() {

    arr[0] = tick1
    arr[1] = tick2
    arr[2] = tick3

    for (uint8 i = 0; i < 3; ++i) {
      h = arr[i]
      h()
    }


    // for (uint8 i = 0; i < 3; i++) {
    //   //HP.handler() h = arr[i]   // Does not translate
    //   HP.handler() h
    //   h = arr[i]
    //   h()

    //   //arr[i]()      // Does not translate! 
    // }
  }

  tick1() {
    Console.printStr("TICK 1\n")
  }

  tick2() {
    Console.printStr("TICK 2\n")
  }

  tick3() {
    Console.printStr("TICK 3\n")
  }

  pollen.shutdown() {

  }
}
