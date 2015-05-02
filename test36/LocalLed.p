from amaret.boards import LocalBoard
from LocalBoard import Led
composition LocalLed {
  export Led
  export Led.off
  export Led.toggle
}
