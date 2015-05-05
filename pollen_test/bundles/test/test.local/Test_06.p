import pollen.environment as Env
from virtual.mcu import ConsolePrint as Console

module Test_06 {
  
  pollen.run() {
    Console.printStr("pollen.run!\n")
  }

  pollen.shutdown() {
    Console.printStr("pollen.shutdown!\n")
  }

}
