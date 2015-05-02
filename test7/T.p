import Led # TEST instantiate to default values
module T {
  bool on() {
    Led.on()
  }
  pollen.run() {
    on()
  }
}
