import pollen.environment as Env 
from Env import TimerMilli
from Env import Print


module Test_18 {

  uint8 counter = 0

  host Test_18() {
    TimerMilli.setHandlerOnHost(msTick)
  }

  msTick() {
    ++counter
    Print.printStr("Millisecond Tick ")
    Print.printUint(counter)
    Print.printStr("\n")

    if (counter == 10) {
      TimerMilli.stop()
    }
  }

  pollen.run() {

    Print.printStr("Runtime! Starting timer...\n")
    TimerMilli.start()

    while(TimerMilli.isRunning()) {

    }
  }

  pollen.shutdown() {
    Print.printStr("Shutdown!\n")
  }

}
