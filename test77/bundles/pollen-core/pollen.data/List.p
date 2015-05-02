
class List {
  
  class Element {
    Element next = null

    public bool isActive() {
      return next != null
    }
  }

  volatile Element first
  volatile Element last

  host List() {
    @first = @last
    @last = @first
  }

  public add(Element e) {
    @last.next = e
    @last = e
    e.next = @first
  }

  public Element get() {
    volatile Element e
    e = @first
    
    if ((@first = e.next) == @first) {
        @last = @first
    }

    e.next = null
    return elem
  }

  public Element getAt(index) {    
    volatile Element e 
    uint8 i = 0;
    e = @first
    
    if (@hasElements()) {
      do {
        if (i++ == index) { break }
        else { e = e.next }
      } while (e != @first)

      if (e == @first) { e = null }
    }
    else {
      e = null
    }
        
    return e
  }

  public Element getNext(e) {
    return e == @last ? null : e.next
  }

  public bool hasElements() {
    return @first != null
  }

  public List.remove( e ) {

    volatile Element tmp
    tmp = @first
    
    if (@hasElements()) {
      if (e == @first) {
        @first = @first.next
      } else {
        do { 
          if (tmp.next == e) {
            tmp.next = e.next                    
            break    
          } 
        } while (tmp != @first)
      }
    }
}

}