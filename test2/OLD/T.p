#meta {type Z, bool lowValue = false}
meta {type Z, bool lowValue }
module T {
  host uint8 get() {
      bool l = lowValue
    //if (lowValue) {
      return Z.get()
    //}
  }
}
