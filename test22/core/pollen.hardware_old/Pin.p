package pollen.hardware_old

-------------------------------------------------------------------------------

Protocol definition for a general purpose input / output pin (gpio).

    -------------------------------------------------------------------------------

    protocol Pin {

    set()                 #--- Set the pin high

    clear()               #--- Set the pin low ---

    bool get()            //--- comment

    toggle()              #--- Toggle the state of the pin


    bool input()          //--- Check if pin is configured as an input

    bool output()         #--- Check if pin is configured as an output

#input(bool enable)    #--- Make pin an input

#output(bool enable)   //--- Make pin an output --- 


}
