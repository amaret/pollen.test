package pollen.interfaces

!----

Standard interrupt interface.

----!


import Handler

protocol Interrupt {
	
	#host setHandler(Handler.handle h)	
	
	public setHandler(Handler.handle h)

	public enable()

	public bool enabled()

	public disable()

	public clear()

}
