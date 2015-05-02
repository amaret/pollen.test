!-- 

  First-in-first-out (FIFO) data structure implemented as an array of fixed length. 
  
--! 

from pollen.hardware import HandlerProtocol as HP

class TestQueue {

  const uint8 capacity = 10
  host HP.handler() elements [capacity]
  uint8 length
  uint8 head
  uint8 tail
  uint8 maxLength
  
  public host TestQueue(uint8 max) {
    @length = 0
    @head = 0
    @tail = 0
    @maxLength = max

    if (max > @capacity) {
      @capacity = max
    }
  }
  
  // Default target constructor
  TestQueue() {}
    
  public host setCapacity(uint8 capacity) {
    @capacity = capacity
  }

  public bool add(HP.handler e) {
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
  
  public HP.handler remove() {
    HP.handler() e = null
    
    if (!@isEmpty()) {
      e = @elements[head]      
      ++head
      --length
      if (head == capacity) { head = 0 }      
    }

    return e
  }
  
  public HP.handler peek() {
    if (!isEmpty()) {
      return elements[head]
    }
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
