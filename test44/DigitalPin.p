from arduino.uno import Environment
from Environment import Digital13
composition DigitalPin {
  export Digital13
  export Digital13.clear
  export Digital13.toggle
  export Digital13.makeOutput
}

