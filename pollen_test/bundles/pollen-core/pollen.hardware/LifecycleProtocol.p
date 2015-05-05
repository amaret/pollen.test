package pollen.hardware

protocol LifecycleProtocol {
  
  reset() 

  ready() 

  //shutdown(uint8 id)  breaks stuff!
  shutdown()

}
