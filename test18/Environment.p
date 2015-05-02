
import Duemilanove as Board
from Board import Mcu
from Mcu import GlobalInterrupts


composition Environment {	

	export GlobalInterrupts
	export Mcu
	//export Mcu.reset
	//export Mcu.wait // has a parameter
}
