!-- 

  List data structure implemented as an array of fixed length. 
  
--! 

meta {type E, type T = uint8}

class List {

  host uint8 capacity = 1
  host E elements [capacity]
  T length
  T head
  T tail
  
  public host List(T max) {
    @length = 0
    @head = 0
    @tail = 0

    if (max > @capacity) {
      @capacity = max
    }
  }
  
  // Default target constructor
  List() {}
    
  public host setCapacityOnHost(T capacity) {
    @capacity = capacity
  }

  public host T getCapacityOnHost() {
    return @capacity
  }

  public E getAt(index) {

  }

  public bool push(E e) {
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

  public E pop() {
    E e = null
    
    if (!@isEmpty()) {
      e = @elements[head]      
      ++head
      --length
      if (head == capacity) { head = 0 }      
    }

    return e
  }
  
  public E remove(index)

  public E peek() {
    if (!isEmpty()) {
      E elt = null
      elt = elements[head]  
      return elt
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
