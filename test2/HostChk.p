# TEST visibility of host fcn in target scope (none)
# TEST visibility of target fcn in host scope (none)
# TEST serious error ('identifier is not declared') should
# TEST result in no javascript execution
# TEST serious error using javascript rsvd word as host phase name

module HostChk {

   host uint8 host1 = 1 // variables visibile in all contexts
   uint8 target1 = 2
   host uint8 final = 3  // reserved in javascript

   foo() {
     target1 = host1
     bar() // host fcn won't be visible in target scope
   }

   host eval() { // this is a javascript reserved word and should get error
    target1 = host1
   }

   host bar(uint8 prototype) {
    prototype = 7 // this is a javascript reserved word and should get error
    uint8 var = 3 // this is a javascript reserved word and should get error
    target1 = host1
   }

   host HostChk() {
     bar()
     foo() // target fcn won't be visible in host scope
   }

}
