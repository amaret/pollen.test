meta {type Z, bool lowValue } // 'lowValue' instantiated with value true
module T {
  host uint8 x = 1
  public host uint8 get() {
      bool l = lowValue
      if (lowValue) {
        return 5
      }
      else {
        return 3
      }
  }
  host T() {
    x = get()
  }
}
