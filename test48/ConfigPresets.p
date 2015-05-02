import Arr
# TEST that the preset initializers for array dimension
# TEST for host (only), preset array dims do not have to be c compiler time constants
composition ConfigPresets {
  preset ConfigPresets() {
    Arr.capacity = size()  // function return!
  }
  host uint8 size() {
      return 8
  }
  host ConfigPresets() {
  }
}
