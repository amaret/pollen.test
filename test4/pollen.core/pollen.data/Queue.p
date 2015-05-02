!-- 

  First-in-first-out (FIFO) data structure implemented as an array of fixed length. 
  
--! 

meta {type E, type T = uint8}

class Queue {

  E elements []
  T capacity
  T length
  T head
  T tail
  
  public host Queue(T capacity) {
    @capacity = capacity
    @elements = E[capacity]
    @length = 0
    @head = 0
    @tail = 0
  }
  
  Queue() {
    printStr("Queue created with capacity: ")
    printInt(@capacity)
  }
    
  public host setCapacity(T capacity) {
    @capacity = capacity
    @elements = E[capacity]
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
    
    if (!isEmpty()) {
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
  
  printStr(string str) {
    +{ printf("%s\n", str) }+
  }
  
  printInt(uint32 i) {
    +{ printf("%d\n", i) }+
  }
}