
import InterruptHandler

protocol InterruptSource {

  host setHandlerOnHost(InterruptHandler.isr handler)

  enable()
  
  disable()
  
  clear()
  
  bool isEnabled()

}