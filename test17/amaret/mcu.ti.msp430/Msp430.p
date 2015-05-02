from pollen.interfaces import Mcu

protocol Msp430 extends Mcu {

    host uint32 getMasterClock()
    host uint32 getSubMasterClock()    
    host uint32 getAuxiliaryClock()
    
    host setMasterClock(uint32 freq)    
    host setSubMasterClock(uint32 freq)
    host setAuxiliaryClock(uint32 freq)

}