import Capacity
# TEST A 'preset' variable gets a default initial value at dcln.
# TEST This will be overriden by a preset initializer.
module Arr implements Capacity {

  uint8 capacity = 3
  host uint8 arr_i = 0
  host uint8 arr[capacity]

  public host inc() {
    arr_i++
    if (arr_i >= capacity) {
      arr_i = 0

    }
  }
  public host testx(uint8 x) {
    capacity = x
  }
  public host set(uint8 i) {
    arr[arr_i] = i
  }
  public host uint8 get() {
    uint8 elem
    elem = arr[arr_i]
    return elem
  }
  host Arr() {
  }
}
