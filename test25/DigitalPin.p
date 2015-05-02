from cc.arduino import Uno
from Uno import D13
composition DigitalPin {
  export D13
  export D13.clear
  export D13.toggle
  export D13.makeOutput
}

