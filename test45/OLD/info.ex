from compos import mod   // pkg and from are not equal

from pkg import mod      // pkg & from are equal 
import mod               // pkg & from are equal (pkg is default pkg)

import compos            // pkg & from are equal
from pkg import compos   // pkg & from are equal

I need to distinguish
  import mod    // which imports one thing
  import compos // which imports the imports of compos, multiple things



This is difficult because 
sequences of imported compositions across files import and export modules
and in those sequences the module imports have a unit type of composition (sometimes).

If the package is the default package then the 'from' is never a composition.

I want to disallow
  from compos import mod
  import compos
If I save a table of unitnames
and check each 'from' name against it, 
if there is a match, that's an error. 





TEST3: from C3 import P
   import chain:
   import M as N   
   from C1 import N as P
   from C3 import P

'from test45 import M As N, name N '
Key should be P => from the IMPORT
# TEST N.foo() should get message not exported

TEST4: import C4 
   import chain:
   C4 import of M1
'from test45 import M1 As NIL, name M1'
Key should be M1 => from the NEW SYMBOL
from C4 import M1
# TEST Should get message that M1.bar() not exported
