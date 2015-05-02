import Environment as Env

from Env import GlobalInterrupts
from Env import Mcu 
# TEST Calling functions exported from composition
# Mcu.reset() is resolved because 'export Mcu' exports all Mcu exported functions
# GlobalInterrupts.enable is not resolved because there is only a module export
//from Env import Mcu.reset // can't import a function


module TestImporExport {
      
	pollen.run() {

		GlobalInterrupts.enable()		
		while (true) { } 
	}
	
	pollen.reset() { 
                Mcu.reset() 
        }	
	
}
