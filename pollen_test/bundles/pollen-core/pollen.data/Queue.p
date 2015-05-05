!-- 

  First-in-first-out (FIFO) data structure implemented as an array of fixed length. 

  This data structure holds a collection of instances of the type specified. 
  There is a shallow copy when you use the add and remove functions. 
  
--! 

meta {type E, type T = uint8}

class Queue {

  host uint8 capacity = 1
//  host E elements [capacity]
  E elements [capacity]
  T length
  T head
  T tail
  
  public host Queue(T max) {
    @length = 0
    @head = 0
    @tail = 0

    if (max > @capacity) {
      @capacity = max
    }
  }
  
  // Default target constructor
  Queue() {}
    
  public host setCapacityOnHost(T capacity) {
    @capacity = capacity
  }

  public host T getCapacityOnHost() {
    return @capacity
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
    E elt
    if (!isEmpty()) {
      elt = elements[head]  
    }
    return elt
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
