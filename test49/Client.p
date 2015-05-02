import Event{uint8} as Event_uint8
import EventFactory{uint8} as EFactory
# TEST This test is an attempt to use host construction with deferred meta type 
# TEST instantiation. Needs more work.
# TEST Also looking at how to do a factory.
module Client {

  Event_uint8 e //= new Event_uint8()
  const uint8 econst = 8
  uint8 x = 0

  public host Client() {
    //e = EFactory.create(handle, econst)
    x = 7
  }
  public Client() {
    x = 2
  }
  public handle (uint8 v) {
    x = v
  }
  pollen.run() {
    handle(3)
    //e = new Event_uint8()
  }
}
