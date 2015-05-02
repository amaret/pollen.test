package pollen.hardware_old

!------------------------------------------------------------------------------ 

Protocol definition for a general purpose input / output pin (gpio).

-------------------------------------------------------------------------------!

protocol Pin {

  set()                 #--- Set the pin high

  clear()               #--- Set the pin low --- 
  
  toggle()              #--- Toggle the state of the pin
  
  bool get()            #--- Get the pin state

  bool isInput()          #--- Check if pin is configured as an input
  
  bool isOutput()         #--- Check if pin is configured as an output
  
  setInput(bool enable)    #--- Make pin an input
  
  setOutput(bool enable)   #--- Make pin an output --- 
  
}
