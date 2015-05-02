import Event
!-- 

  TEST using '@' in a module
  
--! 


module Queue {

  const uint8 capacity = 10
  host Event elements [capacity]
  uint8 length
  uint8 head
  uint8 tail
  uint8 maxLength
  
  public host Queue() {
    @length = 0
    @head = 0
    @tail = 0
    @maxLength = capacity

  }
  
  // Default target constructor
  Queue() {}
    
  public host setCapacity(uint8 capacity) {
    @capacity = capacity
  }

  public testCapacity(uint8 capacity) {
    #just checking handling of '@'
    if (@capacity != capacity) {
    }
  }

  public bool add(Event e) {
    if (@length < @capacity) {
      @elements[tail] = e
      ++tail
      ++length
      if (tail == capacity) {
        tail = 0
      }
      return true
    } else {
      return false
    }
  }
  
  public Event remove() {
    Event e = null
    
    if (!@isEmpty()) {
      e = @elements[head]      
      ++head
      --length
      if (head == capacity) { head = 0 }      
    }

    return e
  }
  
  public Event peek() {
    if (!isEmpty()) {
      return elements[head]
    }
    return null
  }
  
  public bool isEmpty() {
    return length == 0
  }
  
  public uint8 getCapacity() {
    return @capacity
  }
  
  public uint8 getLength() {
    return @length
  }
  
}
