
meta {type T = uint8}

module MetaM {

  T t
  
  MetaM() {
    t = 10
  }
  
  public T get() { return t }
  
}
