import FakePin as Pin
import FakeLed as Led

composition HostCallComp {
  
  preset HostCallComp() {
    Led.pin := Pin
  }

  export Led

}