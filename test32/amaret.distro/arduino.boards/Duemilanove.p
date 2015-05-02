package arduino.hardware

from atmel.atmega8 import ATmega328 as Mcu

from Mcu import PC0 as Analog0
from Mcu import PC1 as Analog1
from Mcu import PC2 as Analog2
from Mcu import PC3 as Analog3
from Mcu import PC4 as Analog4
from Mcu import PC5 as Analog5

from Mcu import PD0 as Digital0
from Mcu import PD1 as Digital1
from Mcu import PD2 as Digital2
from Mcu import PD3 as Digital3
from Mcu import PD4 as Digital4
from Mcu import PD5 as Digital5
from Mcu import PD6 as Digital6
from Mcu import PD7 as Digital7

from Mcu import PB0 as Digital8
from Mcu import PB1 as Digital9
from Mcu import PB2 as Digital10
from Mcu import PB3 as Digital11
from Mcu import PB4 as Digital12
from Mcu import PB5 as Digital13

# Create an LED module to export. 
from pollen.hardware import MetaLed{false} as Led

# A button module should be created and exported!


composition Duemilanove {

  host Duemilanove() {
    Led.pin := Digital13
  }

  export Led

  export Analog0
  export Analog1
  export Analog2
  export Analog3
  export Analog4    
  export Analog5
  
  export Digital0
  export Digital1
  export Digital2
  export Digital3
  export Digital4
  export Digital5
  export Digital6
  export Digital7
  export Digital8
  export Digital9
  export Digital10
  export Digital11
  export Digital12
  export Digital13
  
  
}