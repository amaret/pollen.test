module ModFix {

# TEST fix for bug of error message for default loop var for 2 for loops in a row.
# TEST should get no error message.

  foo() {
    uint8 len = 4
    bool f = false
    for (i = 0; i < len; i++) {
      f = true
    }
    for (i = 0; i < len; i++) {
      f = true
    }
  
  }

  public markUsed() {}

}
