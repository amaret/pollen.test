package distro.arduino

----

This module defines all the pollen lifecycle intrinsics

----

module Lifecycle {

	#
	# Invoked immediately after initialization of C runtime
	#
	pollen.reset() {
	
	}
	
	#
	# Invoked after every application module's target initializer has been invoked
	# and immediately before pollen.run is called.
	#
	pollen.ready() {
	
	}
	
	#
	# 
	#
	#pollen.shutdown(uint8 code) {
	#
	#}
	
	#
	# 
	#
	#pollen.hibernate(uint8 code) {
	#
	#}
}