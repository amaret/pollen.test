import On1
import On2
import On3
import On4
import On5
import OnP

# TEST Function reference based polymorphism
# TEST Arrays of functions references: to module and protocol functions
# TEST Init of function refs including error case with value = host function
# TEST isUsed for a module function only called indirectly via reference in array (On4.on)

module TestProg {

  +{ #include <stdlib.h> }+

  // Module function references
  // These are init on dcln to fcns.

  // target
  On1.on(uint8)         on1_fref
  On1.on_0()            on1_0_fref
  On2.on(uint8)         on2_fref
  On3.on(uint8)         on3_fref

  host On1.on_0()       on1_0_hfref

  // Protocol function references
  // These are init on dcln to null.

  // target
  OnP.on(uint8)         onP_targ_fref
  // host
  host OnP.on(uint8)    onP_host_fref


  // Case 1. this s a host function reference to a target function: okay
  host On3.on(uint8)  on3_host_fref

  // Case 2. this s a target function reference to a host function: error
  On1.on_2_0()            on1_fref_2   

  // Case 3. this s a host function reference to a host function: error
  host On1.on_2_0()       on1_fref_3

  // Case 4. this s a target function reference to a target function: okay
  On1.on_0()              on1_0_fref_4
 

  // Arrays
  //  host array initialized to host fcn ref of target function
  host On3.on on_host_functions[3] = { on3_host_fref } 

  //  target array initialized to target fcn ref of target function
  On3.on on_functions[3] = { on1_fref, on2_fref, on3_fref }

  // This gets a javascript undefined value for the function ref initializer
  //host OnP.on on_host_functions[3] = { on3_host_fref }

  // using the signature with function name gives parse error
  //OnP.on(uint8) on_functions[3] = { on1_fref, on2_fref, on3_fref }

  // element type is a protocol function
  OnP.on on_functions_proto[3] = { on1_fref, on2_fref, on3_fref }

  // array init directly to fcn name, not fcn ref variable
  On3.on on_function_by_name[4] = { On1.on, On2.on, On3.on, On4.on }
  
  pollen.run() {
    print "1. Init on1_0_fref with assignment, then use it to call On1.on_0(), no args.\n"
    on1_0_fref = On1.on_0
    on1_0_fref()

    print "2. Init on1_fref with assignment, then use it to call On1.on(), with arg=8.\n"
    on1_fref = On1.on
    on1_fref(8)

    print "3. Init on2_fref on dcln, then use it to call On2.on(), with arg=3.\n"
    on2_fref(3)

    print "4. Init on2_fref with assignment, then use it to call On3.on(), with arg=7.\n"
    on2_fref = On3.on
    on2_fref(7)

    print "5. Array of fcn refs: target array, target fcnrefs, target fcns, with arg=array index.\n"
    for (uint8 i = 0; i < 3; i++) {
       on_functions[i](i)
    }
    print "6. Array of fcn refs: host array, host fcnrefs, target fcns, with arg=array index.\n"
    for (i = 0; i < 3; i++) {
       on_host_functions[i](i)
    }
    print "7. Protocol function type for function ref Array, with arg=array index.\n"
    for (i = 0; i < 3; i++) {
       on_functions_proto[i](i)
    }
    print "8. Array of function refs init from function names, with arg=array index.\n"
    for (i = 0; i < 4; i++) {
       on_function_by_name[i](i)
    }
    print "9. Array of function refs init from function names, with arg=array index.\n"
    on_function_by_name[3] = On5.on
    for (i = 0; i < 4; i++) {
       on_function_by_name[i](i)
    }
    +{ exit(0) }+
  }

}
