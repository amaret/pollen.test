import Environment as Env
from Env import Mcu 

module TestImporExport {
      
	pollen.run() {
	   pollen.reset()
	}
	
	pollen.reset() { 
           Mcu.reset() 
        }	
	
}
