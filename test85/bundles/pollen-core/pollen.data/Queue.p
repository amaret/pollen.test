!-- 

  First-in-first-out (FIFO) data structure implemented as an array of fixed length. 
  
--! 

meta {type E, type T = uint8}

class Queue {

  const uint8 capacity = 10
  host E elements [capacity]
  T length
  T head
  T tail
  T maxLength
  
  public host Queue(T max) {
    @length = 0
    @head = 0
    @tail = 0
    @maxLength = max

    if (max > @capacity) {
      @capacity = max
    }
  }
  
  // Default target constructor
  Queue() {}
    
  public host setCapacity(T capacity) {
    @capacity = capacity
  }

  public bool add(E e) {
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
  
  public E remove() {
    E e = null
    
    if (!@isEmpty()) {
      e = @elements[head]      
      ++head
      --length
      if (head == capacity) { head = 0 }      
    }

    return e
  }
  
  public E peek() {
    if (!isEmpty()) {
      return elements[head]
    }
  }
  
  public bool isEmpty() {
    return length == 0
  }
  
  public T getCapacity() {
    return @capacity
  }
  
  public T getLength() {
    return @length
  }
  
}
