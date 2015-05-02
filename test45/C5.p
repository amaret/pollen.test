#import C4   
from C4 import M1
from C4 import N
# TEST Multiple levels of compositions that change
# TEST export list
# Note if C5 extends C4 M1.bar is found
composition C5 { # different exports than C4, no M1.foo
  export M1.bar
  export N.bar
}
